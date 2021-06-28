import 'package:competitive_calendar/widgets/aboutus_info.dart';
import 'package:competitive_calendar/widgets/header-bar.dart';
import 'package:competitive_calendar/widgets/image-slider.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  static const primarySwatch = Colors.green;
  // button color
  static const buttonColor = Colors.green;
  // app name
  static const appName = 'My App';
  // boolean for showing home page if user unverified
  static const homePageUnverified = false;

  final params = {
    'appName': appName,
    'primarySwatch': primarySwatch,
    'buttonColor': buttonColor,
    'homePageUnverified': homePageUnverified,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              AboutUsAppBar(params: params),
              SizedBox(
                height: 50,
              ),
              ImageSlider(),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width / 5,
                    decoration: BoxDecoration(
                      color: Colors.cyan[50],
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: AboutUsSection(
                      name: "Shashwat Sharma",
                      imageId: "assets/me.jpeg",
                      gitLink: "https://github.com/shashwat2910",
                      linkedinLink:
                          "https://www.linkedin.com/in/shashwat-sharma-79221218a/",
                    ),
                  ),
                  Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width / 5,
                    decoration: BoxDecoration(
                      color: Colors.cyan[50],
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: AboutUsSection(
                      name: "Harshwardhan Mehrotra",
                      imageId: "assets/harsh.jpeg",
                      gitLink: "https://github.com/harsh18262",
                      linkedinLink:
                          "https://www.linkedin.com/in/harshwardhan-mehrotra-84a5571a7/",
                    ),
                  ),
                  Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width / 5,
                    decoration: BoxDecoration(
                      color: Colors.cyan[50],
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: AboutUsSection(
                      name: "Soham Dhande",
                      imageId: "assets/soham.jpeg",
                      gitLink: "https://github.com/stoic-sammy",
                      linkedinLink:
                          "https://www.linkedin.com/in/soham-dhande-b459bb1b0/",
                    ),
                  ),
                  Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width / 5,
                    decoration: BoxDecoration(
                      color: Colors.cyan[50],
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: AboutUsSection(
                      name: "Shreyansh Dubey",
                      imageId: "assets/dubey.jpeg",
                      gitLink: "https://github.com/strikerhacks",
                      linkedinLink:
                          "https://www.linkedin.com/in/shreyansh-dubey-8420331a8/",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
