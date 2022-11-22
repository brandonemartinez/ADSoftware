import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff243a69),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Bienvenido a ',
              style: TextStyle(fontSize: 32, color: Color(0xffe9f2f9)),
            ),
            const Text(
              'Prototipo',
              style: TextStyle(fontSize: 42, color: Color(0xffe9f2f9)),
            ),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 40,
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signIn');
                },
                child: Text(
                  'Iniciar sesion',
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 40,
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signUp');
                },
                child: Text('Registrarse'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                50,
                20,
                50,
                20,
              ),
              child: Divider(
                color: Color(0xffe9f2f9),
                thickness: 0.8,
              ),
            ),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/ubication');
                },
                child: Text('Continuar sin registro'),
                style: ElevatedButton.styleFrom(primary: Colors.orange),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
