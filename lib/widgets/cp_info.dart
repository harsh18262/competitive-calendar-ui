import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CpInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    fontWeight: FontWeight.w500,
                  ),
                  presetFontSizes: [40, 30, 15],
                ),
                SizedBox(
                  height: 20,
                ),
                AutoSizeText(
                  "Programming… Competitive Programming…",
                  style: GoogleFonts.indieFlower(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  presetFontSizes: [35, 20, 15],
                ),
                SizedBox(
                  height: 20,
                ),
                AutoSizeText(
                  "It teaches you how to think?.",
                  style: GoogleFonts.permanentMarker(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                  presetFontSizes: [30, 20, 15],
                ),
                SizedBox(
                  height: 20,
                ),
                AutoSizeText(
                  "If you are a programmer you might have understood\nthe deep meaning of these lines quoted by Steve Jobs\nand you might have also experienced that even after\nshutting your computer you keep on thinking about\nprogramming stuff or code you have written in your\nproject.Once you enter in programming you just don’t\nlearn how to code but you also learn the “art of thinking”,\nby breaking your code into smaller chunks and then \nusing your logic-based creativity to solve a problem\nfrom different angles.",
                  style: GoogleFonts.architectsDaughter(
                    color: Colors.black,
                  ),
                  presetFontSizes: [30, 15, 10],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
