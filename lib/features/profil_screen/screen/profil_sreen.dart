import 'package:fadi_bring_me_app/config/colors.dart';
import 'package:fadi_bring_me_app/database/firebase/firebase_auth_repo.dart';
import 'package:fadi_bring_me_app/features/home_screen/screen/home_screen.dart';
import 'package:fadi_bring_me_app/features/settings/screens/settings_screen.dart';
import 'package:fadi_bring_me_app/shared/logout_button.dart';
import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
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
                  const Stack(
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundImage:
                            AssetImage("assets/images/Fadi_Emoji.jpg"),
                      ),
                      // Positioned(
                      //     left: 110,
                      //     bottom: 0,
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //           color: Colors.amber,
                      //           borderRadius: BorderRadius.circular(40)),
                      //       child: IconButton(
                      //         onPressed: () {showModalBottomSheet(context: context, builder: builder)},
                      //         icon: const Icon(Icons.edit),
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //     ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(),
                  Text(
                      FirebaseAuthRepo().currentUser!.email!.toString() ??
                          "Keine Daten",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium),
                  //Text(FirebaseAuthRepo() as String,
                  //style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 20),
                  Container(
                    height: 180,
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
                          // Text("     - Abmelden",
                          //     style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  LogoutButton(
                    text: "Abmelden",
                    onPressed: () {
                      FirebaseAuthRepo().signOut();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
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
