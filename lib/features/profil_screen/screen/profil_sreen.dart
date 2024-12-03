import 'package:fadi_bring_me_app/features/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Expanded(child: SizedBox()),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()));
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          SafeArea(
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
                  const SizedBox(),
                  Text("Fadi Bdiwi",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium),
                  Text("email1234@gmail.com",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 20),
                  Container(
                    height: 200,
                    width: 250,
                    color: Colors.green.shade900,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Kontoeinstellungen",
                              style: Theme.of(context).textTheme.bodyLarge),
                          Text("     - Dein Profil",
                              style: Theme.of(context).textTheme.bodySmall),
                          Text("     - Passwort ändern",
                              style: Theme.of(context).textTheme.bodySmall),
                          Text("     - Konto wechseln",
                              style: Theme.of(context).textTheme.bodySmall),
                          Text("     - Gruppeneinstellungen",
                              style: Theme.of(context).textTheme.bodySmall),
                          Text("     - Datenschutz",
                              style: Theme.of(context).textTheme.bodySmall),
                          Text("     - Konto löschen",
                              style: Theme.of(context).textTheme.bodySmall),
                          Text("     - Abmelden",
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      //bottomNavigationBar: NavigationBar(destinations: destinations)
    );
  }
}
