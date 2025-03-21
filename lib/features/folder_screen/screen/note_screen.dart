import 'package:fadi_bring_me_app/config/colors.dart';
import 'package:fadi_bring_me_app/database/repository/database_repository.dart';
import 'package:fadi_bring_me_app/features/folder_screen/widgets/task_counter_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({
    super.key,
  });

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final prefs = SharedPreferences.getInstance();
  final controller = TextEditingController();

  int currentTaskCount = 0;
  String taskText = ""; // Neue Eigenschaft

  void loadItemCount() async {
    //final prefs = await SharedPreferences.getInstance();
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
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Notizen",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () => timerSnackbar(
        //       context: context,
        //       contentText: "Ein neuer Ordner wurde hinzugefügt.",
        //       buttonPrefixWidget: const Icon(
        //         Icons.keyboard_return_outlined,
        //         color: Colors.white,
        //       ),
        //       afterTimeExecute: () =>
        //           dev.log("Ein neuer Ordner wurde hinzugefügt."),
        //       second: 5, // Benachrichtigung nach 5 Sekunden
        //     ),
        //     icon: const Icon(
        //       Icons.create_new_folder_outlined,
        //       color: Colors.white,
        //       size: 30,
        //     ),
        //   ),
        // ],
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
                                    taskCount: currentTaskCount,
                                    taskText: taskText); // Übergabe des Textes
                              }
                              return TaskCounterCard(
                                  taskCount: currentTaskCount,
                                  taskText: taskText); // Übergabe des Textes

                              /* Text(
                                "Noch keine Daten vorhanden.",
                                style: TextStyle(color: Colors.white),
                              )*/
                            },
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(color: appColorLogo),
                                    textInputAction: TextInputAction.send,
                                    onSubmitted: (value) {
                                      setState(() {
                                        taskText =
                                            value; // Speichern des Textes
                                      });
                                    },
                                    controller: controller,
                                    decoration: InputDecoration(
                                        hintStyle: TextStyle(color: whiteColor),
                                        hintText: "Deine Notizen"),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                CircleAvatar(
                                  backgroundColor: appColorLogo,
                                  child: IconButton(
                                    color: appColor,
                                    icon: const Icon(Icons.send),
                                    onPressed: () {
                                      setState(() {
                                        taskText = controller
                                            .text; // Speichern des Textes
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
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
