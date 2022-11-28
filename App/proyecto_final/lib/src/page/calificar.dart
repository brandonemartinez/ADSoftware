import 'package:flutter/material.dart';
import 'package:home_life/src/models/especialista_model.dart';


class Calificar extends StatefulWidget {
  _CalificarState createState() => _CalificarState();
}

class _CalificarState extends State<Calificar> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as EspecialistaModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text('Calificar servicio'),
        elevation: 0,
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
            padding: const EdgeInsets.all(1.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(),
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                    ),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: Image.asset('assets/profile.jpeg').image,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  args.nombreFantasia ?? '',
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${args.oficios?.first.nombre}, ${args.oficios?[1].nombre ?? ''}, ${args.oficios?[2].nombre ?? ''} ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(),
                Text(
                  'Calificar al especialista',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Ayudanos calificando el servicio que recibiste',
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                    ),
                    Icon(
                      Icons.star,
                      size: 45,
                      color: Color(0xfffcaf14),
                    ),
                    Icon(
                      Icons.star,
                      size: 45,
                      color: Color(0xfffcaf14),
                    ),
                    Icon(
                      Icons.star,
                      size: 45,
                      color: Color(0xfffcaf14),
                    ),
                    Icon(
                      Icons.star,
                      size: 45,
                      color: Color(0xfffcaf14),
                    ),
                    Icon(
                      Icons.star_border,
                      size: 45,
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Enviar calificacion'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
