import 'package:flutter/material.dart';
import 'package:home_life/src/core/utils/utils.dart';
import '../widget/primaryButton.dart';

import '../widget/secondaryButton.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Bienvenido a ',
              style: TextStyle(fontSize: 32, color: Colors.black),
            ),
            const Text(
              'Prototipo',
              style: TextStyle(fontSize: 42, color: Colors.black),
            ),
            SizedBox(
              height: 100,
            ),
            PrimaryButton(
              label: 'Iniciar sesión',
              onPressed: () => Navigator.pushNamed(context, '/signIn'),
            ),
            SizedBox(
              height: 15,
            ),
            PrimaryButton(
              label: 'Registrarse',
              onPressed: () => Navigator.pushNamed(context, '/signUp'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                50,
                20,
                50,
                20,
              ),
              child: Divider(
                color: Colors.black,
                thickness: 0.8,
              ),
            ),
            SecondaryButton(
              label: 'Continuar sin registro',
              onPressed: () => Navigator.pushNamed(context, '/index'),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}