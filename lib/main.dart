import 'package:flutter/material.dart';
import 'package:streaming_app_2/utilities/colors.dart';
import 'package:streaming_app_2/utilities/text_style.dart';

import 'pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streaming App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: kTextTheme,
        scaffoldBackgroundColor: backgroundColor,
        primaryColor: primaryColor,
      ),
      home: const HomePage(),
    );
  }
}
