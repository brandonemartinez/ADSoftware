import 'package:flutter/material.dart';
import 'package:home_life/src/page/profile_page.dart';
import 'package:home_life/src/page/search_page.dart';
import 'package:home_life/src/page/solicitudes.dart';

import '../util/config.dart';
import '../util/utils.dart';
import 'calendar.dart';
import 'home_page.dart';
import 'location_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentIndex = 0;

  var navigationBarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Búsqueda',
      backgroundColor: primaryColor,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.location_on_rounded),
      label: 'Ubicación',
      backgroundColor: primaryColor,
    ),
  ];

  final List<Widget> _children = [
    SearchPage(),
    LocationPage(),
  ];

  @override
  void initState() {
    super.initState();
    if (signedIn) {
      if (rol == 'Especialista') {
        navigationBarItems.addAll(
          [
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_rounded),
              label: 'Agenda',
              backgroundColor: primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Clientes',
              backgroundColor: primaryColor,
            ),
          ],
        );
        _children.addAll(
          [
            Agenda(),
            SolicitudesPage(),
          ],
        );
      }
      navigationBarItems.add(
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
          backgroundColor: primaryColor,
        ),
      );
      _children.add(
        Profile(),
      );
    } else {
      navigationBarItems.insert(
        0,
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
          backgroundColor: primaryColor,
        ),
      );
      _children.insert(
        0,
        MyHomePage(),
      );
      _currentIndex = 1;
    }
  }

  String navigationRoutes(int index) {
    if (signedIn) {
      if (rol == 'Especialista') {
        switch (index) {
          case 0:
            return '/search';
          case 1:
            return '/ubication';
          case 2:
            return '/agenda';
          case 3:
            return '/solicitudes';
          case 4:
            return '/profile';
          default:
            return '/home';
        }
      } else {
        switch (index) {
          case 0:
            return '/search';
          case 1:
            return '/ubication';
          case 2:
            return '/profile';
          default:
            return '/home';
        }
      }
    } else {
      switch (index) {
        case 0:
          return '/home';
        case 1:
          return '/search';
        case 2:
          return '/ubication';
        default:
          return '/home';
      }
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (signedIn == false) {
        if (index == 0) {
          Navigator.pop(context);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
      //    title: Text('Persistent BottomNavBar'),
      //  ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: navigationBarItems,
        currentIndex: _currentIndex,
        selectedItemColor: secondaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
