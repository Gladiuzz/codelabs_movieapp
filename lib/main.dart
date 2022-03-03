import 'package:codelabs_movieapp/cubit/cast_cubit.dart';
import 'package:codelabs_movieapp/cubit/moviePopular_cubit.dart';
import 'package:codelabs_movieapp/cubit/movienewplaying_cubit.dart';
import 'package:codelabs_movieapp/pages/home/home_page.dart';
import 'package:codelabs_movieapp/pages/home/main_page.dart';
import 'package:codelabs_movieapp/pages/splashScreen_page.dart';
import 'package:codelabs_movieapp/providers/page_provider.dart';
import 'package:codelabs_movieapp/services/cast_service.dart';
import 'package:codelabs_movieapp/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => CastCubit(CastService()),
        ),
        BlocProvider(
          create: (context) => MoviePopularCubit(MovieService()),
        ),
        BlocProvider(
          create: (context) => MovienewplayingCubit(MovieService()),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/home': (context) => MainPage(),
        },
      ),
    );
  }
}
