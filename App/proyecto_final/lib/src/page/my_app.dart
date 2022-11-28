import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:home_life/src/models/departamento_model.dart';
import 'package:home_life/src/resources/remote/http_service.dart';
import 'package:home_life/src/resources/repositories/departamento_repository.dart';
import 'package:home_life/src/util/config.dart';
import 'package:home_life/src/util/constants.dart';

import '../../pages.dart';
import '../util/utils.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

HttpService dataSource = HttpService();

cargarDepartamentos() async {
  departamentos = await dataSource.listarDepartamentos();
}

cargarOficios() async {
  oficios = await dataSource.listarOficios();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    cargarDepartamentos();
    cargarOficios();
  }

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
      initialRoute: NamedRoutes.splashScreen,
      routes: NamedRoutes.routes,
    );
  }
}
