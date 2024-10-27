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
          Text("BringMe", style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(width: 65),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.create_new_folder_outlined,
              color: Colors.white,
              size: 40,
            ),
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
