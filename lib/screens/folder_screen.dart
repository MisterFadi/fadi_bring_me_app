import 'package:flutter/material.dart';
import 'package:timer_snackbar/timer_snackbar.dart';

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
            onPressed: () => timerSnackbar(
              context: context,
              contentText: "Ein neuer Ordner wurde hinzugefügt.",
              buttonPrefixWidget: const Icon(
                Icons.keyboard_return_outlined,
                color: Colors.white,
              ),
              afterTimeExecute: () =>
                  print("Ein neuer Ordner wurde hinzugefügt."),
              second: 5,
            ),
            icon: const Icon(
              Icons.create_new_folder_outlined,
              color: Colors.white,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
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
                          "Diese Seite ist noch in Bearbeitung. \n                                                          Hier erscheint bald eine Suchmaschine. \n                                                             Wir bitten um Verständnis :)",
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
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
