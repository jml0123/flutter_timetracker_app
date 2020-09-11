import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/email_sign_in_page.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_flutter_course/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';
import 'package:time_tracker_flutter_course/services/auth_provider.dart';



class SignInPage extends StatelessWidget {
  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      final auth = AuthProvider.of(context);
      await auth.signInAnonymously();
    }
    // TODO Show alert dialog
    catch(err){
      print(err.toString());
    }
  }


  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final auth = AuthProvider.of(context);
      await auth.signInWithGoogle();
    }
    // TODO Show alert dialog
    catch(err){
      print(err.toString());
    }
  }


  void _signInWithEmail(BuildContext context) {
    final auth = AuthProvider.of(context);
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 1,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }



  Widget _buildContent(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Sign In',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(height: 48.0),
            SocialSignInButton(
              assetName: "images_logos/google-logo.png",
              text: "Sign in with Google",
              textColor: Colors.black87,
              color: Colors.white,
              onPressed: () => _signInWithGoogle(context),
            ),
            SizedBox(height: 8.0),
            SocialSignInButton(
              assetName: "images_logos/facebook-logo.png",
              text: "Sign in with Facebook",
              textColor: Colors.white,
              onPressed: () {},
              color: Color(0xFF334D92),
            ),
            SizedBox(height: 8.0),
            SignInButton(
              text: "Sign in with email",
              textColor: Colors.white,
              onPressed: () => _signInWithEmail(context),
              color: Colors.teal[700],
            ),
            SizedBox(height: 8.0),
            Text(
              'or',
              style: TextStyle(fontSize: 14.0, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            SignInButton(
              text: "Go anonymous",
              textColor: Colors.black,
              color: Colors.lime[300],
              onPressed: () => _signInAnonymously(context),
      ),
    ],
    ));
    }
  }

