import 'package:flutter/material.dart';

import '../util/config.dart';
import '../util/utils.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Modificar perfil',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 145,
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: Image.asset('assets/profile.jpeg').image,
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text('Cambiar foto de perfil'),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text('Datos personales'),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Nombre'),
                  border: border,
                  hintText: 'Pablo',
                  suffixIcon: Icon(Icons.edit),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Apellido'),
                  border: border,
                  hintText: 'Martinez',
                  suffixIcon: Icon(Icons.edit),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Fecha de nacimiento'),
                  border: border,
                  hintText: '21/4/1996',
                  suffixIcon: Icon(Icons.edit),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Género'),
                  border: border,
                  hintText: 'Masculino',
                  suffixIcon: Icon(Icons.edit),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Contraseña'),
                  border: border,
                  suffixIcon: Icon(Icons.edit),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Repetir contraseña'),
                  border: border,
                  suffixIcon: Icon(Icons.edit),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Datos de contacto'),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Email'),
                  border: border,
                  hintText: 'pablomartinez@prototipo.com',
                  suffixIcon: Icon(Icons.edit),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Teléfono'),
                  border: border,
                  hintText: '091234567',
                  suffixIcon: Icon(Icons.edit),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Dirección'),
                  border: border,
                  hintText: 'Roman Guerra 234',
                  suffixIcon: Icon(Icons.edit),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Guardar cambios',
                ),
              ),
              if (rol == 'Especialista')
                SizedBox(
                  height: 10,
                ),
              if (rol == 'Especialista')
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/negocio'),
                  child: Text('Modificar datos de negocio'),
                ),
              if (rol == 'Especialista')
                SizedBox(
                  height: 10,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
