import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CityWeather extends StatelessWidget {
  const CityWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 50.h,
              left: 15.w,
              right: 15.w,
            ),
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
