
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomBarComponent extends StatefulWidget {
  const BottomBarComponent({super.key});

  @override
  State<BottomBarComponent> createState() => _BottomBarComponent();
}
int _selectedIndex = 1;
class _BottomBarComponent extends State<BottomBarComponent> {

  void _tap(BuildContext context, int index) {
    setState(() { _selectedIndex = index; });
    print(index);
    switch (index){
      case 0:
        context.go("/map");
        break;
      case 1:
        context.go('/home');
        break;
      case 2:
        context.go('/guide');
        break;
      case 3:
        context.go('/garde');
        break;
      case 4:
        context.go('/my_plantes');
        break;
      case 5:
        context.go('/picture');
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[

        BottomNavigationBarItem(
          icon: Icon(Icons.map,),
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
            label: "Plantes"
        ),
      ],
      currentIndex: _selectedIndex,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedFontSize: 15,
      unselectedFontSize: 15,
      selectedItemColor: Colors.black38,
      unselectedItemColor: const Color.fromARGB(255,131,189,117),
      elevation: 20,
      onTap: (index) => _tap(context, index),
    );
  }
}