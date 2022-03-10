import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/data/services/api_services.dart';
import 'package:weather_app/domain/bloc/city_weather_bloc/city_weather_bloc.dart';
import 'package:weather_app/presentation/view/location_screen.dart';
import 'package:weather_app/presentation/view/search_screen.dart';
import 'package:weather_app/splash.dart';

import 'domain/bloc/location_weather_bloc/location_weather_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MultiBlocProvider(
        providers: <BlocProvider<dynamic>>[
          BlocProvider<CityWeatherBloc>(create: (_) => CityWeatherBloc()),
          BlocProvider<LocationWeatherBloc>(create: (_) => LocationWeatherBloc()),
        ],
        child: MaterialApp(
          theme: ThemeData.dark(),
          home: MultiRepositoryProvider(
            providers: [
              RepositoryProvider(create: (context) => ApiServices()),
            ],
            child: SearchScreen(),
          ),
          debugShowCheckedModeBanner: false,
        ),
      ),
      designSize: const Size(480, 800),
    );
  }
}
