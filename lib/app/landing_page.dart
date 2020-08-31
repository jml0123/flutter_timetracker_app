import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/home_page.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_page.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class LandingPage extends StatelessWidget {
  LandingPage({@required this.auth});
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: auth.onAuthStateChanged,
      // Every time there is a new value in stream
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return SignInPage(
              // Callback that happens after user has signed in
              // onSignIn and _updateUser have the same signature
              // Both take in a type of FirebaseUser
              auth: auth,
            );
          }
          // TODO temporary placeholder for homepage
          return HomePage(
            // When sign out, we no longer have reference to firebase user
            // We pass in null because the user will be signed out
            auth: auth,
          );
        }
        else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            )
          );
        }
      },
    );
  }
}
