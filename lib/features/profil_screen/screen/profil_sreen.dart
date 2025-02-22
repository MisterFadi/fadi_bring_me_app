import 'dart:io';

import 'package:fadi_bring_me_app/config/colors.dart';
import 'package:fadi_bring_me_app/database/firebase/firebase_auth_repo.dart';
import 'package:fadi_bring_me_app/features/home_screen/screen/home_screen.dart';
import 'package:fadi_bring_me_app/shared/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({
    super.key,
  });

  @override
  State<ProfilScreen> createState() => ProfilScreenState();
}

class ProfilScreenState extends State<ProfilScreen> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final prefs = SharedPreferences.getInstance();

  File? selectedImage;

  @override
  void initState() {
    super.initState();
    loadUsername();
    loadImage();
  }

  Future<void> loadUsername() async {
    final user = context.read<FirebaseAuthRepo>().currentUser;
    if (user != null) {
      await context.read<UserNotifier>().loadUsername(user.userId);
    }
  }

  Future<void> deleteAccount() async {
    final user = context.read<FirebaseAuthRepo>().currentUser;
    if (user != null) {
      await context.read<FirebaseAuthRepo>().deleteAccount(user.userId);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  Future<void> saveUsername(String newUsername) async {
    final user = context.read<FirebaseAuthRepo>().currentUser;
    if (user != null) {
      await context.read<UserNotifier>().saveUsername(user.userId, newUsername);
      setState(() {
        nameController.text = newUsername;
      });
    }
  }

  void deleteAccountDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: alertDialog,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
          title: const Text(
            "Konto löschen",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          content: Text(
            "Möchtest du dein Konto wirklich löschen?",
            style: TextStyle(color: whiteColor, fontSize: 20),
          ),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(appColorLogo)),
              onPressed: () async {
                deleteAccount();
                Navigator.of(context).pop();
              },
              child: Text(
                "Löschen",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const Expanded(child: SizedBox()),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Abbrechen",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        );
      },
    );
  }

  void showEditUsernameDialog() {
    //nameController.text = "fgh";
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: alertDialog,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
          title: Text(
            FirebaseAuthRepo().currentUser!.email!.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          content: TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: "Neuer Benutzername",
              labelStyle: TextStyle(color: whiteColor),
              enabledBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 250, 245)),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 250, 245)),
              ),
            ),
            style: TextStyle(color: whiteColor),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Abbrechen",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(appColorLogo)),
              onPressed: () {
                saveUsername(nameController.text);
                Navigator.of(context).pop();
              },
              child: Text(
                "Speichern",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        );
      },
    );
  }

  void changePasswordDialog() {
    //passwordController.text = "";
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: alertDialog,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
          title: Text(
            FirebaseAuthRepo().currentUser!.email!.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          content: TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Neues Passwort",
              labelStyle: TextStyle(color: whiteColor),
              enabledBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 250, 245)),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 250, 245)),
              ),
            ),
            style: TextStyle(color: whiteColor),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Abbrechen",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(appColorLogo)),
              onPressed: () {
                //_saveUsername(nameController.text);
                Navigator.of(context).pop();
              },
              child: Text(
                "Speichern",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        );
      },
    );
  }

  void logutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: alertDialog,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
          title: const Text(
            "Abmelden",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          content: Text(
            "Möchtest du dich wirklich abmelden?",
            style: TextStyle(color: whiteColor, fontSize: 20),
          ),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(appColorLogo)),
              onPressed: () {
                FirebaseAuthRepo().signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: Text(
                "Abmelden",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Abbrechen",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        );
      },
    );
  }

  void editProfilImage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: alertDialog,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
          title: const Text(
            "Bild ändern",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          content: Text(
            "Darf BringMe zugreifen?",
            style: TextStyle(color: whiteColor, fontSize: 20),
          ),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(appColorLogo)),
              onPressed: () {
                pickImageFromGallery();
                Navigator.of(context).pop();
              },
              child: Text(
                "Galarie",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(appColorLogo)),
              onPressed: () {
                pickImageFromCamera();
                Navigator.of(context).pop();
              },
              child: Text(
                "Kamera",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        );
      },
    );
  }
