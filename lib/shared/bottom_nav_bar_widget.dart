import 'package:fadi_bring_me_app/config/colors.dart';
import 'package:fadi_bring_me_app/features/card_screen/screen/gemini_screen.dart';
import 'package:fadi_bring_me_app/features/folder_screen/screen/note_screen.dart';
import 'package:fadi_bring_me_app/features/kamera_screen/screen/kamera_screen.dart';
import 'package:fadi_bring_me_app/features/list_screen/screen/product_screen.dart';
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
      const ProductScreen(),
      const NoteScreen(),
      const KameraScreen(),
      const GeminiScreen(),
      const ProfilScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 80,
        backgroundColor: appColor,
        indicatorShape: Border.all(width: 0.7),
        indicatorColor: appColorLogo,
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
              selectedIcon: Icon(Icons.list, size: 40, color: appColor),
              icon: Icon(
                Icons.list,
                color: appColorLogo,
                size: 40,
              ),
              label: ""),
          NavigationDestination(
              selectedIcon: Icon(
                Icons.edit_document,
                size: 40,
                color: appColor,
              ),
              icon: Icon(
                Icons.edit_document,
                size: 40,
                color: appColorLogo,
              ),
              label: ""),
          NavigationDestination(
              selectedIcon: Icon(
                Icons.add_circle_outline,
                size: 55,
                color: appColor,
              ),
              icon: Icon(
                Icons.add_circle_outline,
                color: appColorLogo,
                size: 55,
              ),
              label: ""),
          NavigationDestination(
              selectedIcon:
                  Icon(Icons.auto_awesome_outlined, size: 40, color: appColor),
              icon: Icon(
                Icons.auto_awesome_outlined,
                color: appColorLogo,
                size: 40,
              ),
              label: ""),
          NavigationDestination(
            selectedIcon:
                Icon(Icons.person_2_outlined, size: 40, color: appColor),
            icon: Icon(
              Icons.person_2_outlined,
              color: appColorLogo,
              size: 40,
            ),
            label: "",
          ),
        ],
      ),
      body: widgets[currentIndex],
    );
  }
}
