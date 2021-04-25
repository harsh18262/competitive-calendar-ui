import 'package:competitive_calender/constants/reusable_card.dart';
import 'package:competitive_calender/screens/signup_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';
import 'package:flutter/material.dart';

class HeaderBar extends StatefulWidget {
  @override
  _HeaderBarState createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Competitive Calendar",
            style: GoogleFonts.dancingScript(
              color: Colors.blue[600],
              fontSize: 45,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            width: 450,
          ),
          HoverButton(
            onpressed: () {},
            minWidth: 150,
            hoverColor: Color(0XFFC5CAE9),
            child: ReusableCard(text: 'Home'),
          ),
          SizedBox(
            width: 75,
          ),
          HoverButton(
            onpressed: () {},
            minWidth: 175,
            hoverColor: Color(0XFFC5CAE9),
            child: ReusableCard(text: 'About Us'),
          ),
          SizedBox(
            width: 50,
          ),
          HoverButton(
            onpressed: () {},
            minWidth: 200,
            hoverColor: Color(0XFFC5CAE9),
            child: ReusableCard(text: 'Contact Us'),
          ),
          SizedBox(
            width: 75,
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
            minWidth: 225,
            hoverColor: Color(0XFFC5CAE9),
            child: ReusableCard(text: 'Login/SignUp'),
          ),
        ],
      ),
    );
  }
}
