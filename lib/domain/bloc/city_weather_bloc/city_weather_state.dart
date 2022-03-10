part of 'city_weather_bloc.dart';

abstract class CityWeatherState extends Equatable {
  const CityWeatherState();
  List<Object> get props => [];
}

class CityWeatherLoading extends CityWeatherState {}

class CityWeatherLoaded extends CityWeatherState {
  final CityWeatherModel cityWeatherModel;
  const CityWeatherLoaded(this.cityWeatherModel);
  @override
  List<Object> get props => [];
}

class CityWeatherError extends CityWeatherState {
  String? error;

  CityWeatherError(this.error);
}
