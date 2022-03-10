import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/location_weather_model.dart';
import '../../data/services/api_services.dart';
import '../../domain/bloc/location_weather_bloc/location_weather_bloc.dart';

class WeatherByHours extends StatelessWidget {
  const WeatherByHours({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.h,
      ),
      child: Container(
        height: 150.h,
        child: BlocBuilder<LocationWeatherBloc, LocationWeatherState>(
          builder: (context, state) {
            if (state is LocationWeatherLoading) {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state is LocationWeatherLoaded) {
              List<ListData>? list = state.weatherModel.list;
              print(list!.length);
              return ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      VerticalDivider(
                        color: Colors.transparent,
                        width: 10.w,
                      ),
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    int? temp = list[index].main?.temp!.toInt();
                    String? time = list[index].dtTxt;
                    int? condition = list[index].weather?[0].id?.toInt();
                    String? weatherIcon =
                        ApiServices().getWeatherIcon(condition!);
                    DateTime? dateTime = DateTime.parse(time!);
                    String? timeStamp =
                        ApiServices().getTimeStamp(dateTime.hour);

                    return Container(
                      height: 300.h,
                      width: 100.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${dateTime.hour}$timeStamp',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            weatherIcon,
                            style: TextStyle(
                              color: Colors.yellow,
                            ),
                          ),
                          Text(
                            '$temp°',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20.r),
                        color: Colors.white,
                      ),
                    );
                  });
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
