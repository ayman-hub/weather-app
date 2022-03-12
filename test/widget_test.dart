import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';
import 'package:weather_app/data/model/city_weather_model.dart';
import 'package:weather_app/data/model/location_weather_model.dart';
import 'package:weather_app/domain/bloc/city_weather_bloc/city_weather_bloc.dart';
import 'package:weather_app/domain/bloc/location_weather_bloc/location_weather_bloc.dart';

// Mock Cubit
//class MockLocationCubit extends MockCubit<int> implements CityWeatherBloc {}

// Mock Bloc
class MockWeatherBloc extends MockBloc<CityWeatherEvent, CityWeatherState> implements CityWeatherBloc {}
class MockLocationBloc extends MockBloc<LocationWeatherEvent, LocationWeatherState> implements LocationWeatherBloc {}

void main() {
  mainCityWeather();
  mainLocationWeather();
}

void mainCityWeather() {
CityWeatherModel model = CityWeatherModel.fromJson({
  "coord": {
    "lon": 31.8133,
    "lat": 31.4165
  },
  "weather": [
    {
      "id": 803,
      "main": "Clouds",
      "description": "broken clouds",
      "icon": "04d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 12.94,
    "feels_like": 11.39,
    "temp_min": 12.94,
    "temp_max": 12.94,
    "pressure": 1021,
    "humidity": 42,
    "sea_level": 1021,
    "grnd_level": 1020
  },
  "visibility": 10000,
  "wind": {
    "speed": 8.36,
    "deg": 322,
    "gust": 9.45
  },
  "clouds": {
    "all": 81
  },
  "dt": 1647081370,
  "sys": {
    "type": 1,
    "id": 2522,
    "country": "EG",
    "sunrise": 1647058021,
    "sunset": 1647100698
  },
  "timezone": 7200,
  "id": 358048,
  "name": "Damietta",
  "cod": 200
});

  group('cityWeather', () {
    blocTest<CityWeatherBloc, CityWeatherState>(
      'emits [] when nothing is added',
      build: () => CityWeatherBloc(),
      expect: () => [],
    );

    blocTest<CityWeatherBloc, CityWeatherState>(
      'emits [1] when CounterIncrementPressed is added',
      build: () => CityWeatherBloc(),
      act: (bloc) => bloc.add(CityWeatherEventStarted(['damietta'])),
      errors: ()=>[],
      wait: const Duration(seconds: 1),
      expect: () => [CityWeatherLoading(),CityWeatherLoaded([model])],
    );
  });
}

LocationWeatherModel locationWeatherModel = LocationWeatherModel.fromJson({
  "cod": "200",
  "message": 0,
  "cnt": 40,
  "list": [
    {
      "dt": 1647086400,
      "main": {
        "temp": 12.94,
        "feels_like": 11.41,
        "temp_min": 12.94,
        "temp_max": 13.42,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 1020,
        "humidity": 43,
        "temp_kf": -0.48
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 77
      },
      "wind": {
        "speed": 8.22,
        "deg": 325,
        "gust": 9.16
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-03-12 12:00:00"
    },
    {
      "dt": 1647097200,
      "main": {
        "temp": 12.86,
        "feels_like": 11.35,
        "temp_min": 12.7,
        "temp_max": 12.86,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 1020,
        "humidity": 44,
        "temp_kf": 0.16
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 68
      },
      "wind": {
        "speed": 7.3,
        "deg": 329,
        "gust": 8.65
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-03-12 15:00:00"
    },
    {
      "dt": 1647108000,
      "main": {
        "temp": 11.71,
        "feels_like": 10.22,
        "temp_min": 11.1,
        "temp_max": 11.71,
        "pressure": 1022,
        "sea_level": 1022,
        "grnd_level": 1020,
        "humidity": 49,
        "temp_kf": 0.61
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03n"
        }
      ],
      "clouds": {
        "all": 48
      },
      "wind": {
        "speed": 4.5,
        "deg": 329,
        "gust": 4.83
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-03-12 18:00:00"
    },
    {
      "dt": 1647118800,
      "main": {
        "temp": 10.32,
        "feels_like": 8.82,
        "temp_min": 10.32,
        "temp_max": 10.32,
        "pressure": 1022,
        "sea_level": 1022,
        "grnd_level": 1020,
        "humidity": 54,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 5
      },
      "wind": {
        "speed": 2.62,
        "deg": 303,
        "gust": 3.04
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-03-12 21:00:00"
    },
    {
      "dt": 1647129600,
      "main": {
        "temp": 9.72,
        "feels_like": 8.15,
        "temp_min": 9.72,
        "temp_max": 9.72,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 1019,
        "humidity": 59,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 7
      },
      "wind": {
        "speed": 3.04,
        "deg": 276,
        "gust": 3.28
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-03-13 00:00:00"
    },
    {
      "dt": 1647140400,
      "main": {
        "temp": 9.59,
        "feels_like": 7.84,
        "temp_min": 9.59,
        "temp_max": 9.59,
        "pressure": 1020,
        "sea_level": 1020,
        "grnd_level": 1019,
        "humidity": 62,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03n"
        }
      ],
      "clouds": {
        "all": 40
      },
      "wind": {
        "speed": 3.31,
        "deg": 266,
        "gust": 3.66
      },
      "visibility": 10000,
      "pop": 0.13,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-03-13 03:00:00"
    },
    {
      "dt": 1647151200,
      "main": {
        "temp": 10.86,
        "feels_like": 9.67,
        "temp_min": 10.86,
        "temp_max": 10.86,
        "pressure": 1022,
        "sea_level": 1022,
        "grnd_level": 1020,
        "humidity": 64,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10d"
        }
      ],
      "clouds": {
        "all": 42
      },
      "wind": {
        "speed": 4.5,
        "deg": 288,
        "gust": 5.31
      },
      "visibility": 10000,
      "pop": 0.36,
      "rain": {
        "3h": 0.29
      },
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-03-13 06:00:00"
    },
    {
      "dt": 1647162000,
      "main": {
        "temp": 12.14,
        "feels_like": 10.92,
        "temp_min": 12.14,
        "temp_max": 12.14,
        "pressure": 1022,
        "sea_level": 1022,
        "grnd_level": 1020,
        "humidity": 58,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10d"
        }
      ],
      "clouds": {
        "all": 97
      },
      "wind": {
        "speed": 5.93,
        "deg": 315,
        "gust": 6.35
      },
      "visibility": 10000,
      "pop": 0.27,
      "rain": {
        "3h": 0.45
      },
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-03-13 09:00:00"
    },
    {
      "dt": 1647172800,
      "main": {
        "temp": 12.84,
        "feels_like": 11.54,
        "temp_min": 12.84,
        "temp_max": 12.84,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 1020,
        "humidity": 52,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 96
      },
      "wind": {
        "speed": 7.67,
        "deg": 311,
        "gust": 8.51
      },
      "visibility": 10000,
      "pop": 0.14,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-03-13 12:00:00"
    },
    {
      "dt": 1647183600,
      "main": {
        "temp": 10.96,
        "feels_like": 9.55,
        "temp_min": 10.96,
        "temp_max": 10.96,
        "pressure": 1022,
        "sea_level": 1022,
        "grnd_level": 1021,
        "humidity": 55,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 8.23,
        "deg": 321,
        "gust": 8.7
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-03-13 15:00:00"
    },
    {
      "dt": 1647194400,
      "main": {
        "temp": 9.67,
        "feels_like": 6.84,
        "temp_min": 9.67,
        "temp_max": 9.67,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1022,
        "humidity": 55,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 5.94,
        "deg": 331,
        "gust": 6.67
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-03-13 18:00:00"
    },
    {
      "dt": 1647205200,
      "main": {
        "temp": 9.19,
        "feels_like": 6.82,
        "temp_min": 9.19,
        "temp_max": 9.19,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1022,
        "humidity": 57,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03n"
        }
      ],
      "clouds": {
        "all": 27
      },
      "wind": {
        "speed": 4.41,
        "deg": 342,
        "gust": 5.14
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-03-13 21:00:00"
    },
    {
      "dt": 1647216000,
      "main": {
        "temp": 9.29,
        "feels_like": 6.79,
        "temp_min": 9.29,
        "temp_max": 9.29,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1021,
        "humidity": 57,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03n"
        }
      ],
      "clouds": {
        "all": 31
      },
      "wind": {
        "speed": 4.79,
        "deg": 353,
        "gust": 5
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-03-14 00:00:00"
    },
    {
      "dt": 1647226800,
      "main": {
        "temp": 10.17,
        "feels_like": 8.55,
        "temp_min": 10.17,
        "temp_max": 10.17,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1021,
        "humidity": 50,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 78
      },
      "wind": {
        "speed": 5.17,
        "deg": 325,
        "gust": 5.72
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-03-14 03:00:00"
    },
    {
      "dt": 1647237600,
      "main": {
        "temp": 11.19,
        "feels_like": 9.62,
        "temp_min": 11.19,
        "temp_max": 11.19,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1023,
        "humidity": 48,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 89
      },
      "wind": {
        "speed": 5.95,
        "deg": 320,
        "gust": 6.17
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-03-14 06:00:00"
    },
    {
      "dt": 1647248400,
      "main": {
        "temp": 11.86,
        "feels_like": 10.25,
        "temp_min": 11.86,
        "temp_max": 11.86,
        "pressure": 1025,
        "sea_level": 1025,
        "grnd_level": 1023,
        "humidity": 44,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 93
      },
      "wind": {
        "speed": 6.27,
        "deg": 326,
        "gust": 6.75
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-03-14 09:00:00"
    },
    {
      "dt": 1647259200,
      "main": {
        "temp": 12.62,
        "feels_like": 11.03,
        "temp_min": 12.62,
        "temp_max": 12.62,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1022,
        "humidity": 42,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 60
      },
      "wind": {
        "speed": 7.42,
        "deg": 324,
        "gust": 8.09
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-03-14 12:00:00"
    },
    {
      "dt": 1647270000,
      "main": {
        "temp": 11.92,
        "feels_like": 10.37,
        "temp_min": 11.92,
        "temp_max": 11.92,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1022,
        "humidity": 46,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02d"
        }
      ],
      "clouds": {
        "all": 20
      },
      "wind": {
        "speed": 5.98,
        "deg": 331,
        "gust": 8.37
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-03-14 15:00:00"
    },
    {
      "dt": 1647280800,
      "main": {
        "temp": 10.4,
        "feels_like": 9.06,
        "temp_min": 10.4,
        "temp_max": 10.4,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1023,
        "humidity": 60,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10n"
        }
      ],
      "clouds": {
        "all": 47
      },
      "wind": {
        "speed": 5.66,
        "deg": 319,
        "gust": 6.4
      },
      "visibility": 10000,
      "pop": 0.2,
      "rain": {
        "3h": 0.14
      },
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-03-14 18:00:00"
    },
    {
      "dt": 1647291600,
      "main": {
        "temp": 9.92,
        "feels_like": 7.35,
        "temp_min": 9.92,
        "temp_max": 9.92,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1023,
        "humidity": 66,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10n"
        }
      ],
      "clouds": {
        "all": 85
      },
      "wind": {
        "speed": 5.38,
        "deg": 311,
        "gust": 6.78
      },
      "visibility": 10000,
      "pop": 0.6,
      "rain": {
        "3h": 0.63
      },
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-03-14 21:00:00"
    },
    {
      "dt": 1647302400,
      "main": {
        "temp": 9.61,
        "feels_like": 6.72,
        "temp_min": 9.61,
        "temp_max": 9.61,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1022,
        "humidity": 64,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10n"
        }
      ],
      "clouds": {
        "all": 76
      },
      "wind": {
        "speed": 6.07,
        "deg": 309,
        "gust": 7.95
      },
      "visibility": 10000,
      "pop": 0.63,
      "rain": {
        "3h": 0.72
      },
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-03-15 00:00:00"
    },
    {
      "dt": 1647313200,
      "main": {
        "temp": 9.75,
        "feels_like": 6.91,
        "temp_min": 9.75,
        "temp_max": 9.75,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1022,
        "humidity": 64,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10n"
        }
      ],
      "clouds": {
        "all": 85
      },
      "wind": {
        "speed": 6.04,
        "deg": 335,
        "gust": 7.26
      },
      "visibility": 10000,
      "pop": 0.43,
      "rain": {
        "3h": 0.41
      },
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-03-15 03:00:00"
    },
    {
      "dt": 1647324000,
      "main": {
        "temp": 11.85,
        "feels_like": 10.42,
        "temp_min": 11.85,
        "temp_max": 11.85,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1022,
        "humidity": 51,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 85
      },
      "wind": {
        "speed": 7.27,
        "deg": 325,
        "gust": 8.73
      },
      "visibility": 10000,
      "pop": 0.39,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-03-15 06:00:00"
    },
    {
      "dt": 1647334800,
      "main": {
        "temp": 13.14,
        "feels_like": 11.66,
        "temp_min": 13.14,
        "temp_max": 13.14,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1022,
        "humidity": 44,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10d"
        }
      ],
      "clouds": {
        "all": 97
      },
      "wind": {
        "speed": 8.93,
        "deg": 325,
        "gust": 9.94
      },
      "visibility": 10000,
      "pop": 0.42,
      "rain": {
        "3h": 0.1
      },
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-03-15 09:00:00"
    },
    {
      "dt": 1647345600,
      "main": {
        "temp": 11.06,
        "feels_like": 9.87,
        "temp_min": 11.06,
        "temp_max": 11.06,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1022,
        "humidity": 63,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10d"
        }
      ],
      "clouds": {
        "all": 97
      },
      "wind": {
        "speed": 7.93,
        "deg": 335,
        "gust": 9.49
      },
      "visibility": 10000,
      "pop": 0.59,
      "rain": {
        "3h": 0.64
      },
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-03-15 12:00:00"
    },
    {
      "dt": 1647356400,
      "main": {
        "temp": 12.26,
        "feels_like": 10.69,
        "temp_min": 12.26,
        "temp_max": 12.26,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1022,
        "humidity": 44,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10d"
        }
      ],
      "clouds": {
        "all": 87
      },
      "wind": {
        "speed": 11.12,
        "deg": 331,
        "gust": 12.72
      },
      "visibility": 10000,
      "pop": 0.21,
      "rain": {
        "3h": 0.36
      },
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-03-15 15:00:00"
    },
    {
      "dt": 1647367200,
      "main": {
        "temp": 11.68,
        "feels_like": 10.05,
        "temp_min": 11.68,
        "temp_max": 11.68,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1023,
        "humidity": 44,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 85
      },
      "wind": {
        "speed": 10.69,
        "deg": 342,
        "gust": 13.09
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-03-15 18:00:00"
    },
    {
      "dt": 1647378000,
      "main": {
        "temp": 12.06,
        "feels_like": 10.5,
        "temp_min": 12.06,
        "temp_max": 12.06,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1023,
        "humidity": 45,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 11.76,
        "deg": 343,
        "gust": 13.86
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-03-15 21:00:00"
    },
    {
      "dt": 1647388800,
      "main": {
        "temp": 11.79,
        "feels_like": 10.33,
        "temp_min": 11.79,
        "temp_max": 11.79,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1022,
        "humidity": 50,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10n"
        }
      ],
      "clouds": {
        "all": 92
      },
      "wind": {
        "speed": 9.69,
        "deg": 336,
        "gust": 12.73
      },
      "visibility": 10000,
      "pop": 0.2,
      "rain": {
        "3h": 0.1
      },
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-03-16 00:00:00"
    },
    {
      "dt": 1647399600,
      "main": {
        "temp": 12.61,
        "feels_like": 11.18,
        "temp_min": 12.61,
        "temp_max": 12.61,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1022,
        "humidity": 48,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10n"
        }
      ],
      "clouds": {
        "all": 93
      },
      "wind": {
        "speed": 9.8,
        "deg": 337,
        "gust": 12.11
      },
      "visibility": 10000,
      "pop": 0.28,
      "rain": {
        "3h": 0.12
      },
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-03-16 03:00:00"
    },
    {
      "dt": 1647410400,
      "main": {
        "temp": 13.54,
        "feels_like": 12.15,
        "temp_min": 13.54,
        "temp_max": 13.54,
        "pressure": 1025,
        "sea_level": 1025,
        "grnd_level": 1023,
        "humidity": 46,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 71
      },
      "wind": {
        "speed": 9.33,
        "deg": 346,
        "gust": 10.92
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-03-16 06:00:00"
    },
    {
      "dt": 1647421200,
      "main": {
        "temp": 14.47,
        "feels_like": 13.07,
        "temp_min": 14.47,
        "temp_max": 14.47,
        "pressure": 1026,
        "sea_level": 1026,
        "grnd_level": 1024,
        "humidity": 42,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 10
      },
      "wind": {
        "speed": 6.94,
        "deg": 331,
        "gust": 7.77
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-03-16 09:00:00"
    },
    {
      "dt": 1647432000,
      "main": {
        "temp": 14.77,
        "feels_like": 13.43,
        "temp_min": 14.77,
        "temp_max": 14.77,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1023,
        "humidity": 43,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 8
      },
      "wind": {
        "speed": 5.78,
        "deg": 335,
        "gust": 6.27
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-03-16 12:00:00"
    },
    {
      "dt": 1647442800,
      "main": {
        "temp": 14.11,
        "feels_like": 12.67,
        "temp_min": 14.11,
        "temp_max": 14.11,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1023,
        "humidity": 42,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 2
      },
      "wind": {
        "speed": 4.07,
        "deg": 336,
        "gust": 4.74
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-03-16 15:00:00"
    },
    {
      "dt": 1647453600,
      "main": {
        "temp": 12.56,
        "feels_like": 11.31,
        "temp_min": 12.56,
        "temp_max": 12.56,
        "pressure": 1026,
        "sea_level": 1026,
        "grnd_level": 1024,
        "humidity": 55,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 1
      },
      "wind": {
        "speed": 4.54,
        "deg": 300,
        "gust": 5.04
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-03-16 18:00:00"
    },
    {
      "dt": 1647464400,
      "main": {
        "temp": 11.59,
        "feels_like": 10.48,
        "temp_min": 11.59,
        "temp_max": 11.59,
        "pressure": 1025,
        "sea_level": 1025,
        "grnd_level": 1024,
        "humidity": 64,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 3
      },
      "wind": {
        "speed": 3.72,
        "deg": 270,
        "gust": 4.21
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-03-16 21:00:00"
    },
    {
      "dt": 1647475200,
      "main": {
        "temp": 10.15,
        "feels_like": 9.18,
        "temp_min": 10.15,
        "temp_max": 10.15,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1023,
        "humidity": 75,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 2
      },
      "wind": {
        "speed": 3.88,
        "deg": 241,
        "gust": 4.23
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-03-17 00:00:00"
    },
    {
      "dt": 1647486000,
      "main": {
        "temp": 9.2,
        "feels_like": 6.74,
        "temp_min": 9.2,
        "temp_max": 9.2,
        "pressure": 1025,
        "sea_level": 1025,
        "grnd_level": 1023,
        "humidity": 81,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03n"
        }
      ],
      "clouds": {
        "all": 50
      },
      "wind": {
        "speed": 4.63,
        "deg": 229,
        "gust": 4.91
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-03-17 03:00:00"
    },
    {
      "dt": 1647496800,
      "main": {
        "temp": 11.14,
        "feels_like": 10.16,
        "temp_min": 11.14,
        "temp_max": 11.14,
        "pressure": 1026,
        "sea_level": 1026,
        "grnd_level": 1024,
        "humidity": 71,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": {
        "all": 46
      },
      "wind": {
        "speed": 4.82,
        "deg": 221,
        "gust": 5.22
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-03-17 06:00:00"
    },
    {
      "dt": 1647507600,
      "main": {
        "temp": 15.74,
        "feels_like": 14.68,
        "temp_min": 15.74,
        "temp_max": 15.74,
        "pressure": 1025,
        "sea_level": 1025,
        "grnd_level": 1024,
        "humidity": 50,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 6
      },
      "wind": {
        "speed": 2.63,
        "deg": 268,
        "gust": 3.94
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-03-17 09:00:00"
    }
  ],
  "city": {
    "id": 358048,
    "name": "Damietta",
    "coord": {
      "lat": 31.4175,
      "lon": 31.8144
    },
    "country": "EG",
    "population": 76839,
    "timezone": 7200,
    "sunrise": 1647058020,
    "sunset": 1647100698
  }
});
void mainLocationWeather() {
  group('locationWeather', () {
    blocTest<CityWeatherBloc, CityWeatherState>(
      'emits [] when nothing is added',
      build: () => CityWeatherBloc(),
      expect: () => [],
    );

    blocTest<LocationWeatherBloc, LocationWeatherState>(
      'emits [1] when CounterIncrementPressed is added',
      build: () => LocationWeatherBloc(),
      act: (bloc) => bloc.add(LocationWeatherEventStarted()),
      errors: ()=>[],
      wait: const Duration(seconds: 1),
      expect: () => [LocationWeatherLoading(),LocationWeatherLoaded(locationWeatherModel)],
    );
  });
}
