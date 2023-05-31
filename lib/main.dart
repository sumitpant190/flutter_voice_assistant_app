import 'package:flutter/material.dart';
import 'package:flutter_voice_assistant_app/home_page.dart';
import 'package:flutter_voice_assistant_app/pallete.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Allen',
      theme: ThemeData.light(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: Pallete.whiteColor,
          appBarTheme: AppBarTheme(backgroundColor: Pallete.whiteColor)),
      home: HomePage(),
    );
  }
}
