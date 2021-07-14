import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/pages/splash_page.dart';
import 'package:money_manager/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: whiteColor,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: SplashPage(),
      // HomePage(),
    );
  }
}
