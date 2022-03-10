part of 'location_weather_bloc.dart';

abstract class LocationWeatherEvent extends Equatable {
  const LocationWeatherEvent();
}

class LocationWeatherEventStarted extends LocationWeatherEvent {
  @override
  List<Object> get props => [];
}
