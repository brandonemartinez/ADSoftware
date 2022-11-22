import 'package:flutter/material.dart';
import 'package:home_life/model/worker.dart';
import 'package:home_life/utils.dart';

class WorkerDetail extends StatelessWidget {
  const WorkerDetail();

  Widget fijarCitaButton(BuildContext context, Object? args) {
    if (signedIn) {
      return Container(
        width: 300,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/solicitud', arguments: args);
          },
          child: Text('Solicitar servicio'),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Worker;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalle especialista',
          style: TextStyle(color: Colors.black),
        ),
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
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                  args.name + ' ' + args.lastName,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${args.works.first}, ${args.works[1]}, ${args.works[2]} ',
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
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    if (args.rating >= 4)
                      Icon(
                        Icons.star,
                        color: Color(0xfffcaf14),
                        size: 40,
                      ),
                    if (args.rating <= 3.5)
                      Icon(
                        Icons.star_half,
                        color: Color(0xfffcaf14),
                        size: 40,
                      ),
                    Text(
                      args.rating.toString(),
                      style: TextStyle(fontSize: 24),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.whatsapp,
                        color: Colors.green,
                      ),
                      iconSize: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.call,
                        color: Colors.blue,
                      ),
                      iconSize: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.message,
                        color: Colors.blue,
                      ),
                      iconSize: 40,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                Divider(),
                fijarCitaButton(context, args),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Acerca de ${args.name}:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    '14 años de experiencia en el rubro, además de varios certificados que comprueban las habilidades de ${args.name} como ${args.works[0]}, ${args.works[1]} y ${args.works[2]}.',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Informacion de contacto:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '091234567',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Galeria de fotos:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
