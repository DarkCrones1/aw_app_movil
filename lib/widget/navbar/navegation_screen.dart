import 'package:mundo_artesano/pages/principal_pages/catalog_page_screen.dart';
import 'package:mundo_artesano/pages/principal_pages/home_page_screen.dart';
import 'package:mundo_artesano/pages/principal_pages/profile_page_screen.dart';
import 'package:flutter/material.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home), label: 'Inicio'),
          NavigationDestination(icon: Icon(Icons.store), label: 'Catálogo'),
          NavigationDestination(
              icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
      body: <Widget>[
        Container(
          alignment: Alignment.center,
          child: const HomePageScreen(),
        ),
        Container(
          alignment: Alignment.center,
          child: const CatalogPageScreen(),
        ),
        Container(
          alignment: Alignment.center,
          child: const ProfilePageScreen(),
        )
      ][currentPageIndex],
    );
  }
}
