import 'package:flutter/material.dart';

import '../utils.dart';

class RegistroEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Información de la empresa',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: border,
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                    hintText: 'Razón Social',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: border,
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                    hintText: 'Nombre de fantasía',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: border,
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                    hintText: 'Cargar fotos',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: border,
                    prefixIcon: Icon(
                      Icons.alternate_email,
                    ),
                    hintText: 'Foto de perfil',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: border,
                    prefixIcon: Icon(
                      Icons.phone,
                    ),
                    hintText: 'Presentación',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: border,
                    prefixIcon: Icon(
                      Icons.home,
                    ),
                    hintText: 'Disponibilidad',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Checkbox(value: true, onChanged:(context){}),
                    Text('Acepto los términos y condiciones'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/planes'), child: Text('Seleccionar plan'),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
