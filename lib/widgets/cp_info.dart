import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CpInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image(
            image: AssetImage(
              "assets/cp.png",
            ),
            width: MediaQuery.of(context).size.width,
            height: 600,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "What is Competitive Programming??",
            style: GoogleFonts.originalSurfer(
              color: Colors.pink[100],
              fontSize: 50,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Programming… Competitive Programming…",
            style: GoogleFonts.indieFlower(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "It teaches you how to think?.",
            style: GoogleFonts.permanentMarker(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2.5,
            child: Text(
              "If you are a programmer you might have understood the deep meaning of these lines quoted by Steve Jobs and you might have also experienced that even after shutting your computer you keep on thinking about programming stuff or code you have written in your project.Once you enter in programming you just don’t learn how to code but you also learn the “art of thinking”, by breaking your code into smaller chunks and then using your logic-based creativity to solve a problem from different angles.",
              style: GoogleFonts.architectsDaughter(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
