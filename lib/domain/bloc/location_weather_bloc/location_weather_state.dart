part of 'location_weather_bloc.dart';

abstract class LocationWeatherState extends Equatable {
  const LocationWeatherState();
  List<Object> get props => [];
}

class LocationWeatherLoading extends LocationWeatherState {}

class LocationWeatherLoaded extends LocationWeatherState {
  final LocationWeatherModel weatherModel;
  const LocationWeatherLoaded(this.weatherModel);
  @override
  List<Object> get props => [];
}

class LocationWeatherError extends LocationWeatherState {
  String error;

  LocationWeatherError(this.error);
}
