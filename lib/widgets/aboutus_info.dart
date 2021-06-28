import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class AboutUsSection extends StatelessWidget {
  String name;
  String imageId;
  String gitLink;
  String linkedinLink;
  AboutUsSection({this.name, this.imageId, this.gitLink, this.linkedinLink});

  launchgitURL() async {
    String url = gitLink;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchLinkedinURL() async {
    String url = linkedinLink;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRect(
          child: Container(
            width: 250,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(imageId),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          name,
          style: GoogleFonts.playfairDisplay(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: launchgitURL,
              child: SvgPicture.asset(
                "assets/github.svg",
                width: 50,
                height: 50,
              ),
            ),
            GestureDetector(
              onTap: launchLinkedinURL,
              child: SvgPicture.asset(
                "assets/linkedin.svg",
                width: 50,
                height: 50,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
