import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  static const title = "Bring Me";

  const MainApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: MainApp.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(MainApp.title),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  child: ClipRRect(borderRadius: BorderRadius.circular(100)),
                  //Image.asset("assets/BringMe_Logo.png"),
                ),
                const Text(
                  "Bitte Sprache auswählen",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: Colors.purple,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(Icons.favorite_border),
              title: const Text("Likes"),
              selectedColor: Colors.pink,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(Icons.search),
              title: const Text("Search"),
              selectedColor: Colors.orange,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}



/*
class FlagWithLanguage extends StatelessWidget{
  const FlagWithLanguage({super.key})

@override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Column(
              children: [
                const Text(
                  "Germanys next Top-Bober! Kawaiii",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                      color: Colors.deepPurple),
                ),
                const Divider(
                  indent: 16,
                ),
                Image.asset(
                  "assets/ScreenshotKurs.png")]);});}, child: null);}}
                  */



//                   return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Color.fromARGB(255, 22, 213, 86),
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Image(
//                   image: AssetImage("assets/BringMe_Logo.png"),
//                   height: 120,
//                   width: 120,
//                 ),
//                 Text(
//                   "Bitte Sprache auswählen",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }