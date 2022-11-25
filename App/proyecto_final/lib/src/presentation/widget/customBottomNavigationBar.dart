import 'package:flutter/material.dart';
import 'package:home_life/src/core/utils/utils.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
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
      }
      navigationBarItems.add(
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
          backgroundColor: primaryColor,
        ),
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
      _selectedIndex = index;
      Navigator.pushNamed(context, navigationRoutes(index));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      items: navigationBarItems,
      currentIndex: _selectedIndex,
      selectedItemColor: secondaryColor,
      onTap: _onItemTapped,
    );
  }
}
