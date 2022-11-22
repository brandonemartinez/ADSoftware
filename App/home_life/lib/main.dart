import 'package:flutter/material.dart';
import 'package:home_life/pages.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'pages/homePage.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily:
          lorem10
      ),
      home: MyHomePage(),
      routes: NamedRoutes.routes,
    );
  }
}

