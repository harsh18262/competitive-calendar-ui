import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CpInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SizerUtil.deviceType == DeviceType.mobile
            ? Container(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(
                        "assets/cp.png",
                      ),
                      width: MediaQuery.of(context).size.width / 2.45,
                      height: 600,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "What is Competitive Programming??",
                      style: GoogleFonts.originalSurfer(
                        color: Colors.pink[100],
                        fontSize: 30,
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
                        fontSize: 25,
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
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "If you are a programmer you might have understood\nthe deep meaning of these lines quoted by Steve Jobs\nand you might have also experienced that even after\nshutting your computer you keep on thinking about\nprogramming stuff or code you have written in your\nproject.Once you enter in programming you just don’t\nlearn how to code but you also learn the “art of thinking”,\nby breaking your code into smaller chunks and then \nusing your logic-based creativity to solve a problem\nfrom different angles.",
                      style: GoogleFonts.architectsDaughter(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: AssetImage(
                        "assets/cp.png",
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
                          Text(
                            "What is Competitive Programming??",
                            style: GoogleFonts.originalSurfer(
                              color: Colors.pink[100],
                              fontSize: 40,
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
                              fontSize: 30,
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
              ));
  }
}
