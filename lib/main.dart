import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/presentation/screens/movie_details_screen.dart';
import 'config/themes/themes.dart';
import 'core/sevcies/services_locator.dart';
import 'movies/presentation/screens/home_movies_screen.dart';

void main() {
//  Bloc.observer = MyBlocObserver();
  ServicesLoctor().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        home: const HomeMoviesScreen(),
      ),
    );
  }
}
