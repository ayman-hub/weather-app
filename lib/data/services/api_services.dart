import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:weather_app/data/model/city_weather_model.dart';
import 'dart:convert';
import 'package:weather_app/data/model/location_weather_model.dart';
import 'package:weather_app/data/services/api_urls.dart';

import 'location.dart';

LocationWeatherModel locationWeatherFromJson(String str) =>
    LocationWeatherModel.fromJson(json.decode(str));
String locationWeatherToJson(LocationWeatherModel data) =>
    json.encode(data.toJson());

CityWeatherModel cityWeatherFromJson(String str) =>
    CityWeatherModel.fromJson(json.decode(str));
String cityWeatherToJson(CityWeatherModel data) => json.encode(data.toJson());

class ApiServices {
  Future<LocationWeatherModel>? getCurrentLocationWeather() async {
    try {
      Location location = Location();
      await location.getCurrentLocation();
      print('location :: $location');
      final _url =
          '${currentLocationUrlKey}lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
      final response = await http.get(Uri.parse(_url));
      var weather = locationWeatherFromJson(response.body);
      return weather;
    } catch (error, stacktrace) {
      throw Exception('Exception accrued: $error with stacktrace: $stacktrace');
    }
  }

  Future<CityWeatherModel?> getCityWeather(List<String>? cityName) async {
    for (var element in cityName!) {
      try {
        final _cityWeatherUrl =
            "$cityWeatherUrlKey?q=$element&appid=$apiKey&units=metric";
        final response = await http.get(Uri.parse(_cityWeatherUrl));
        var weather = cityWeatherFromJson(response.body);
        return weather;
      } catch (error, stacktrace) {
        throw Exception(
            'Exception accrued: $error with stacktrace: $stacktrace');
      }
    }
    return null;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getTimeStamp(int? condition) {
    if (condition! > 12) {
      return 'PM';
    } else {
      return 'AM';
    }
  }
}
