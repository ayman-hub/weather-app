import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/location_weather_model.dart';
import '../../data/services/api_services.dart';
import '../../domain/bloc/location_weather_bloc/location_weather_bloc.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationWeatherBloc, LocationWeatherState>(
        builder: (context, state) {
      if (state is LocationWeatherLoading) {
        return Center(
          child: CupertinoActivityIndicator(),
        );
      } else if (state is LocationWeatherLoaded) {
        int? weather = state.weatherModel.list?[0].main?.temp!.toInt();
        String? cityName = state.weatherModel.city?.name;
        int? condition = state.weatherModel.list?[0].weather?[0].id?.toInt();
        String? weatherIcon = ApiServices().getWeatherIcon(condition!);
        print(weather);
        print(cityName);
        return BlurryContainer(
          height: 120.h,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          borderRadius: BorderRadius.circular(20.r),
          bgColor: Colors.white.withOpacity(0.5),
          blur: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cityName!,
                style: TextStyle(
                  fontSize: 30.sp,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    '$weather°',
                    style: TextStyle(
                      fontSize: 70.sp,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    weatherIcon,
                    style: TextStyle(
                      fontSize: 30.sp,
                    ),
                  ),
                ],
              ),
            ],
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
