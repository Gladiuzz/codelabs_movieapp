import 'package:codelabs_movieapp/pages/home/home_page.dart';
import 'package:codelabs_movieapp/pages/home/main_page.dart';
import 'package:codelabs_movieapp/pages/splashScreen_page.dart';
import 'package:codelabs_movieapp/providers/page_provider.dart';
import 'package:flutter/material.dart';
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
