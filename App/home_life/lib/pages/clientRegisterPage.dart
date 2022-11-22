import 'package:flutter/material.dart';

import '../utils.dart';

class ClientRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title:   Text(
          'Registro de cliente',
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
                    hintText: 'Nombre',
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
                    hintText: 'Apellido',
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
                    hintText: 'E-mail',
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
                    hintText: 'Teléfono',
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
                    hintText: 'Dirección',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: border,
                    prefixIcon: Icon(
                      Icons.calendar_today,
                    ),
                    hintText: 'Fecha de nacimiento',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: border,
                    prefixIcon: Icon(
                      Icons.perm_identity,
                    ),
                    hintText: 'Genero',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: border,
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    hintText: 'Contraseña',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: border,
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    hintText: 'Repetir contraseña',
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
                ElevatedButton(onPressed: (){}, child: Text('Registrarme'),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
