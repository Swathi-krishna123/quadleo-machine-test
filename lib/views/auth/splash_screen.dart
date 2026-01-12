import 'package:flutter/material.dart';
import 'package:quadleo_machine_test/utils/router/app_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, AppRouter.login);
    });
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset("assets/images/splash_image.png"),
        ),
      ),
    );
  }
}
