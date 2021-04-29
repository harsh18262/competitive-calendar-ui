import 'package:competitive_calender/constants/reusable_card.dart';
import 'package:competitive_calender/screens/signup_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HeaderBar extends StatefulWidget {
  @override
  _HeaderBarState createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {
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
          AutoSizeText(
            "Competitive Calendar",
            style: GoogleFonts.dancingScript(
              color: Colors.blue[600],
              fontSize: 40,
              fontWeight: FontWeight.w400,
            ),
            minFontSize: 30,
            overflow: TextOverflow.ellipsis,
          ),
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
                onpressed: () {},
                hoverColor: Color(0XFFC5CAE9),
                minWidth: MediaQuery.of(context).size.width / 11,
                child: ReusableCard(text: 'About Us'),
              ),
              HoverButton(
                onpressed: () {},
                hoverColor: Color(0XFFC5CAE9),
                minWidth: MediaQuery.of(context).size.width / 10,
                child: ReusableCard(text: 'Contact Us'),
              ),
              HoverButton(
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupPage(),
                    ),
                  );
                },
                hoverColor: Color(0XFFC5CAE9),
                minWidth: MediaQuery.of(context).size.width / 7,
                child: ReusableCard(text: 'Login/SignUp'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
