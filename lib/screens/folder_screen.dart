import 'package:fadi_bring_me_app/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class FolderScreen extends StatelessWidget {
  const FolderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()));
            },
            icon: const Icon(Icons.create_new_folder_outlined),
            iconSize: 40,
            color: Colors.white,
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: const SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 580,
                  width: 300,
                  child: ColoredBox(color: Colors.yellow),
                ),
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: NavigationBar(destinations: destinations)
    );
  }
}
