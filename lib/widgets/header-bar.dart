import 'package:competitive_calendar/constants/reusable_card.dart';
import 'package:competitive_calendar/res/root.dart';
import 'package:competitive_calendar/screens/about_us.dart';
import 'package:competitive_calendar/screens/home_page.dart';

import 'package:competitive_calendar/utils/email_auth.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';
import 'package:flutter/material.dart';

class HeaderBar extends StatefulWidget {
  @override
  _HeaderBarState createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {
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
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            child: Text(
              "Competitive Calendar",
              style: GoogleFonts.dancingScript(
                color: Colors.blue[600],
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HoverButton(
                onpressed: () {},
                hoverColor: Color(0XFFC5CAE9),
                minWidth: MediaQuery.of(context).size.width / 15,
                child: ReusableCard(text: 'Home'),
              ),
              HoverButton(
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUs(),
                    ),
                  );
                },
                hoverColor: Color(0XFFC5CAE9),
                minWidth: MediaQuery.of(context).size.width / 12,
                child: ReusableCard(text: 'About Us'),
              ),
              HoverButton(
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => new RootPage(
                        params: params,
                        auth: new Auth(),
                      ),
                    ),
                  );
                },
                hoverColor: Color(0XFFC5CAE9),
                minWidth: MediaQuery.of(context).size.width / 9,
                child: ReusableCard(text: 'Login/SignUp'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SignUpPageAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            child: Text(
              "Competitive Calendar",
              style: GoogleFonts.dancingScript(
                color: Colors.blue[600],
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HoverButton(
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                hoverColor: Color(0XFFC5CAE9),
                minWidth: MediaQuery.of(context).size.width / 15,
                child: ReusableCard(text: 'Home'),
              ),
              HoverButton(
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUs(),
                    ),
                  );
                },
                hoverColor: Color(0XFFC5CAE9),
                minWidth: MediaQuery.of(context).size.width / 12,
                child: ReusableCard(text: 'About Us'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AboutUsAppBar extends StatelessWidget {
  const AboutUsAppBar({
    Key key,
    @required this.params,
  }) : super(key: key);

  final Map<String, Object> params;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            child: Text(
              "Competitive Calendar",
              style: GoogleFonts.dancingScript(
                color: Colors.blue[600],
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HoverButton(
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                hoverColor: Color(0XFFC5CAE9),
                minWidth: MediaQuery.of(context).size.width / 15,
                child: ReusableCard(text: 'Home'),
              ),
              HoverButton(
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => new RootPage(
                        params: params,
                        auth: new Auth(),
                      ),
                    ),
                  );
                },
                hoverColor: Color(0XFFC5CAE9),
                minWidth: MediaQuery.of(context).size.width / 9,
                child: ReusableCard(text: 'Login/SignUp'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
