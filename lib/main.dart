import 'package:blood_donation/constant/custom_theme.dart';
import 'package:blood_donation/screen/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme().buildLightTheme(),
      darkTheme: CustomTheme().buildDarkTheme(),
      home: const LoginScreen(),
    );
  }
}