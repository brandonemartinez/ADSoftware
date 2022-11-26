import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:home_life/pages.dart';
import 'package:home_life/src/util/utils.dart';
import 'package:home_life/src/page/homePage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [
        const Locale('en'),
        const Locale('es'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Prototipo',
      theme: ThemeData(
        primarySwatch: primaryMaterialColor,
      ),
      home: MyHomePage(),
      routes: NamedRoutes.routes,
    );
  }
}
