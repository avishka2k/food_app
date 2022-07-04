import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/screens/auth/authService.dart';
import 'package:food_app/screens/emialVerify/sendemail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (BuildContext context, Widget? child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          title: 'Food Application',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: userSignin().handelAuthSatate()),
    );
  }
}
