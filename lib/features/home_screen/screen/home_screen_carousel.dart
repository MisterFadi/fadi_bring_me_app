import 'dart:developer' as dev;

import 'package:carousel_images/carousel_images.dart';
import 'package:flutter/material.dart';

class HomeScreenCarousel extends StatelessWidget {
  final List<String> listImages = [
    "assets/images/Flag_of_France.jpg",
    "assets/images/Flag_of_Germany.jpg",
    "assets/images/Flag_of_Italy.jpg",
    "assets/images/Flag_of_GB.jpg",
    "assets/images/Flag_of_Spain.jpg",
    "assets/images/Flag_of_Russia.jpg",
    "assets/images/Flag_of_Poland.jpg",
    "assets/images/Flag_of_Syria.jpg"
  ];

  HomeScreenCarousel({super.key});

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
                const SizedBox(
                  height: 60,
                ),
                Text(
                  "Willkomen :)",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 30),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    "assets/logo/BringMe_Logo.png",
                    fit: BoxFit.cover,
                    width: 160,
                    height: 160,
                  ),
                ),
                const SizedBox(
                  height: 40,
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
                const SizedBox(
                  height: 40,
                ),
                CarouselImages(
                  scaleFactor: 0.4,
                  listImages: listImages,
                  height: 250.0,
                  borderRadius: 30.0,
                  cachedNetworkImage: true,
                  verticalAlignment: Alignment.bottomCenter,
                  onTap: (index) {
                    dev.log('Tapped on page $index');
                  },
                )
              ],
            ),
          ),
        ));
  }
}
