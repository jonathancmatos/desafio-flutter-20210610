import 'package:desafio_flutter_20210610/app/modules/home/home_page.dart';
import 'package:desafio_flutter_20210610/app/modules/splash-screen/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class SplashScreenPage extends StatefulWidget {

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  final SplashController controller = SplashController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    autorun((_){
      if(!controller.loading)
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (_) => HomePage()
        ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 140),
            const SizedBox(height: 50),
            CircularProgressIndicator()
          ],
        ),
      )
    );
  }
}
