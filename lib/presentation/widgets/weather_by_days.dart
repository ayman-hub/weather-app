import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../data/model/location_weather_model.dart';
import '../../data/services/api_services.dart';
import '../../domain/bloc/location_weather_bloc/location_weather_bloc.dart';

class WeatherByDays extends StatelessWidget {
  const WeatherByDays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationWeatherBloc, LocationWeatherState>(
        builder: (context, state) {
      if (state is LocationWeatherLoading) {
        return Center(
          child: CupertinoActivityIndicator(),
        );
      } else if (state is LocationWeatherLoaded) {
        List<ListData>? list = state.weatherModel.list;
        return Padding(
          padding: EdgeInsets.only(
            top: 40.h,
            right: 20.w,
            left: 20.w,
          ),
          child: BlurryContainer(
            bgColor: Colors.white,
            blur: 100,
            height: 300.h,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              vertical: 40.h,
              horizontal: 10.w,
            ),
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 30.h,
                );
              },
              itemCount: list!.length,
              itemBuilder: (BuildContext context, int index) {
                int? minTemp = list[index].main?.tempMin?.toInt();
                int? maxTemp = list[index].main?.tempMax?.toInt();
                int? condition = list[index].weather?[0].id?.toInt();
                String? weatherIcon = ApiServices().getWeatherIcon(condition!);
                String? time = list[index].dtTxt;
                DateTime? dateTime = DateTime.parse(time!);
                var day = DateFormat('EEEE').format(dateTime);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      day,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      weatherIcon,
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '$minTemp°',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          '$maxTemp°',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        );
      } else {
        return Container(
          child: Text('Something went wrong'),
        );
      }
    });
  }
}
