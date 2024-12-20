import 'dart:developer' as dev;

import 'package:fadi_bring_me_app/database/repository/database_repository.dart';
import 'package:fadi_bring_me_app/features/folder_screen/widgets/task_counter_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_snackbar/timer_snackbar.dart';

class FolderScreen extends StatefulWidget {
  const FolderScreen({
    super.key,
  });

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  final SharedPreferencesAsync prefs = SharedPreferencesAsync();

  int currentTaskCount = 0;

  void loadItemCount() async {
    int taskCount = await context.read<DatabaseRepository>().productCount;

    if (taskCount != currentTaskCount) {
      setState(() {
        currentTaskCount = taskCount;
      });
    }
    // await prefs.setInt(counterName, _counter);
  }

  @override
  Widget build(BuildContext context) {
    // Hier erstellen wir den String, der als "Produktname" übergeben wird.
    String newProduct = "Neuer Ordner"; // Beispiel-Produktname
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "BringMe",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          IconButton(
            onPressed: () => timerSnackbar(
              context: context,
              contentText: "Ein neuer Ordner wurde hinzugefügt.",
              buttonPrefixWidget: const Icon(
                Icons.keyboard_return_outlined,
                color: Colors.white,
              ),
              afterTimeExecute: () =>
                  dev.log("Ein neuer Ordner wurde hinzugefügt."),
              second: 5, // Benachrichtigung nach 5 Sekunden
            ),
            icon: const Icon(
              Icons.create_new_folder_outlined,
              color: Colors.white,
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
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        children: [
                          FutureBuilder(
                            future: context
                                .read<DatabaseRepository>()
                                .addProduct(newProduct),
                            builder:
                                (context, AsyncSnapshot<dynamic> snapshot) {
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
                                return TaskCounterCard(
                                    taskCount: currentTaskCount);
                              }
                              return TaskCounterCard(
                                  taskCount: currentTaskCount);

                              /* Text(
                                "Noch keine Daten vorhanden.",
                                style: TextStyle(color: Colors.white),
                              )*/
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 2)
            ],
          ),
        ),
      ),
    );
  }
}
