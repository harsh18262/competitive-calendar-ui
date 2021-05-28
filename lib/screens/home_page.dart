import 'package:competitive_calendar/API/data.dart';
import 'package:competitive_calendar/API/models.dart';
import 'package:competitive_calendar/widgets/cp_info.dart';
import 'package:competitive_calendar/widgets/header-bar.dart';
import 'package:competitive_calendar/widgets/image-slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Contest contest = Contest();
  // ignore: deprecated_member_use
  List<Article> articles = List<Article>();
  getandSetData() async {
    await contest.getContestData();
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
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HeaderBar(),
              SizedBox(
                height: 50,
              ),
              ImageSlider(),
              SizedBox(
                height: 100,
              ),
              CpInfo(),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
