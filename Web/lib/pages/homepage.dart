import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex;
  var _isExpanded;

  @override
  initState() {
    super.initState();

    _selectedIndex = 0;
    _isExpanded = false;
  }

  final AlertDialog _showDialog = AlertDialog(
    title: Text('Eliminar oficio Albañil'),
    content: SizedBox(
      height: 100,
      width: 100,
      child: Column(
        children: const [
          Text('Esta seguro que desea eliminar el oficio Albañil?'),
        ],
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {},
        child: Text('Confirmar'),
      ),
      TextButton(
        onPressed: () {},
        child: Text('Cancelar'),
      ),
    ],
  );

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return Column(
          children: [
            Row(
              children: [
                Text(
                  'Administrar planes',
                  style: TextStyle(fontSize: 36),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: SizedBox(
                    height: 300,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 26.0,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  "Individual",
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Permite ofrecer servicios en 3 especialidades y en 3 ciudades",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Spacer(),
                                InkWell(
                                  child: Icon(
                                    Icons.delete,
                                    size: 26.0,
                                    color: Colors.orange,
                                  ),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return _showDialog;
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: 300,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.people,
                                  size: 26.0,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  "Empresa",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Permite ofrecer servicios en 3 especialidades y en 5 ciudades",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Spacer(),
                                Icon(
                                  Icons.delete,
                                  size: 26.0,
                                  color: Colors.orange,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: 300,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.people,
                                  size: 26.0,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  "Enterprise",
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Permite ofrecer servicios en 3 especialidades y en 3 ciudades",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Spacer(),
                                Icon(
                                  Icons.delete,
                                  size: 26.0,
                                  color: Colors.orange,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: 300,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.people,
                                  size: 26.0,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  "Ultimate",
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Permite ofrecer servicios en 3 especialidades y en 3 ciudades",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Spacer(),
                                Icon(
                                  Icons.delete,
                                  size: 26.0,
                                  color: Colors.orange,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: 300,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Agregar",
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 80.0,
                            ),
                            Center(
                                child: Icon(
                              Icons.add,
                              size: 60,
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      case 1:
        return Container(
          height: 700,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.deepPurple.shade400,
                    ),
                    label: Text(
                      "Reporte de servicios contratados",
                      style: TextStyle(
                        color: Colors.deepPurple.shade400,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 200,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 15.0),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                              ),
                              hintText: 'Buscar',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      DropdownButton(
                        hint: const Text("Orden"),
                        items: const [
                          DropdownMenuItem(
                            value: "Alfabetico",
                            child: Text("Alfabetico"),
                          ),
                          DropdownMenuItem(
                            value: "Calificacion",
                            child: Text("Calificacion"),
                          ),
                          DropdownMenuItem(
                            value: "Servicios",
                            child: Text("Servicios"),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DataTable(
                      headingRowColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.grey.shade200),
                      columns: const [
                        DataColumn(
                          label: Text(
                            "Especialidad",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Departamento",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Ciudad",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Fecha",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Estado",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text("Albañilería")),
                          DataCell(Text("Montevideo")),
                          DataCell(Text("Montevideo")),
                          DataCell(Text("11/11/2022")),
                          DataCell(Text("Realizado")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("Sanitaria")),
                          DataCell(Text("Maldonado")),
                          DataCell(Text("Maldonado")),
                          DataCell(Text("11/11/2022")),
                          DataCell(Text("Realizado")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("Carpintería")),
                          DataCell(Text("Maldonado")),
                          DataCell(Text("Punta del Este")),
                          DataCell(Text("11/11/2022")),
                          DataCell(Text("Realizado")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("Pintura")),
                          DataCell(Text("Maldonado")),
                          DataCell(Text("Punta del Este")),
                          DataCell(Text("11/11/2022")),
                          DataCell(Text("Cancelado")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("Limpieza")),
                          DataCell(Text("Salto")),
                          DataCell(Text("Salto")),
                          DataCell(Text("11/11/2022")),
                          DataCell(Text("Pago")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("Mecánica")),
                          DataCell(Text("Lavalleja")),
                          DataCell(Text("Minas")),
                          DataCell(Text("11/11/2022")),
                          DataCell(Text("Pago")),
                        ]),
                      ]),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "1",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "2",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "3",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Ver todo",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      case 2:
        return Container(
          height: 700,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.deepPurple.shade400,
                    ),
                    label: Text(
                      "Lista de usuarios registrados",
                      style: TextStyle(
                        color: Colors.deepPurple.shade400,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 200,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 15.0),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                              ),
                              hintText: 'Buscar',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      DropdownButton(
                        hint: const Text("Orden"),
                        items: const [
                          DropdownMenuItem(
                            value: "Alfabetico",
                            child: Text("Alfabetico"),
                          ),
                          DropdownMenuItem(
                            value: "Calificacion",
                            child: Text("Calificacion"),
                          ),
                          DropdownMenuItem(
                            value: "Servicios",
                            child: Text("Servicios"),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DataTable(
                      headingRowColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.grey.shade200),
                      columns: const [
                        DataColumn(
                          label: Center(
                            child: Text(
                              "ID",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Nombre",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Nombre de fantasía",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Localidad",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Rol",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Calificacion",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        DataColumn(
                          label: Center(
                            child: Text(
                              "Modificar",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Center(
                            child: Text(
                              "Eliminar",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text("0")),
                          DataCell(Text("Washington Perez")),
                          DataCell(Text("Washington Perez")),
                          DataCell(Text("Maldonado")),
                          DataCell(Text("Especialista")),
                          DataCell(Text("4.3")),
                          DataCell(
                            Center(
                              child: Icon(
                                Icons.edit,
                                color: Colors.deepPurple.shade400,
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.deepPurple.shade400,
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return _showDialog;
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("1")),
                          DataCell(Text("Juan Cruz")),
                          DataCell(Text("JC Plomeria")),
                          DataCell(Text("San Carlos")),
                          DataCell(Text("Especialista")),
                          DataCell(Text("3.5")),
                          DataCell(
                            Center(
                              child: Icon(
                                Icons.edit,
                                color: Colors.deepPurple.shade400,
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Icon(
                                Icons.delete,
                                color: Colors.deepPurple.shade400,
                              ),
                            ),
                          ),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("2")),
                          DataCell(Text("Juana de Viana")),
                          DataCell(Text("N/A")),
                          DataCell(Text("Maldonado")),
                          DataCell(Text("Cliente")),
                          DataCell(Text("N/A")),
                          DataCell(
                            Center(
                              child: Icon(
                                Icons.edit,
                                color: Colors.deepPurple.shade400,
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Icon(
                                Icons.delete,
                                color: Colors.deepPurple.shade400,
                              ),
                            ),
                          ),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("3")),
                          DataCell(Text("Pablo Perez")),
                          DataCell(Text("N/A")),
                          DataCell(Text("Piriapolis")),
                          DataCell(Text("Cliente")),
                          DataCell(Text("N/A")),
                          DataCell(
                            Center(
                              child: Icon(
                                Icons.edit,
                                color: Colors.deepPurple.shade400,
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Icon(
                                Icons.delete,
                                color: Colors.deepPurple.shade400,
                              ),
                            ),
                          ),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("4")),
                          DataCell(Text("Juan Suarez")),
                          DataCell(Text("Carpinteria Suarez")),
                          DataCell(Text("Minas")),
                          DataCell(Text("Especialista")),
                          DataCell(Text("3")),
                          DataCell(
                            Center(
                              child: Icon(
                                Icons.edit,
                                color: Colors.deepPurple.shade400,
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Icon(
                                Icons.delete,
                                color: Colors.deepPurple.shade400,
                              ),
                            ),
                          ),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("5")),
                          DataCell(Text("Marta Aguilera")),
                          DataCell(Text("N/A")),
                          DataCell(Text("Melo")),
                          DataCell(Text("Cliente")),
                          DataCell(Text("N/A")),
                          DataCell(
                            Center(
                              child: Icon(
                                Icons.edit,
                                color: Colors.deepPurple.shade400,
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Icon(
                                Icons.delete,
                                color: Colors.deepPurple.shade400,
                              ),
                            ),
                          ),
                        ]),
                      ]),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "1",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "2",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "3",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Ver todo",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      case 3:
        return Column(
          children: [
            Text(
              'Lista de oficios',
              style: TextStyle(fontSize: 36),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {}, child: Text('Agregar nuevo oficio'))
              ],
            ),
            Container(
              height: 900,
              child: ListView.builder(
                  itemCount: _especialidades.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        trailing: InkWell(
                          child: const Icon(Icons.delete),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return _showDialog;
                              },
                            );
                          },
                        ),
                        title: Text(_especialidades[index]),
                      ),
                    );
                  }),
            ),
          ],
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          MouseRegion(
            onEnter: (event) => {
              setState(() {
                _isExpanded = true;
              }),
            },
            onExit: (event) => {
              setState(() {
                _isExpanded = false;
              }),
            },
            child: NavigationRail(
              extended: _isExpanded,
              backgroundColor: const Color(0xff243a69),
              unselectedIconTheme:
                  const IconThemeData(color: Colors.white, opacity: 1),
              unselectedLabelTextStyle: const TextStyle(
                color: Colors.white,
              ),
              selectedLabelTextStyle: const TextStyle(color: Colors.orange),
              selectedIconTheme: const IconThemeData(color: Colors.orange),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text("Inicio"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.bar_chart),
                  label: Text("Reportes"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person),
                  label: Text("Usuarios"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text("Configuración"),
                ),
              ],
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPage(_selectedIndex),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xff243a69),
        child: const Icon(
          Icons.lightbulb,
          color: Colors.orange,
        ),
      ),
    );
  }
}

List<String> _especialidades = [
  'Albañil',
  'Carpintero',
  'Electricista',
  'Pintor',
  'Mecánico',
  'Niñera',
  'Mantenimiento general',
  'Programador',
  'Yesero',
  'Limpieza',
  'Plomero',
  'Sanitario',
  'Cocinero',
  'Steel Framing',
  'Decorador',
  'Cuidado de personas',
  'Herrero',
  'Soldador',
  'Tornero',
  'Tapicero',
];
