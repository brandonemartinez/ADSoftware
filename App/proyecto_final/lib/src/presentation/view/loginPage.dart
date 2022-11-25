import 'package:flutter/material.dart';
import 'package:home_life/src/core/utils/utils.dart';
import '../widget/primaryButton.dart';
import '../widget/primaryTextField.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe9f2f9),
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
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Iniciar sesión',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: PrimaryTextField(
                      label: 'E-mail',
                      prefixIcon: Icons.alternate_email,
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: PrimaryTextField(
                      label: 'Contraseña',
                      prefixIcon: Icons.lock,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      obscureText: !_passwordVisible,
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  PrimaryButton(
                      label: 'Iniciar sesión',
                      onPressed: () {
                        Navigator.pushNamed(context, '/index');
                        signedIn = true;
                      }),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    child: Text(
                      'Olvidaste tu contraseña?',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
