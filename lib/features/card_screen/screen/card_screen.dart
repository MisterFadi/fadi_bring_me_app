import 'package:fadi_bring_me_app/features/settings/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BringMe",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 2,
              ),
              Expanded(
                child: Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 29, 110, 45),
                        width: 0.5),
                    color: Colors.green.shade800,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Expanded(
                      child: ListView(
                        children: [
                          const Expanded(
                            child: SizedBox(),
                          ), //!---------- Nicht hart cooden
                          Text(
                            "Es befindet sich zur Zeit findet sich zur Zeit nichts im Warenkfindet sich zur Zeit nichts im Warenkfindet sich zur Zeit nichts im Warenkfindet sich zur Zeit nichts im Warenknichtfindet sich zur Zeit nichts im Warenkfindet sich zur Zeit nichts im Warenkfindet sich zur Zeit nichts im Warenkfindet sich zur Zeit nichts im Warenkfindet sich zur Zeit nichts im Warenkfindet sich zur Zeit nichts im Warenkfindet sich zur Zeit nichts im Warenkfindet sich zur Zeit nichts im Warenkfindet sich zur Zeit nichts im Warenkfindet sich zur Zeit nichts im Warenkfindet sich zur Zeit nichts im Warenks im Warenkorb",
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
