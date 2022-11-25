import 'package:flutter/material.dart';
import 'package:home_life/src/core/utils/utils.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Seleccionar registro'),
        foregroundColor: Colors.black,
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
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
              elevation: 4,
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Registrarse como cliente',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Divider(),
                      Text(
                          'Registrándose como cliente usted podrá contratar el servicio de los especialistas por medio de la aplicación.'),
                      Image.asset(
                        'assets/Questions-bro.png',
                        width: 200,
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
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
              elevation: 4,
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Registrarse como especialista',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Divider(),
                      Text(
                          'Registrándose como especialista usted podrá ofrecer sus servicios por medio de la aplicación. '),
                      Image.asset(
                        'assets/Scaffold-bro.png',
                        width: 200,
                      ),
                      SizedBox(height: 10,),
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
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
