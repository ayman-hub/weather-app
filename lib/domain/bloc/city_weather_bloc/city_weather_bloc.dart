import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/model/city_weather_model.dart';

import '../../../data/services/api_services.dart';

part 'city_weather_event.dart';
part 'city_weather_state.dart';

class CityWeatherBloc extends Bloc<CityWeatherEvent, CityWeatherState> {
  CityWeatherBloc() : super(CityWeatherLoading()) {
    on<CityWeatherEventStarted>(mapCityWeatherStateToState);
  }

 // late final Set<String>? cityName;

  FutureOr<void> mapCityWeatherStateToState(
      CityWeatherEventStarted event, Emitter<CityWeatherState> emit) async {
    ApiServices _apiServices = ApiServices();
    print('cityWeatherLoading');
    emit((CityWeatherLoading()));
    try {
      List<CityWeatherModel>? cityWeather =
          await _apiServices.getCityWeather(event.cities);
      emit(CityWeatherLoaded(cityWeather));
    } on Exception catch (e) {
      print(e);
      emit(CityWeatherError(e.toString()));
    }
  }
}
