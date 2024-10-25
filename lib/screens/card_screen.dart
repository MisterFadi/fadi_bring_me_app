import 'package:fadi_bring_me_app/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Text(
            "BringMe",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          const SizedBox(width: 65),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()));
            },
            icon: const Icon(Icons.settings),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: const SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              ColoredBox(color: Colors.grey),
              SizedBox(height: 30),
              SizedBox(
                  height: 150,
                  width: 250,
                  child: ColoredBox(color: Colors.grey)),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: NavigationBar(destinations: destinations)
    );
  }
}
