import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KameraScreen extends StatefulWidget {
  const KameraScreen({
    super.key,
  });

  @override
  State<KameraScreen> createState() => _KameraScreenState();
}

class _KameraScreenState extends State<KameraScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: const Text("Kameranutzung"),
              content: const Text("Darf BringMe die Kamera benutzen?"),
              actions: [
                TextButton(
                  onPressed: () {
                    // Snackbar anzeigen
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(
                    //     content: Text("Hurra, du hast es geschafft!"),
                    //   ),
                    // );
                    Navigator.of(context).pop(); // Dialog schließen
                  },
                  child: Text("Abbrechen"),
                  style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.bodyMedium),
                ),
                TextButton(
                  onPressed: () {
                    // Snackbar anzeigen
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(
                    //     content: Text("Hurra, du hast es geschafft!"),
                    //   ),
                    // );
                    Navigator.of(context).pop(); // Dialog schließen
                  },
                  child: const Text("Erlauben"),
                  style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.bodyLarge),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: Center(
          child: Center(
            child: Image(image: AssetImage("assets/images/Kamera_open.png")),
          ),
        ),
      ),
      //bottomNavigationBar: NavigationBar(destinations: destinations)
    );
  }
}
