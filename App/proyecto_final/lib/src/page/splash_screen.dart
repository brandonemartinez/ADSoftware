import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_life/src/util/utils.dart';

class SplashScreen extends StatelessWidget {
  Widget fu(BuildContext context) {
    Timer(const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, '/home'));
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Semantics(
            label: 'Pantalla de carga',
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: primaryColor,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(
                  color: secondaryColor,
                ),
              ),
            ),
          ),
          fu(context),
        ],
      ),
    );
  }
}
