// ignore_for_file: camel_case_types, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class primatyButton extends StatelessWidget {
  String btnText;
  primatyButton({required this.btnText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 157,
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
          constraints: const BoxConstraints(
              minWidth: 57.0,
              minHeight: 57.0), // min sizes for Material buttons
          alignment: Alignment.center,
          child: Text(
            btnText,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
