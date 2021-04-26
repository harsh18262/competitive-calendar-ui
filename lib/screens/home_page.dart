import 'package:competitive_calender/widgets/cp_info.dart';
import 'package:competitive_calender/widgets/header-bar.dart';
import 'package:competitive_calender/widgets/image-slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 50),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
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
            ],
          ),
        ),
      ),
    );
  }
}
