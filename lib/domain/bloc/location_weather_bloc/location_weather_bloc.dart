import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/location_weather_model.dart';
import '../../../data/services/api_services.dart';

part 'location_weather_event.dart';
part 'location_weather_state.dart';

class LocationWeatherBloc
    extends Bloc<LocationWeatherEvent, LocationWeatherState> {
  LocationWeatherBloc() : super(LocationWeatherLoading()) {
    on<LocationWeatherEventStarted>(_mapLocationWeatherStateToState);
  }
  FutureOr<void> _mapLocationWeatherStateToState(
      LocationWeatherEventStarted event,
      Emitter<LocationWeatherState> emit) async {
    ApiServices _apiServices = ApiServices();
    print('location loading');
    emit((LocationWeatherLoading()));
    try {
      LocationWeatherModel? locationWeather =
          await _apiServices.getCurrentLocationWeather();
      emit(LocationWeatherLoaded(locationWeather!));
    } on Exception catch (e) {
      print(e);
      emit(LocationWeatherError(e.toString()));
    }
  }
}
