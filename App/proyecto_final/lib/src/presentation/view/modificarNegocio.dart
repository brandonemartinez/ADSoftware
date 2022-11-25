import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';

class Negocio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Modificar datos de negocio',
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
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Presentación'),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  border: border,
                  hintText:
                      '14 años de experiencia en el rubro, además de varios certificados que comprueban mis habilidades. A su servicio.',
                  suffixIcon: Icon(Icons.edit),
                ),
                maxLines: 5,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Datos de negocio'),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Razón Social'),
                  border: border,
                  hintText: 'Pablo Martinez S.A',
                  suffixIcon: Icon(Icons.edit),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Nombre de Fantasía'),
                  border: border,
                  hintText: 'Carpinteria Martinez',
                  suffixIcon: Icon(Icons.edit),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Documento o R.U.T.'),
                  border: border,
                  hintText: '5.123.456-7',
                  suffixIcon: Icon(Icons.edit),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Modificar fotos'),
                  Spacer(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/licuado-de-kiwi.jpeg',
                        height: 120,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        'assets/Batidos-y-Licuados-para-Desayunar.jpeg',
                        height: 120,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        'assets/licuado.jpg',
                        height: 120,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        'assets/diploma.jpg',
                        height: 120,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Disponibilidad'),
                  border: border,
                  hintText: 'Lunes a Viernes - 9 am a 15 pm',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Guardar cambios',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/planes'),
                child: Text('Cambiar plan'),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/modificar-ciudades'),
                child: Text('Modificar ciudades de disponibilidad'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
