import 'package:competitive_calendar/utils/email_auth.dart';

import 'package:competitive_calendar/widgets/header-bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginSignUpPage extends StatefulWidget {
  LoginSignUpPage({this.params, this.auth, this.onSignedIn});

  final Map params;
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => new _LoginSignUpPageState();
}

enum FormMode { LOGIN, SIGNUP, FORGOTPASSWORD }

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  // Initial form is login form
  FormMode _formMode = FormMode.LOGIN;
  bool _isIos;
  bool _isLoading;

  // Check if form is valid before perform login or signup
  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or signup
  void _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (_validateAndSave()) {
      String userId = "";
      try {
        if (_formMode == FormMode.LOGIN) {
          userId = await widget.auth.signIn(_email, _password);
        } else if (_formMode == FormMode.SIGNUP) {
          userId = await widget.auth.signUp(_email, _password);
          widget.auth.sendEmailVerification();
          _showVerifyEmailSentDialog();
        } else {
          widget.auth.sendPasswordReset(_email);
          _showPasswordEmailSentDialog();
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 &&
            userId != null &&
            _formMode == FormMode.LOGIN) {
          widget.onSignedIn();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _isIos ? _errorMessage = e.details : _errorMessage = e.message;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    super.initState();
  }

  void _changeFormToSignUp() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }

  void _changeFormToLogin() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.LOGIN;
    });
  }

  void _changeFormToPasswordReset() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.FORGOTPASSWORD;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              SignUpPageAppBar(),
              SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 768,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("dsalgo.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          "Welcome to the family of 24 Million Coders around the globe",
                          style: GoogleFonts.lobster(
                            color: Colors.pink[100],
                            fontSize: 30,
                          ),
                        ),
                        _showBody(),
                        _showCircularProgress(),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
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
                _changeFormToLogin();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showPasswordEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Forgot your password"),
          content: new Text("An email has been sent to reset your password"),
          actions: <Widget>[
            // ignore: deprecated_member_use
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                _changeFormToLogin();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _showBody() {
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Form(
        key: _formKey,
        child: new Column(
          children: <Widget>[
            _showEmailInput(),
            SizedBox(
              height: 20,
            ),
            _showPasswordInput(),
            SizedBox(
              height: 20,
            ),
            _showPrimaryButton(),
            SizedBox(
              height: 20,
            ),
            _showSecondaryButton(),
            SizedBox(
              height: 10,
            ),
            _showForgotPasswordButton(),
            SizedBox(
              height: 20,
            ),
            _showErrorMessage(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget _showEmailInput() {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget _showPasswordInput() {
    if (_formMode != FormMode.FORGOTPASSWORD) {
      return Container(
        width: MediaQuery.of(context).size.width / 3,
        child: new TextFormField(
          maxLines: 1,
          obscureText: true,
          autofocus: false,
          decoration: new InputDecoration(
              hintText: 'Password',
              icon: new Icon(
                Icons.lock,
                color: Colors.grey,
              )),
          validator: (value) =>
              value.isEmpty ? 'Password can\'t be empty' : null,
          onSaved: (value) => _password = value.trim(),
        ),
      );
    } else {
      return new Text(
          'An email will be sent allowing you to reset your password',
          style: new TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300));
    }
  }

  Widget _showPrimaryButton() {
    return new Container(
        width: 150,
        child: SizedBox(
          height: 40.0,
          // ignore: deprecated_member_use
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: widget.params['buttonColor'],
            child: _textPrimaryButton(),
            onPressed: _validateAndSubmit,
          ),
        ));
  }

  Widget _showSecondaryButton() {
    // ignore: deprecated_member_use
    return Container(
      width: 150,
      // ignore: deprecated_member_use
      child: new FlatButton(
        child: _textSecondaryButton(),
        onPressed: _formMode == FormMode.LOGIN
            ? _changeFormToSignUp
            : _changeFormToLogin,
      ),
    );
  }

  Widget _showForgotPasswordButton() {
    // ignore: deprecated_member_use
    return Container(
      width: 150,
      // ignore: deprecated_member_use
      child: new FlatButton(
        child: _formMode == FormMode.LOGIN
            ? new Text('Forgot password?',
                style:
                    new TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300))
            : new Text('',
                style:
                    new TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300)),
        onPressed: _changeFormToPasswordReset,
      ),
    );
  }

  Widget _textPrimaryButton() {
    switch (_formMode) {
      case FormMode.LOGIN:
        return new Text(
          'Login',
          style: new TextStyle(fontSize: 15.0, color: Colors.white),
        );
        break;
      case FormMode.SIGNUP:
        return new Text(
          'Create account',
          style: new TextStyle(fontSize: 15.0, color: Colors.white),
        );
        break;
      case FormMode.FORGOTPASSWORD:
        return new Text(
          'Reset password',
          style: new TextStyle(fontSize: 15.0, color: Colors.white),
        );
        break;
    }
    return new Spacer();
  }

  Widget _textSecondaryButton() {
    switch (_formMode) {
      case FormMode.LOGIN:
        return new Text('Create an account',
            style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300));
        break;
      case FormMode.SIGNUP:
        return new Text('Have an account? Sign in',
            style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300));
        break;
      case FormMode.FORGOTPASSWORD:
        return new Text('Enter your email address or ... Cancel',
            style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300));
        break;
    }
    return new Spacer();
  }
}
