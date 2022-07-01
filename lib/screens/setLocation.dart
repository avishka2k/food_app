// ignore_for_file: camel_case_types, use_key_in_widget_constructors, file_names
import 'dart:math';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

String selectCountry = '';
bool countrySelected = false;
String countryFlag = '';

class setLocation extends StatefulWidget {
  @override
  State<setLocation> createState() => _setLocationState();
}

class _setLocationState extends State<setLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform.translate(
            offset: const Offset(-0, -180),
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
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 50.h,
              horizontal: 25.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: HexColor('#F9A84D').withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: Image.asset(
                          'assets/icons/back.png',
                          color: HexColor('#DA6317'),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Text(
                    'Set Your Location',
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.h),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 100,
                          offset: const Offset(0, 20),
                          color: HexColor('#15BE77').withOpacity(0.1),
                        )
                      ],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                      child: Row(
                        children: [
                          countrySelected == true
                              ? Text(
                                  countryFlag,
                                  style: const TextStyle(fontSize: 30),
                                )
                              : const Image(
                                  image:
                                      AssetImage('assets/icons/location.png'),
                                ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Text(
                              countrySelected == true
                                  ? selectCountry
                                  : 'Your Location',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 100,
                          offset: const Offset(0, 20),
                          color: HexColor('#15BE77').withOpacity(0.1),
                        )
                      ],
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize:
                              Size(MediaQuery.of(context).size.width, 40)),
                      onPressed: () {
                        showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                            flagSize: 25,
                            backgroundColor: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey,
                            ),
                            bottomSheetHeight: 500,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            inputDecoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0.2.w,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                              hintText: 'Start typing to search',
                              labelText: 'Search',
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: HexColor('#15BE77'),
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                          showPhoneCode: true,
                          onSelect: (Country country) {
                            setState(() {
                              selectCountry = country.displayNameNoCountryCode;
                              countryFlag = country.flagEmoji.toString();
                              countrySelected = true;
                            });
                          },
                        );
                      },
                      child: Text(
                        'Set Location',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
