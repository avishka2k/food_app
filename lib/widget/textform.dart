import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  String fieldName;
  String hintText;
  String? errormsg;
  bool readOnly;
  void Function()? onTap;


  AppTextFormField({
    super.key,
    this.controller,
    required this.fieldName,
    required this.hintText,
    this.errormsg,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: appFieldPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Text(
              fieldName,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return errormsg;
              }
              return null;
            },
            readOnly: readOnly,
            onTap: onTap,
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 1.0),
                borderRadius: appBorderRadius,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
