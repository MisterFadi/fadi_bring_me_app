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
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
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
                    future: context
                        .read<DatabaseRepository>()
                        .getCountrys(), //! Hier war die Veränderung
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
                height: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