//__________________________________

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Profil Einstellungen",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: ListView(
        children: [
          SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: selectedImage != null
                            ? FileImage(selectedImage!)
                            : const AssetImage("assets/images/leerePerson.jpg"),
                      ),
                      Positioned(
                        left: 100,
                        bottom: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: navBarColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: IconButton(
                            onPressed: () {
                              editProfilImage();
                            },
                            icon: const Icon(Icons.edit),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Grüß dich",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        nameController.text,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  // Text(FirebaseAuthRepo().currentUser!.email!.toString(),
                  //     textAlign: TextAlign.center,
                  //     style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 20),
                  Container(
                    decoration: const BoxDecoration(),
                    width: 330,
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            color: appColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Text(
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                    "Benutzernamen ändern",
                                  ),
                                  const Expanded(child: SizedBox()),
                                  IconButton(
                                    color: whiteColor,
                                    onPressed: () {
                                      showEditUsernameDialog();
                                    },
                                    icon: const Icon(Icons.arrow_forward_ios),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: appColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                    "Passwort ändern",
                                  ),
                                  const Expanded(child: SizedBox()),
                                  IconButton(
                                      color: whiteColor,
                                      onPressed: () {
                                        changePasswordDialog();
                                      },
                                      icon: const Icon(Icons.arrow_forward_ios))
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: appColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                    "Datenschutzrichtlinien",
                                  ),
                                  const Expanded(
                                    child: SizedBox(),
                                  ),
                                  IconButton(
                                      color: whiteColor,
                                      onPressed: () {
                                        _launchUrl();
                                      },
                                      icon: const Icon(Icons.arrow_forward_ios))
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: appColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                    "Konto löschen",
                                  ),
                                  const Expanded(child: SizedBox()),
                                  IconButton(
                                    color: whiteColor,
                                    onPressed: () {
                                      deleteAccountDialog();
                                    },
                                    icon: const Icon(Icons.arrow_forward_ios),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: appColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                    "Abmelden",
                                  ),
                                  const Expanded(
                                    child: SizedBox(),
                                  ),
                                  IconButton(
                                    color: whiteColor,
                                    onPressed: () {
                                      logutDialog();
                                    },
                                    icon: const Icon(Icons.arrow_forward_ios),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const SizedBox(height: 30),
                  // LogoutButton(
                  //   text: "Abmelden",
                  //   onPressed: () {
                  //     FirebaseAuthRepo().signOut();
                  //     Navigator.of(context).pushReplacement(
                  //       MaterialPageRoute(
                  //         builder: (context) => const HomeScreen(),
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
      //bottomNavigationBar: NavigationBar(destinations: destinations)
    );
  }

  Future<void> loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profile_image_path');
    if (imagePath != null) {
      setState(() {
        selectedImage = File(imagePath);
      });
    }
  }

  Future<void> saveImage(File image) async {
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = '${directory.path}/profile_image.png';
    final savedImage = await image.copy(imagePath);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image_path', savedImage.path);

    setState(() {
      selectedImage = savedImage;
    });
  }

  Future pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) return;
    await saveImage(File(returnedImage.path));
  }

  Future pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    await saveImage(File(returnedImage.path));
  }
}

// class DeleteAccountDialog extends StatelessWidget {
//   final VoidCallback onDelete;

//   const DeleteAccountDialog({required this.onDelete, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//         side: const BorderSide(color: Colors.white, width: 1),
//       ),
//       title: const Text(
//         "Konto löschen",
//         style: TextStyle(
//           color: Color.fromARGB(255, 246, 191, 143),
//         ),
//       ),
//       content: const Text(
//         "Möchten Sie Ihr Konto wirklich löschen?",
//         style: TextStyle(
//           color: Color.fromARGB(255, 255, 250, 245),
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: const Text(
//             "Abbrechen",
//             style: TextStyle(
//               color: Color.fromARGB(255, 255, 108, 3),
//             ),
//           ),
//         ),
//         TextButton(
//           onPressed: () async {
//             Navigator.of(context).pop();
//             onDelete();
//           },
//           child: const Text(
//             "Löschen",
//             style: TextStyle(
//               color: Color.fromARGB(255, 255, 108, 3),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

Future<void> _launchUrl() async {
  final Uri url = Uri.parse(
      "https://de.m.wikipedia.org/wiki/Allgemeine_Geschäftsbedingungen");
  if (!await launchUrl(url)) {
    throw Exception("Seite konnte nicht geladen werden $url");
  }
}

/*
  void _showEditUsernameDialogs(BuildContext context, String? username) {
    //nameController.text = username ?? "";
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Colors.white, width: 1),
          ),
          title: const Text(
            "Benutzernamen ändern",
            style: TextStyle(
              color: Color.fromARGB(255, 246, 191, 143),
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              fontFamily: "SFProDisplay",
            ),
          ),
          content: const TextField(
            //controller: nameController,
            decoration: InputDecoration(
              labelText: "Neuer Benutzername",
              labelStyle: TextStyle(color: Color.fromARGB(255, 255, 250, 245)),
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 250, 245)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 250, 245)),
              ),
            ),
            style: TextStyle(
              color: Color.fromARGB(255, 255, 254, 254),
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              fontFamily: "SFProDisplay",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Abbrechen",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 108, 3),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  fontFamily: "SFProDisplay",
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // _saveUsername(_usernameController.text);
                Navigator.of(context).pop();
              },
              child: const Text(
                "Speichern",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 108, 3),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  fontFamily: "SFProDisplay",
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
*/
/*
 Text("Kontoeinstellungen",
                              style = Theme.of(context).textTheme.bodyLarge),
                          Text("     - Dein Profil",
                              style = Theme.of(context).textTheme.bodySmall),
                          Text("     - Passwort ändern",
                              style = Theme.of(context).textTheme.bodySmall),
                          Text("     - Konto wechseln",
                              style = Theme.of(context).textTheme.bodySmall),
                          Text("     - Gruppeneinstellungen",
                              style = Theme.of(context).textTheme.bodySmall),
                          Text("     - Datenschutz",
                              style = Theme.of(context).textTheme.bodySmall),
                          Text("     - Konto löschen",
                              style = Theme.of(context).textTheme.bodySmall),
                          // Text("     - Abmelden",
                          //     style: Theme.of(context).textTheme.bodySmall),
*/
