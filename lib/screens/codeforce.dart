import 'package:competitive_calendar/API/data.dart';
import 'package:competitive_calendar/API/models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

import 'codechef.dart';
import 'hackerearth.dart';
import 'hackerrank.dart';

class CodeForce extends StatefulWidget {
  @override
  _CodeForceState createState() => _CodeForceState();
}

class _CodeForceState extends State<CodeForce> {
  Contest contest = Contest();
  // ignore: deprecated_member_use
  List<Article> articles = List<Article>();
  getandSetData() async {
    await contest.getContestDataCodeForces();
    articles = contest.articles;
    setState(() {});
  }

  @override
  void initState() {
    getandSetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => CodeChef()))
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                        child: Container(
                          height: 180,
                          width: 450,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)),
                          child: ClipRRect(
                            child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                "assets/codechef.png",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CodeForce()));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                        child: Container(
                          height: 180,
                          width: 450,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)),
                          child: ClipRRect(
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/codeforces.png",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HackerRank()));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                        child: Container(
                          height: 180,
                          width: 450,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)),
                          child: ClipRRect(
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/HackerRank.png",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HackerEarth()));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                        child: Container(
                          height: 180,
                          width: 450,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)),
                          child: ClipRRect(
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/hackerearth.png",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 450,
                    child: Text(
                      "Contest Name",
                      style: GoogleFonts.mcLaren(),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Platform",
                      style: GoogleFonts.mcLaren(),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Phase",
                      style: GoogleFonts.mcLaren(),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Start Date",
                      style: GoogleFonts.mcLaren(),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Start Time",
                      style: GoogleFonts.mcLaren(),
                    ),
                  ),
                  Container(
                    child: Text(
                      "End Time",
                      style: GoogleFonts.mcLaren(),
                    ),
                  ),
                  Container(
                    child: Text(
                      "End Date",
                      style: GoogleFonts.mcLaren(),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: articles.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ContestTileWeb(
                    name: articles[index].name,
                    url: articles[index].url,
                    platform: articles[index].platform,
                    phase: articles[index].phase,
                    startdate: articles[index].startdate,
                    enddate: articles[index].enddate,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ContestTileWeb extends StatelessWidget {
  String name, phase, platform, url;
  DateTime startdate, enddate;
  ContestTileWeb(
      {this.name,
      this.phase,
      this.platform,
      this.url,
      this.startdate,
      this.enddate});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 450,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                HoverButton(
                  onpressed: () {
                    launch(url);
                  },
                  textColor: Colors.blue[400],
                  child: Text(
                    name,
                    style: TextStyle(),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(platform),
              SizedBox(
                height: 25,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(phase),
              SizedBox(
                height: 25,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                DateFormat('dd-MMM-yyyy').format(startdate.toLocal()),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                DateFormat('KK:mm:a').format(startdate.toLocal()),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                DateFormat('KK:mm:a').format(enddate.toLocal()),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                DateFormat('dd-MMM-yyyy').format(enddate.toLocal()),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
