import 'package:competitive_calender/constants/google_singin_button.dart';
import 'package:competitive_calender/constants/reusable_card.dart';
import 'package:competitive_calender/utils/authentication.dart';
import 'package:flutter/material.dart';

final Color firebaseOrange = Color(0xFFF57C00);

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
        child: Column(
          children: <Widget>[
            SignUpAppBar(),
            SizedBox(
              height: 100,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage(
                      "signup.PNG",
                    ),
                    width: 950,
                    height: 600,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          "Welcome to Family",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 60,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "A workspace to over 26.9 million coders around\nthe global world.",
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        FutureBuilder(
                          future: Authentication.initializeFirebase(
                              context: context),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text('Error initializing Firebase');
                            } else if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return GoogleSignInButton();
                            }
                            return CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                firebaseOrange,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
