
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomBarComponent extends StatefulWidget {
  const BottomBarComponent({super.key});


  @override
  State<BottomBarComponent> createState() => _BottomBarComponent();
  }

class _BottomBarComponent extends State<BottomBarComponent> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: "Map",
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Accueil",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: "Guide"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit_calendar),
          label: "Garde",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile"
        ),
      ],
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedFontSize: 15,
      unselectedFontSize: 15,
      selectedItemColor: Colors.black38,
      unselectedItemColor: Colors.green,
      elevation: 20,
      iconSize: 30,
      onTap: _onItemTapped,
    );
  }
}
