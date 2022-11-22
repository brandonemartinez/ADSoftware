import 'package:flutter/material.dart';

import '../utils.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'Iniciar sesión',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  border: border,
                  prefixIcon: Icon(
                    Icons.alternate_email,
                  ),
                  hintText: 'E-mail',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: border,
                  prefixIcon: Icon(
                    Icons.lock,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye_outlined),
                    onPressed: () {},
                  ),
                  hintText: 'Contraseña',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  signedIn = true;
                  Navigator.pushNamed(context, '/search');
                },
                child: Text(
                  'Iniciar sesión',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                child: Text(
                  'Olvidaste tu contraseña?',
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
