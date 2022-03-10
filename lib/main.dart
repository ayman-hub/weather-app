import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/data/services/api_services.dart';
import 'package:weather_app/presentation/view/location_screen.dart';
import 'package:weather_app/splash.dart';

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
      builder: () => MaterialApp(
        theme: ThemeData.dark(),
        home: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (context) => ApiServices()),
          ],
          child: LocationScreen(),
        ),
        debugShowCheckedModeBanner: false,
      ),
      designSize: const Size(480, 800),
    );
  }
}
