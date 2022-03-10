part of 'city_weather_bloc.dart';

abstract class CityWeatherEvent extends Equatable {
  const CityWeatherEvent();
}

class CityWeatherEventStarted extends CityWeatherEvent {
  List<String> cities;

  CityWeatherEventStarted(this.cities);

  @override
  List<Object> get props => [];
}
