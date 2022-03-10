import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weather_app/domain/bloc/location_weather_bloc/location_weather_bloc.dart';
import 'package:weather_app/presentation/widgets/current_weather.dart';
import 'package:weather_app/presentation/widgets/weather_by_days.dart';
import 'package:weather_app/presentation/widgets/weather_by_hours.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocationWeatherBloc>(
          create: (_) => LocationWeatherBloc()
            ..add(
              LocationWeatherEventStarted(),
            ),
        ),
      ],
      child: SafeArea(
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
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CurrentWeather(),
                  WeatherByHours(),
                  WeatherByDays(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
