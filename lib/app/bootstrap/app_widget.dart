import 'package:desafio_flutter_20210610/app/modules/home/home_page.dart';
import 'package:flutter/material.dart';

import '../modules/splash-screen/splash_screen_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter 20210610",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: SplashScreenPage(),
    );
  }
}
