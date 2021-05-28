import 'package:competitive_calendar/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: GoogleFonts.mcLaren(
          color: Colors.blue[600],
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Competitive Calendar",
            style: GoogleFonts.dancingScript(
              color: Colors.blue[600],
              fontSize: 40,
              fontWeight: FontWeight.w700,
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
                onpressed: () {},
                minWidth: MediaQuery.of(context).size.width / 12,
                hoverColor: Color(0XFFC5CAE9),
                child: ReusableCard(text: 'About Us'),
              ),
              HoverButton(
                onpressed: () {},
                minWidth: MediaQuery.of(context).size.width / 11,
                hoverColor: Color(0XFFC5CAE9),
                child: ReusableCard(text: 'Contact Us'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
