// ignore_for_file: camel_case_types, use_key_in_widget_constructors, avoid_print, file_names
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/screens/logedScreens/homePage.dart';
import 'package:food_app/screens/users/userModel.dart';
import 'package:food_app/widget/primarybtn.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class profileImage extends StatefulWidget {
  String password;
  String email;
  String fname;
  String lname;
  String location;
  profileImage({
    required this.email,
    required this.fname,
    required this.lname,
    required this.password,
    required this.location,
  });

  @override
  State<profileImage> createState() => _profileImageState();
}

class _profileImageState extends State<profileImage> {
  String purl = '';
  final ImagePicker _picker = ImagePicker();
  File? imageinGallery;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform.translate(
            offset: const Offset(100, -200),
            child: Transform.rotate(
              angle: pi / 5,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage('assets/BgPattern.png'),
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 50.h,
                horizontal: 25.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      // Container(
                      //   width: 40,
                      //   height: 40,
                      //   decoration: BoxDecoration(
                      //     color: HexColor('#F9A84D').withOpacity(0.2),
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      //   child: IconButton(
                      //     icon: Image.asset(
                      //       'assets/icons/back.png',
                      //       color: HexColor('#DA6317'),
                      //     ),
                      //     onPressed: () {
                      //       Navigator.pop(context);
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Text(
                      'Upload your photo\nprofile',
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    'This data will be displayed in your account\nprofile for security',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  imageinGallery != null
                      ? Center(
                          child: Image.file(
                            imageinGallery!,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Center(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () => pickInGallery(),
                                child: Container(
                                  width: 250.w,
                                  height: 70.h,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 70,
                                          offset: const Offset(2, 20),
                                          color: HexColor('#15BE77')
                                              .withOpacity(0.1),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0.w),
                                    child: const Image(
                                      image: AssetImage(
                                          'assets/icons/gallery.png'),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 250.w,
                                  height: 70.h,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 70,
                                          offset: const Offset(2, 20),
                                          color: HexColor('#15BE77')
                                              .withOpacity(0.1),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0.w),
                                    child: const Image(
                                      image:
                                          AssetImage('assets/icons/camera.png'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  SizedBox(height: 35.h),
                  Center(
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () {
                        signup();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      padding: const EdgeInsets.all(0.0),
                      child: primatyButton(btnText: 'Create Account'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future pickInGallery() async {
    try {
      final imageinGallery =
          await _picker.pickImage(source: ImageSource.gallery);
      if (imageinGallery == null) return;
      final imageTemp = File(imageinGallery.path);
      setState(() {
        this.imageinGallery = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Fiale dfdff: $e');
    }
  }

  Future signup() async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: widget.email,
          password: widget.password,
        )
        .then((value) => {postDetailsTOFirebase()})
        .catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
  }

  postDetailsTOFirebase() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = widget.fname;
    userModel.lastName = widget.lname;
    userModel.location = widget.location;
    userModel.pictureUrl = '';
    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: 'account create');
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(
          builder: (context) => const homePage(),
        ),
        (route) => false);
  }
}
