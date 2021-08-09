import 'package:competitive_calendar/helper/api.dart';
import 'package:competitive_calendar/helper/model.dart';
import 'package:competitive_calendar/res/custom_colors.dart';
import 'package:competitive_calendar/screens/codeforces.dart';
import 'package:competitive_calendar/screens/hackerearth.dart';
import 'package:competitive_calendar/screens/running.dart';
import 'package:competitive_calendar/utils/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'codechef.dart';
import 'hackerrank.dart';
import 'login_screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';

import 'upcoming.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late User _user;
  bool _isSigningOut = false;
  bool isloading = false;
  List<Article> articles = [];
  Contest contest = Contest();
  getandSetData() async {
    await contest.getContestData();
    articles = contest.articles;
    setState(() {
      isloading = true;
    });
  }

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignInScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = widget._user;
    getandSetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text("Competitive Calendar", style: GoogleFonts.mcLaren()),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _user.photoURL != null
                ? CircleAvatar(
                    radius: 25,
                    child: ClipOval(
                      child: Material(
                        color: CustomColors.firebaseGrey.withOpacity(0.3),
                        child: Image.network(
                          _user.photoURL!,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  )
                : ClipOval(
                    child: Material(
                      color: CustomColors.firebaseGrey.withOpacity(0.3),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.person,
                          size: 25,
                          color: CustomColors.firebaseGrey,
                        ),
                      ),
                    ),
                  ),
            SizedBox(height: 20),
            HoverButton(
              onpressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CodeChefData()));
              },
              child: Text(
                "CodeChef",
                style: GoogleFonts.mcLaren(),
              ),
            ),
            SizedBox(height: 20),
            HoverButton(
              onpressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CodeForces()));
              },
              child: Text(
                "CodeForces",
                style: GoogleFonts.mcLaren(),
              ),
            ),
            SizedBox(height: 20),
            HoverButton(
              onpressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HackerRank()));
              },
              child: Text(
                "HackerRank",
                style: GoogleFonts.mcLaren(),
              ),
            ),
            SizedBox(height: 20),
            HoverButton(
              onpressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HackerEarth()));
              },
              child: Text(
                "HackerEarth",
                style: GoogleFonts.mcLaren(),
              ),
            ),
            SizedBox(height: 20),
            HoverButton(
              onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RunningPhaseData()));
              },
              child: Text(
                "Running Phase",
                style: GoogleFonts.mcLaren(),
              ),
            ),
            SizedBox(height: 20),
            HoverButton(
              onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpcomingPhaseData()));
              },
              child: Text(
                "Upcoming Phase",
                style: GoogleFonts.mcLaren(),
              ),
            ),
            SizedBox(height: 20),
            _isSigningOut
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.redAccent,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        _isSigningOut = true;
                      });
                      await Authentication.signOut(context: context);
                      setState(() {
                        _isSigningOut = false;
                      });
                      Navigator.of(context)
                          .pushReplacement(_routeToSignInScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              isloading == true
                  ? ListView.builder(
                      physics: ClampingScrollPhysics(),
                      itemCount: articles.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ContestTile(
                          name: articles[index].name,
                          url: articles[index].url,
                          platform: articles[index].platform,
                          phase: articles[index].phase,
                          startdate: articles[index].startdate,
                          enddate: articles[index].enddate,
                        );
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class ContestTile extends StatelessWidget {
  String name, phase, platform, url;
  DateTime startdate, enddate;
  ContestTile(
      {required this.name,
      required this.phase,
      required this.platform,
      required this.url,
      required this.startdate,
      required this.enddate});
  Color getColor() {
    if (phase == "Running") {
      return Colors.lightGreen.shade300;
    } else if (phase == "Ended") {
      return Colors.red.shade300;
    } else if (phase == "Upcoming") {
      return Colors.yellow.shade300;
    }
    return Colors.blueGrey.shade400;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  final RenderObject? box = context.findRenderObject();
                  Share.share(
                      "Contest Name : $name \nPhase : $phase \nUrl: $url \nPlatfrom: $platform \nFrom ${DateFormat('dd-MMM-yyyy').format(startdate.toLocal())} to ${DateFormat('dd-MMM-yyyy').format(enddate.toLocal())} \nTimings :- ${DateFormat('KK:mm:a').format(startdate.toLocal())} to ${DateFormat('KK:mm:a').format(enddate.toLocal())}");
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.share),
                    ],
                  ),
                ),
              ),
              Text(name),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Phase :-'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(phase),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Platform :-'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(platform),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Start Date :-'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    DateFormat('dd-MMM-yyyy').format(startdate.toLocal()),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('from'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    DateFormat('KK:mm:a').format(startdate.toLocal()),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('to'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    DateFormat('KK:mm:a').format(enddate.toLocal()),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('End Date :-'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    DateFormat('dd-MMM-yyyy').format(enddate.toLocal()),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  launch(url);
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.link),
                    ],
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: getColor(),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
