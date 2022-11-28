import 'package:flutter/material.dart';
import 'package:home_life/src/models/especialista_model.dart';
import 'package:home_life/src/resources/repositories/especialista_repository.dart';
import 'package:home_life/src/util/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../util/config.dart';
import '../widget/primary_button.dart';

class WorkerDetail extends StatefulWidget {
  const WorkerDetail({required this.id});

  final int id;

  @override
  _WorkerDetailState createState() => _WorkerDetailState();
}

class _WorkerDetailState extends State<WorkerDetail> {
  @override
  void initState() {
    super.initState();
  }

  void _launchPhoneUrl(String numero) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: numero,
    );
    await launchUrl(launchUri);
  }

  void _launchSmsUrl(String numero) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: numero,
    );
    await launchUrl(launchUri);
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Widget fijarCitaButton(BuildContext context, Object? args) {
    if (signedIn) {
      return Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 10),
        child: Container(
          child: PrimaryButton(
            label: 'Solicitar servicio',
            onPressed: () =>
                Navigator.pushNamed(context, '/solicitud', arguments: args),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<EspecialistaModel> especialista =
        EspecialistaRepository().obtenerEspecialistaPorId(widget.id);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Detalle especialista',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
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
        child: FutureBuilder<EspecialistaModel>(
            future: especialista,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final EspecialistaModel? data = snapshot.data;
                return Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: secondaryColor,
                              radius: 60,
                              child: Text(
                                '${data?.nombre![0]}${data?.apellido![0]}',
                                style: TextStyle(
                                  fontSize: 44,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            data?.nombreFantasia ??
                                '${data?.nombre} ${data?.apellido}',
                            style: TextStyle(
                              fontSize: 28,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            '${data?.oficios?.first.nombre}, ${data?.oficios?[1].nombre ?? ''}, ${data?.oficios?[2].nombre ?? ''} ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              if ((data?.calificacion ?? 5) >= 4)
                                Icon(
                                  Icons.star,
                                  color: Color(0xfffcaf14),
                                  size: 40,
                                ),
                              if ((data?.calificacion ?? 5) <= 3.5)
                                Icon(
                                  Icons.star_half,
                                  color: Color(0xfffcaf14),
                                  size: 40,
                                ),
                              Text(
                                data?.calificacion != null
                                    ? (data?.calificacion.toString() ?? '')
                                    : '-',
                                style: TextStyle(fontSize: 24),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  var url = 'https://wa.me/${data?.telefono}';
                                  _launchInBrowser(Uri.parse(url));
                                },
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
                                onPressed: () {
                                  _launchPhoneUrl(data?.telefono ?? '');
                                },
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
                                onPressed: () {
                                  _launchSmsUrl(data?.telefono ?? '');
                                },
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
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        fijarCitaButton(context, data),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Acerca de ${data?.nombreFantasia}:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            data?.presentacion ?? '',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Teléfono:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            data?.telefono ?? '',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Galeria de fotos:',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
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
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
