import 'dart:async';
import 'dart:io';

import 'package:fadi_bring_me_app/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KameraScreen extends StatefulWidget {
  const KameraScreen({
    super.key,
  });

  @override
  State<KameraScreen> createState() => _KameraScreenState();
}

class _KameraScreenState extends State<KameraScreen> {
  final prefs = SharedPreferences.getInstance();

  File? selectedImage;
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
  void initState() {
    selectedImage = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    pickImageFromGallery();
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
                    pickImageFromCamera();
                  },
                  child: const Text(
                    "      Kamera       ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                selectedImage != null
                    ? Image.file(
                        selectedImage!,
                        scale: 0.2,
                      )
                    : const Text("Bilder hier einfügen"),
                const Expanded(
                  child: SizedBox(),
                ),
                // const RichtlinienWidget(),
                // const SizedBox(
                //   height: 30,
                // ),
              ],
            ),

            //child: Image(image: AssetImage("assets/images/Kamera_open.png")),
          ),
        ),
        backgroundColor: backgroundColor

        //bottomNavigationBar: NavigationBar(destinations: destinations)
        );
  }

  Future pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
    });
  }

  Future pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
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
