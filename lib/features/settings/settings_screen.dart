import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("assets/images/Fadi_Emoji.jpg"),
              ),
              const SizedBox(height: 20),
              Text("Fadi Bdiwi",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium),
              Text("email1234@gmail.com",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 40),
              Container(
                height: 110,
                width: 250,
                color: Colors.green.shade900,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Listen",
                          style: Theme.of(context).textTheme.bodyLarge),
                      Text("     - Standardlisten",
                          style: Theme.of(context).textTheme.bodySmall),
                      Text("     - Favoritenliste",
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 120,
                width: 250,
                color: Colors.green.shade900,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Allgemein",
                          style: Theme.of(context).textTheme.bodyLarge),
                      Text("     - Benachrichtigung",
                          style: Theme.of(context).textTheme.bodySmall),
                      Text("     - Berechtigung",
                          style: Theme.of(context).textTheme.bodySmall),
                      Text("     - Angebote",
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
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
