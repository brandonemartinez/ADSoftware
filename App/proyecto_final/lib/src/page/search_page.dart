import 'package:flutter/material.dart';
import 'package:home_life/src/models/especialista_model.dart';
import 'package:home_life/src/page/worker_detail_page.dart';
import 'package:home_life/src/resources/repositories/especialista_repository.dart';
import 'package:home_life/src/util/utils.dart';

import '../util/config.dart';
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
  }

  FocusNode focus = FocusNode();
  TextEditingController searchController = TextEditingController();

  Widget trailingIcon(int rating) {
    return SizedBox(
      width: 50,
      child: Row(
        children: [
          Text(rating == 0 ? '-' : '$rating'),
          if (rating >= 4 || rating == 0)
            Icon(
              Icons.star,
              color: Colors.orangeAccent,
            ),
          if (rating <= 3.5 && rating > 0)
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
    children.add(
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 620,
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
    return children;
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
                          await buildListEspecialistas(
                              city!, searchController.text);
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
                            especialistas[index].calificacion ?? 0,
                          ),
                          ontap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WorkerDetail(
                                id: especialistas[index].id ?? 0,
                              ),
                            ),
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
      drawer: signedIn
          ? SafeArea(
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
            )
          : null,
    );
  }
}
