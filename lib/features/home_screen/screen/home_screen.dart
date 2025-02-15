import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fadi_bring_me_app/config/colors.dart';
import 'package:fadi_bring_me_app/features/authentification/screens/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  // New HomeScreen

  /*
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.4,
        maxChildSize: 0.5,
        minChildSize: 0.32,
        expand: true,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: const LoginScreen(),
        ),
      ),
    );
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColorLogo,
      body: SafeArea(
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            // alignment: Alignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/ShoppingListeImage_2 Kopie.jpeg",
                  fit: BoxFit.fill,
                  width: 300,
                  height: 620,
                ),
              ),
              Positioned(
                left: 60,
                top: 195,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText("Apfel"),
                    TyperAnimatedText("Birne"),
                    TyperAnimatedText("Karotte"),
                    TyperAnimatedText("Orange"),
                    TyperAnimatedText("Zitrone"),
                  ],
                  repeatForever: true,
                ),
              ),
              Positioned(
                left: 60,
                top: 230,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText("HimbeerKuchen"),
                    TyperAnimatedText("Tiramisu"),
                    TyperAnimatedText("Kaiserschmarn"),
                    TyperAnimatedText("VanilleEis"),
                    TyperAnimatedText("Schokoladen-Mousse"),
                  ],
                  repeatForever: true,
                ),
              ),
              Positioned(
                left: 60,
                top: 265,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText("Wasser"),
                    TyperAnimatedText("Sprite"),
                    TyperAnimatedText("Mexo-Mix"),
                    TyperAnimatedText("Vitaminsaft"),
                    TyperAnimatedText("Schokoladen-Mousse"),
                  ],
                  repeatForever: true,
                ),
              ),
              Positioned(
                left: 30,
                top: 510,
                width: 230,
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(appColor)),
                  onPressed: () {
                    showModalBottomSheet(
                      useSafeArea: true,
                      isScrollControlled: true,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10)),
                      ),
                      builder: (BuildContext context) {
                        return const LoginScreen();
                      },
                    );
                  },
                  child: AnimatedTextKit(
                    pause: const Duration(seconds: 5),
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Einkauf starten",
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                    repeatForever: true,
                  ),
                ),
              ),
              Positioned(
                top: -40,
                left: 50,
                child: Transform.scale(
                  scale: 1.3,
                  child: Image.asset(
                    "assets/gif/SplashScreen 2.gif",
                    width: 200,
                    height: 200,
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

/*
// Original page
import 'dart:io';

import 'package:fadi_bring_me_app/database/repository/database_repository.dart';
import 'package:fadi_bring_me_app/features/authentification/screens/login_screen.dart';
import 'package:fadi_bring_me_app/features/authentification/widgets/steck_brief_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 5),
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  "assets/logo/BringMe_Logo.png",
                  fit: BoxFit.cover,
                  width: 120,
                  height: 120,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Text(
              //   "Bitte Sprache auswählen",
              //   style: Theme.of(context).textTheme.headlineMedium,
              // ),
              const Divider(
                thickness: 3,
                height: 15,
                indent: 35,
                endIndent: 35,
                color: Color.fromARGB(100, 242, 232, 207),
              ),
              Expanded(
                child: Scrollbar(
                  trackVisibility: true,
                  child: FutureBuilder(
                    future: context.read<DatabaseRepository>().getCountrys(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Ladeanzeige
                        return Center(
                          child: Platform.isAndroid
                              ? const CircularProgressIndicator()
                              : const CupertinoActivityIndicator(),
                        );
                      }
                      return ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              //print(snapshot.data![index].imageTitle);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(
                                    language: snapshot.data![index].imageTitle,
                                  ),
                                ),
                              );
                            },
                            child: SteckBriefWidget(
                              image: snapshot.data![index].imagePath,
                              title: snapshot.data![index].imageTitle,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 2);
                        },
                        itemCount: snapshot.data!.length,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
