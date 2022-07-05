// ignore_for_file: camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/screens/introducion.dart';
import 'package:food_app/screens/logedScreens/homePage.dart';

class userSignin {
  handelAuthSatate() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return const homePage();
        } else {
          return introducionPage();
        }
      },
    );
  }
}
