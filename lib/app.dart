import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skenuu_1/pages/pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'skenuu_1 App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.white, // Set the primary color to white
          primary: Colors.yellow, // Set the background color to yellow
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.dmSansTextTheme(),
      ),
      home: const SplashPage(),
    );
  }
}
