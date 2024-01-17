import 'package:flutter/material.dart';
import 'package:skenuu_1/pages/login.dart';
import 'package:skenuu_1/widgets/widgets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  void splashing(BuildContext context) {
  WidgetsBinding.instance?.addPostFrameCallback((_) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    });
  });
}

  @override
 Widget build(BuildContext context) {
  splashing(context);

  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange, Colors.yellow],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: AppLogo(), 
      ),
    ),
  );
}

}
