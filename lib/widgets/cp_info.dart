import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CpInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(
              "cp.PNG",
            ),
            width: MediaQuery.of(context).size.width / 2,
            height: 600,
          ),
          SizedBox(
            width: 25,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  "What is Competitive Programming??",
                  style: GoogleFonts.originalSurfer(
                    color: Colors.pink[100],
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                  ),
                  minFontSize: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                AutoSizeText(
                  "Programming… Competitive Programming…",
                  style: GoogleFonts.indieFlower(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AutoSizeText(
                  "It teaches you how to think?.",
                  style: GoogleFonts.permanentMarker(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AutoSizeText(
                  "If you are a programmer you might have understood\nthe deep meaning of these lines quoted by Steve Jobs\nand you might have also experienced that even after\nshutting your computer you keep on thinking about\nprogramming stuff or code you have written in your\nproject.Once you enter in programming you just don’t\nlearn how to code but you also learn the “art of thinking”,\nby breaking your code into smaller chunks and then \nusing your logic-based creativity to solve a problem\nfrom different angles.",
                  style: GoogleFonts.architectsDaughter(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
