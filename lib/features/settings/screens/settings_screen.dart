import 'package:fadi_bring_me_app/config/colors.dart';
import 'package:fadi_bring_me_app/database/firebase/firebase_auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? username;

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("username");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(""),
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
                  Text(username ?? "Kein Benutzername",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium),
                  Text(FirebaseAuthRepo().currentUser!.email!.toString(),
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
        ],
      ),
    );
    //bottomNavigationBar: NavigationBar(destinations: destinations)
  }
}
