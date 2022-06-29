import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/onbording1.dart';
import 'package:food_app/screens/signup.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Food Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const signup(),
    );
  }
}
