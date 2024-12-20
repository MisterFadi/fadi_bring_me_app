import 'package:fadi_bring_me_app/features/card_screen/screen/card_screen.dart';
import 'package:fadi_bring_me_app/features/folder_screen/screen/folder_screen.dart';
import 'package:fadi_bring_me_app/features/kamera_screen/screen/kamera_screen.dart';
import 'package:fadi_bring_me_app/features/list_screen/screen/list_screen.dart';
import 'package:fadi_bring_me_app/features/profil_screen/screen/profil_sreen.dart';
import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({
    super.key,
  });

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // Jetzt übergeben wir repository an FolderScreen
    final List<Widget> widgets = [
      const ListScreen(),
      const FolderScreen(), // Hier repository übergeben
      const KameraScreen(),
      const CardScreen(),
      const ProfilScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.green,
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
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
