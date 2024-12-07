import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class KameraScreen extends StatefulWidget {
  const KameraScreen({
    super.key,
  });

  @override
  State<KameraScreen> createState() => _KameraScreenState();
}

class _KameraScreenState extends State<KameraScreen> {
  File? _selectedImage;
/*
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
                  style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.bodyMedium),
                  child: const Text("Abbrechen"),
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
                  style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.bodyLarge),
                  child: const Text("Erlauben"),
                ),
              ],
            );
          },
        );
      },
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    _pickImageFromGallery();
                  },
                  child: const Text(
                    "     Gallery       ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    _pickImageFromKamera();
                  },
                  child: const Text(
                    "      Kamera       ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 50),
                _selectedImage != null
                    ? Image.file(_selectedImage!)
                    : const Text("Bitte auswählen")
              ],
            ),

            //child: Image(image: AssetImage("assets/images/Kamera_open.png")),
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor

        //bottomNavigationBar: NavigationBar(destinations: destinations)
        );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  Future _pickImageFromKamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }
/*
  chooseImage() async {
    final getImage = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      if (getImage != null) {
        imageFile = File(getImage.path);
      }
    });
  }*/
}
