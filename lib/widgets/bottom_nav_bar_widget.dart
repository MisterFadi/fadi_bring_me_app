import 'package:fadi_bring_me_app/screens/card_screen.dart';
import 'package:fadi_bring_me_app/screens/folder_screen.dart';
import 'package:fadi_bring_me_app/screens/kamera_screen.dart';
import 'package:fadi_bring_me_app/screens/list_screen.dart';
import 'package:fadi_bring_me_app/screens/profil_sreen.dart';
import 'package:fadi_bring_me_app/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  final List<Widget> widgets = [
    const ListScreen(),
    const FolderScreen(),
    const KameraScreen(),
    const CardScreen(),
    const ProfilScreen(),
    const SettingsScreen()
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.green,
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          currentIndex = index;
          setState(() {});
        },
        destinations: const [
          NavigationDestination(
              selectedIcon: Icon(
                Icons.list,
                size: 45,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.list,
                color: Colors.black54,
                size: 45,
              ),
              label: ""),
          NavigationDestination(
              selectedIcon: Icon(
                Icons.folder_open,
                size: 45,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.folder_open,
                size: 45,
                color: Colors.black54,
              ),
              label: ""),
          NavigationDestination(
              selectedIcon: Icon(
                Icons.add_circle_outline,
                size: 85,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.add_circle_outline,
                color: Colors.black54,
                size: 85,
              ),
              label: ""),
          NavigationDestination(
              selectedIcon: Icon(
                Icons.shopping_cart_outlined,
                size: 45,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black54,
                size: 45,
              ),
              label: ""),
          NavigationDestination(
              selectedIcon: Icon(
                Icons.person_2_outlined,
                size: 45,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.person_2_outlined,
                color: Colors.black54,
                size: 45,
              ),
              label: ""),
        ],
      ),
      body: widgets[currentIndex],
    );
  }
}
