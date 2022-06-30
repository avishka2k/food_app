// ignore_for_file: camel_case_types, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class primatyButton extends StatelessWidget {
  String btnText;
  primatyButton({required this.btnText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190.w,
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              HexColor('53E88B'),
              HexColor('15BE77'),
            ],
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Container(
          constraints: BoxConstraints(
            minWidth: 50.0.w,
            minHeight: 50.0.h,
          ), // min sizes for Material buttons
          alignment: Alignment.center,
          child: Text(
            btnText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
