import 'package:fadi_bring_me_app/screens/settings_screen.dart';
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
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
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
              const SizedBox(),
              const Text(
                "Fadi Bdiwi",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),
              const Text(
                "email1234@gmail.com",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Container(
                height: 250,
                width: 250,
                color: Colors.green.shade900,
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kontoeinstellungen",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text(
                        "     - email1234@gwefsfm",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      ),
                      Text(
                        "     - email1234@gwefsfm",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      ),
                      Text(
                        "     - email1234@gwefsfm",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),

              // const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: NavigationBar(destinations: destinations)
    );
  }
}
