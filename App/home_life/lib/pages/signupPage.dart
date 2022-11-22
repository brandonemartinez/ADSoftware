import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: Card(
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Registrarse como cliente',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Divider(),
                        Text(
                            'Registrándose como cliente usted podrá contratar el servicio de los especialistas directamente desde la aplicación, así como realizar pagos por servicios contratados y calificarlos.'),
                        SizedBox(
                          height: 40,
                        ),
                        Image.asset(
                          'assets/problem.png',
                          width: 100,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '"Necesito un servicio"',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  onTap: () => Navigator.pushNamed(context, '/client-sign-up'),
                ),
              ),
            ),
            Expanded(
              child: Card(
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Registrarse como especialista',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Divider(),
                        Text(
                            'Registrándose como especialista usted podrá ofrecer sus servicios en la aplicación. Podrá ofrecer servicios en una o más especialidades que usted domine, en los horarios que indique como disponibles.'),
                        SizedBox(
                          height: 40,
                        ),
                        Image.asset(
                          'assets/problem-solving.png',
                          width: 100,
                        ),
                        Text(
                          '"Ofrezco un servicio"',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  onTap: () => Navigator.pushNamed(context, '/worker-sign-up'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
