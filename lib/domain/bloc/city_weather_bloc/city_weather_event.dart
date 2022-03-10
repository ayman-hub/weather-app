part of 'city_weather_bloc.dart';

abstract class CityWeatherEvent extends Equatable {
  const CityWeatherEvent();
}

class CityWeatherEventStarted extends CityWeatherEvent {
  @override
  List<Object> get props => [];
}
