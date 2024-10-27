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
      body: const SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 580,
                  width: 300,
                  child: ColoredBox(color: Colors.yellow),
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
