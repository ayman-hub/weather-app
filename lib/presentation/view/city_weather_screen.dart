import 'dart:developer';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/city_weather_model.dart';
import '../../domain/bloc/city_weather_bloc/city_weather_bloc.dart';

class CityWeather extends StatelessWidget {
  CityWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 50.h,
        left: 15.w,
        right: 15.w,
      ),
      child: BlocBuilder<CityWeatherBloc, CityWeatherState>(
          builder: (context, state) {
        if (state is CityWeatherLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is CityWeatherLoaded) {
          CityWeatherModel? list = state.cityWeatherModel;
          log(list.toJson().toString());
          return Wrap(
            children: [
              ...list.weather!.map((e) {
                return Text("${e.id}  ${list.name} // ${e.icon} // ${e.description}");
                /*int? minTemp = list.main?.tempMin?.toInt();
                int? maxTemp = list.main?.tempMax?.toInt();
                String? description = e.description;
                int? windSpeed = list.wind?.speed?.toInt();
                String? city = list.name;
                return BlurryContainer(
                  height: 80.h,
                  width: MediaQuery.of(context).size.width * 1.0.w,
                  blur: 100,
                  *//* padding: EdgeInsets.symmetric(
                       vertical: 10.h,
                       horizontal: 10.w,
                     ),*//*
                  borderRadius: BorderRadius.circular(20.r),
                  bgColor: Colors.white,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            '$city',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '$minTemp°  $maxTemp°',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '$description',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '$windSpeed',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                );*/
              }).toList(),
            ],
          );
      /*    return GridView.builder(
            itemCount: list.weather!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              int? minTemp = list.main?.tempMin?.toInt();
              int? maxTemp = list.main?.tempMax?.toInt();
              String? description = list.weather?[index].description;
              int? windSpeed = list.wind?.speed?.toInt();
              String? city = list.name;
              return BlurryContainer(
                height: 80.h,
                width: MediaQuery.of(context).size.width * 1.0.w,
                blur: 100,
                *//* padding: EdgeInsets.symmetric(
                       vertical: 10.h,
                       horizontal: 10.w,
                     ),*//*
                borderRadius: BorderRadius.circular(20.r),
                bgColor: Colors.white,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          '$city',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '$minTemp°  $maxTemp°',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '$description',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '$windSpeed',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );*/
        } else {
          return const Text('Something went wrong');
        }
      }),
    );
  }
}
