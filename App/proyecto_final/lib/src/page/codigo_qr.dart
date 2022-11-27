import 'package:flutter/material.dart';

class CodigoQR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text('Cobrar por QR'),
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
                'Total a cobrar',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(
                '\$500',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Pidele al cliente que escanee tu código impreso o muéstralo en tu celular.',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                'assets/qr.png',
                width: 260,
              ),
              SizedBox(
                height: 90,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Cancelar',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
