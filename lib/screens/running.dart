import 'package:competitive_calendar/helper/api.dart';
import 'package:competitive_calendar/helper/model.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class RunningPhaseData extends StatefulWidget {
  const RunningPhaseData({Key? key}) : super(key: key);

  @override
  _RunningPhaseDataState createState() => _RunningPhaseDataState();
}

class _RunningPhaseDataState extends State<RunningPhaseData> {
  List<Article> articles = [];
  Contest contest = Contest();
  bool isloading = false;
  getandSetData() async {
    await contest.getContestDataPhaseRunning();
    articles = contest.articles;
    setState(() {
      isloading = true;
    });
  }

  @override
  void initState() {
    getandSetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            isloading == true
                ? ListView.builder(
                    physics: ClampingScrollPhysics(),
                    itemCount: articles.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ContestTile(
                        name: articles[index].name,
                        url: articles[index].url,
                        platform: articles[index].platform,
                        phase: articles[index].phase,
                        startdate: articles[index].startdate,
                        enddate: articles[index].enddate,
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  )
          ],
        ),
      ),
    ));
  }
}

class ContestTile extends StatelessWidget {
  String name, phase, platform, url;
  DateTime startdate, enddate;
  ContestTile(
      {required this.name,
      required this.phase,
      required this.platform,
      required this.url,
      required this.startdate,
      required this.enddate});
  Color getColor() {
    if (phase == "Running") {
      return Colors.lightGreen.shade300;
    } else if (phase == "Ended") {
      return Colors.red.shade300;
    } else if (phase == "Upcoming") {
      return Colors.yellow.shade300;
    }
    return Colors.blueGrey.shade400;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  final RenderObject? box = context.findRenderObject();
                  Share.share(
                      "Contest Name : $name \nPhase : $phase \nUrl: $url \nPlatfrom: $platform \nFrom ${DateFormat('dd-MMM-yyyy').format(startdate.toLocal())} to ${DateFormat('dd-MMM-yyyy').format(enddate.toLocal())} \nTimings :- ${DateFormat('KK:mm:a').format(startdate.toLocal())} to ${DateFormat('KK:mm:a').format(enddate.toLocal())}");
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.share),
                    ],
                  ),
                ),
              ),
              Text(name),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Phase :-'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(phase),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Platform :-'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(platform),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Start Date :-'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    DateFormat('dd-MMM-yyyy').format(startdate.toLocal()),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('from'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    DateFormat('KK:mm:a').format(startdate.toLocal()),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('to'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    DateFormat('KK:mm:a').format(enddate.toLocal()),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('End Date :-'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    DateFormat('dd-MMM-yyyy').format(enddate.toLocal()),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  launch(url);
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.link),
                    ],
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: getColor(),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
