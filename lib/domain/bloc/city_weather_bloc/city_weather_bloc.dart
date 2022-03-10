import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/model/city_weather_model.dart';

import '../../../data/services/api_services.dart';

part 'city_weather_event.dart';
part 'city_weather_state.dart';

class CityWeatherBloc extends Bloc<CityWeatherEvent, CityWeatherState> {
  CityWeatherBloc(this.cityName) : super(CityWeatherLoading()) {
    on<CityWeatherEventStarted>(mapCityWeatherStateToState);
  }

  late final List<String>? cityName;

  FutureOr<void> mapCityWeatherStateToState(
      CityWeatherEventStarted event, Emitter<CityWeatherState> emit) async {
    ApiServices _apiServices = ApiServices();
    print('cityWeatherLoading');
    emit((CityWeatherLoading()));
    try {
      CityWeatherModel? cityWeather =
          await _apiServices.getCityWeather(cityName);
      emit(CityWeatherLoaded(cityWeather!));
    } on Exception catch (e) {
      print(e);
      emit(CityWeatherError(e.toString()));
    }
  }
}
