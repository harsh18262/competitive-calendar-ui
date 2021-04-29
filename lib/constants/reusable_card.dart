import 'package:auto_size_text/auto_size_text.dart';
import 'package:competitive_calender/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.text});
  late final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: AutoSizeText(
        text,
        style: GoogleFonts.mcLaren(
          color: Colors.blue[600],
          fontWeight: FontWeight.w400,
        ),
        presetFontSizes: [25, 20, 15],
      ),
    );
  }
}

class SignUpAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Competitive Calendar",
            style: GoogleFonts.dancingScript(
              color: Colors.blue[600],
              fontSize: 50,
              fontWeight: FontWeight.w400,
            ),
          ),
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
            child: ReusableCard(text: 'Home'),
          ),
          HoverButton(
            onpressed: () {},
            minWidth: 175,
            hoverColor: Color(0XFFC5CAE9),
            child: ReusableCard(text: 'About Us'),
          ),
          HoverButton(
            onpressed: () {},
            minWidth: 200,
            hoverColor: Color(0XFFC5CAE9),
            child: ReusableCard(text: 'Contact Us'),
          ),
        ],
      ),
    );
  }
}
