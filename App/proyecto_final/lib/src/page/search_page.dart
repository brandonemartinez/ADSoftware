import 'package:flutter/material.dart';
import 'package:home_life/model/worker.dart';
import 'package:home_life/src/models/especialista_model.dart';
import 'package:home_life/src/resources/repositories/especialista_repository.dart';
import 'package:home_life/src/util/utils.dart';

import '../../pages.dart';
import '../widget/search_card.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  EspecialistaRepository repo = EspecialistaRepository();
  List<EspecialistaModel> especialistas = [];

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return _showDialog;
    //     },
    //   );
    // });
  }

  final AlertDialog _showDialog = AlertDialog(
    title: Text('Demanda de especialistas!'),
    content: SizedBox(
      height: 400,
      width: 300,
      child: Column(
        children: const [
          Text(
              'Hay mucha demanda de electricistas en Maldonado y no hay suficientes especailistas. Si eres electricista puedes agregar esta especialidad a los servicios que ofreces, o puedes recomendar a un electricista que conozcas que se descargue la app para atender la demanda.'),
        ],
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {},
        child: Text('Ir a mi perfil'),
      ),
      TextButton(
        onPressed: () {},
        child: Text('No me interesa'),
      ),
    ],
  );

  FocusNode focus = FocusNode();
  TextEditingController searchController = TextEditingController();

  Widget trailingIcon(int? rating) {
    return SizedBox(
      width: 50,
      child: Row(
        children: [
          Text('${rating} '),
          if (rating! >= 4)
            Icon(
              Icons.star,
              color: Colors.orangeAccent,
            ),
          if (rating! <= 3.5)
            Icon(
              Icons.star_half,
              color: Colors.orangeAccent,
            ),
        ],
      ),
    );
  }

  List<Widget> _buildMenu(BuildContext context) {
    final children = <Widget>[];
    if (!signedIn) {
      NamedRoutes.menuLogedOut.forEach(
        (display, route) {
          children.add(ListTile(
            title: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(display),
            ),
            onTap: () => Navigator.pushNamed(context, route),
          ));
        },
      );
    } else {
      children.add(
        Column(
          children: [
            SizedBox(
              height: 40,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpeg'),
              radius: 40,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              userName,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(),
          ],
        ),
      );
      if (rol == 'Especialista')
        NamedRoutes.menuWorkerLogedIn.forEach(
          (display, route) {
            children.add(ListTile(
              title: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(display),
              ),
              onTap: () => Navigator.pushNamed(context, route),
            ));
          },
        );
      else
        NamedRoutes.menuLogedIn.forEach(
          (display, route) {
            children.add(ListTile(
              title: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(display),
              ),
              onTap: () => Navigator.pushNamed(context, route),
            ));
          },
        );
      children.add(
        Column(
          children: [
            SizedBox(
              height: 200,
            ),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'Cerrar sesión',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              onTap: () {
                signedIn = false;
                Navigator.pushNamed(context, '/home');
              },
            ),
          ],
        ),
      );
    }
    return children;
  }

  List<Worker> filteredList = [];

  List<Worker> workers = [
    Worker(
      location: 'Maldonado',
      name: 'Washington',
      lastName: 'Perez',
      works: ['Carpintero', 'Jardinero', 'Personal Trainer'],
      rating: 5,
    ),
    Worker(
      location: 'Maldonado',
      name: 'Jack',
      lastName: 'Sheppard',
      works: ['Programador', 'Tecnico IT', 'Service Desk'],
      rating: 5,
    ),
    Worker(
      name: 'Pepe',
      lastName: 'Guerra',
      works: ['Tapicero', 'Cortinero', 'Albañil'],
      location: 'Maldonado',
      rating: 4.5,
    ),
    Worker(
      name: 'Melina',
      lastName: 'Acosta',
      works: ['Peluquera', 'Niñera', 'Cocinera'],
      location: 'Salto',
      rating: 5,
    ),
    Worker(
      location: 'Maldonado',
      name: 'Milton',
      lastName: 'Rodriguez',
      works: ['Plomero', 'Electricista', 'Albañil'],
      rating: 4,
    ),
    Worker(
      location: 'Maldonado',
      name: 'Nelson',
      lastName: 'Alvez',
      works: ['Mecanico', 'Electricista', 'Carpintero en aluminio'],
      rating: 4,
    ),
    Worker(
      name: 'Martin',
      lastName: 'Rocha',
      works: ['Pintor', 'Yesero', 'Especialista en Steel Framing'],
      location: 'Maldonado',
      rating: 3.5,
    ),
    Worker(
      name: 'Diadora',
      lastName: 'Suarez',
      works: ['Cocinera', 'Niñera', 'Limpieza'],
      location: 'Salto',
      rating: 4,
    ),
    Worker(
      location: 'Maldonado',
      name: 'Marta',
      lastName: 'Costa',
      works: ['Carpintera', 'Cocinera', 'Limpiadora'],
      rating: 3.5,
    ),
    Worker(
      location: 'Maldonado',
      name: 'Louis',
      lastName: 'Vutton',
      works: ['Programador', 'Limpiador', 'Paseador de perros'],
      rating: 3,
    ),
    Worker(
      name: 'Jhon',
      lastName: 'Evans',
      works: ['Electricista', 'Ingenierio', 'Albañil'],
      location: 'Maldonado',
      rating: 2.5,
    ),
    Worker(
      name: 'Catalina',
      lastName: 'Alcoba',
      works: ['Costurera', 'Niñera', 'Limpieza'],
      location: 'Salto',
      rating: 5,
    ),
  ];

  void filter(String query) {
    filteredList = workers
        .where((worker) => _search(worker, query) && (worker.location == city))
        .toList();
  }

  bool _search(Worker worker, String query) {
    query = query.toLowerCase();
    final matchesName = worker.name.toLowerCase().contains(query);
    final matchesCategory = worker.works
            .any((category) => category.toLowerCase().contains(query)) ==
        true;
    return matchesCategory || matchesName;
  }

  Future<void> buildListEspecialistas(String ciudad, String busqueda) async {
    try {
      final List<EspecialistaModel> _especialistas =
          await repo.obtenerEspecialistas(ciudad, busqueda);
      await agregarALista(_especialistas.toList());
    } catch (error) {
      print(error);
    }
  }

  agregarALista(List<EspecialistaModel> listaEspecialista) {
    especialistas = [];
    especialistas.addAll(listaEspecialista);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Especialistas en ' + (city ?? ''),
                style: TextStyle(fontSize: 22),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Theme(
                  child: TextField(
                    controller: searchController,
                    focusNode: focus,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: IconButton(
                        icon: Icon(
                          Icons.search,
                        ),
                        onPressed: () async {
                          await buildListEspecialistas(city!, searchController.text);
                          setState(() {});
                        },
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.tune_sharp,
                        ),
                        onPressed: () {},
                      ),
                      border: border,
                    ),
                  ),
                  data: ThemeData(
                    colorScheme: ThemeData().colorScheme.copyWith(
                          primary: primaryColor,
                        ),
                  ),
                ),
              ),
              if (especialistas.isNotEmpty)
                SingleChildScrollView(
                  child: SizedBox(
                    height: 534,
                    child: ListView.builder(
                      itemCount: especialistas.length,
                      itemBuilder: (context, index) {
                        return SearchCard(
                          name: '${especialistas[index].nombreFantasia}',
                          oficio:
                              '${especialistas[index].oficios?.first.nombre}, ${especialistas[index].oficios?[1].nombre ?? ''}, ${especialistas[index].oficios?[2].nombre ?? ''} ',
                          icon: trailingIcon(
                            especialistas[index].calificacion,
                          ),
                          ontap: () => Navigator.pushNamed(
                            context,
                            '/worker-detail',
                            arguments: especialistas[index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      drawer: SafeArea(
        child: Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: _buildMenu(context),
            ),
          ),
        ),
      ),
    );
  }
}
