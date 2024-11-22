import 'package:fadi_bring_me_app/database/repository/database_repository.dart';
import 'package:flutter/material.dart';
import 'package:timer_snackbar/timer_snackbar.dart';

class FolderScreen extends StatelessWidget {
  final DatabaseRepository repository;
  const FolderScreen({
    super.key,
    required this.repository,
  });
  @override
  Widget build(BuildContext context) {
    // Hier erstellen wir den String, der als "Produktname" übergeben wird.
    String newProduct = "Neuer Ordner"; // Beispiel-Produktname
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Titel der App
          Text("BringMe", style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(width: 65),
          // Button für das Hinzufügen eines Ordners
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
              second: 5, // Benachrichtigung nach 5 Sekunden
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
                      child: FutureBuilder(
                        future: repository.addProduct(newProduct),
                        builder: (context, AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator(
                              color: Colors.white,
                            );
                          }
                          if (snapshot.hasError) {
                            return const Text(
                              "Fehler beim Laden der Daten.",
                              style: TextStyle(color: Colors.black),
                            );
                          }
                          if (snapshot.hasData) {
                            return const Text(
                              "Diese Seite ist noch in Bearbeitung. \n\nHier erscheint bald eine Suchmaschine. \n\nWir bitten um Verständnis :)",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            );
                          }
                          return const Text(
                            "Keine Daten vorhanden.",
                            style: TextStyle(color: Colors.white),
                          );
                        },
                      ),
                    ),
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
