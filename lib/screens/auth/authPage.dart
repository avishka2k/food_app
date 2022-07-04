// // ignore_for_file: camel_case_types

// import 'package:flutter/material.dart';
// import 'package:food_app/screens/login.dart';
// import 'package:food_app/screens/signup.dart';

// class authPage extends StatefulWidget {
//   const authPage({Key? key}) : super(key: key);

//   @override
//   State<authPage> createState() => _authPageState();
// }

// class _authPageState extends State<authPage> {
//   bool showLoginPage = true;

//   void toggleScreens() {
//     setState(() {
//       showLoginPage = !showLoginPage;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showLoginPage) {
//       return login();
//     } else {
//       return signup(showLoginPage: toggleScreens);
//     }
//   }
// }
