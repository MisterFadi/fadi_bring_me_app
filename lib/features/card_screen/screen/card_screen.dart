import 'package:fadi_bring_me_app/features/settings/settings_screen.dart';
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
          Text("BringMe", style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(width: 65),
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
          const SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              Container(
                height: 580,
                width: 320,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 29, 110, 45),
                      width: 0.5),
                  color: Colors.green.shade800,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    //crossAxisAlignment: CrossAxisAlignment.start,

                    child: Text(
                        "Es befindet sich zur Zeit \nnoch nichts im Warenkorb",
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
