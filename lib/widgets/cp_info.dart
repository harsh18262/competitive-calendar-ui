import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CpInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
          ),
          Image(
            image: AssetImage(
              "cp.PNG",
            ),
            width: 950,
            height: 600,
          ),
          SizedBox(
            width: 50,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "What is Competitive Programming??",
                  style: GoogleFonts.originalSurfer(
                    color: Colors.blue[600],
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Programming… Competitive Programming…",
                  style: TextStyle(
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
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "If you are a programmer you might have understood\nthe deep meaning of these lines quoted by Steve Jobs\nand you might have also experienced that even after\nshutting your computer you keep on thinking about\nprogramming stuff or code you have written in your\nproject.Once you enter in programming you just don’t\nlearn how to code but you also learn the “art of thinking”,\nby breaking your code into smaller chunks and then \nusing your logic-based creativity to solve a problem\nfrom different angles.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
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
