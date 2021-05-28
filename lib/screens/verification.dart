import 'package:competitive_calendar/API/data.dart';
import 'package:competitive_calendar/API/models.dart';

import 'package:competitive_calendar/utils/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:hovering/hovering.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage(
      {Key key,
      this.params,
      this.auth,
      this.userId,
      this.onSignedOut,
      User user})
      : super(key: key);

  final Map params;
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Contest contest = Contest();
  // ignore: deprecated_member_use
  List<Article> articles = List<Article>();
  getandSetData() async {
    await contest.getContestData();
    articles = contest.articles;
    setState(() {});
  }

  bool _isEmailVerified = false;

  @override
  initState() {
    super.initState();
    getandSetData();
    _checkEmailVerification().whenComplete(() {
      if (!_isEmailVerified && !widget.params['homePageUnverified']) {
        // sign out if email not verified and the parameter is set to not show to unverified user
        _signOut();
      }
    });
  }

  Future<void> _checkEmailVerification() async {
    _isEmailVerified = await widget.auth.isEmailVerified();
    if (!_isEmailVerified) {
      _showVerifyEmailDialog();
    }
  }

  void _resendVerifyEmail() {
    widget.auth.sendEmailVerification();
    _showVerifyEmailSentDialog();
  }

  void _showVerifyEmailDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content: new Text("Please verify account in the link sent to email"),
          actions: <Widget>[
            // ignore: deprecated_member_use
            new FlatButton(
              child: new Text("Resend verification email"),
              onPressed: () {
                Navigator.of(context).pop();
                _resendVerifyEmail();
              },
            ),
            // ignore: deprecated_member_use
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content:
              new Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            // ignore: deprecated_member_use
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  _signOut() async {
    try {
      await widget.auth.signOut();

      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                height: 50,
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
                    HoverButton(
                      onpressed: () {
                        _signOut();
                      },
                      hoverColor: Color(0XFFC5CAE9),
                      child: Text(
                        "Logout",
                        style: GoogleFonts.mcLaren(
                          color: Colors.blue[600],
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 450,
                    child: Text(
                      "Contest Name",
                    ),
                  ),
                  Container(
                    child: Text("Platform"),
                  ),
                  Container(
                    child: Text("Phase"),
                  ),
                  Container(
                    child: Text("Start Date"),
                  ),
                  Container(
                    child: Text("Start Time"),
                  ),
                  Container(
                    child: Text("End Time"),
                  ),
                  Container(
                    child: Text("End Date"),
                  ),
                ],
              ),
              ListView.builder(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ContestTile extends StatelessWidget {
  String name, phase, platform, url;
  DateTime startdate, enddate;
  ContestTile(
      {this.name,
      this.phase,
      this.platform,
      this.url,
      this.startdate,
      this.enddate});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 450,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                HoverButton(
                  onpressed: () {
                    launch(url);
                  },
                  textColor: Colors.blue[400],
                  child: Text(
                    name,
                    style: TextStyle(),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(platform),
              SizedBox(
                height: 25,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(phase),
              SizedBox(
                height: 25,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                DateFormat('dd-MMM-yyyy').format(startdate.toLocal()),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                DateFormat('KK:mm:a').format(startdate.toLocal()),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                DateFormat('KK:mm:a').format(enddate.toLocal()),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                DateFormat('dd-MMM-yyyy').format(enddate.toLocal()),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
