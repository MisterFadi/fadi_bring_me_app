//import 'dart:ui';
import 'dart:ui';

import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            color: Color.fromARGB(255, 48, 48, 48),
          ),
          height: 750,
        ),
        Positioned(
          top: -60,
          left: 70,
          child: Transform.scale(
            scale: 1.5,
          ),
        ),

        Positioned(
          top: 180,
          left: 35,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: Container(
                height: 340,
                width: 330,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 0.2),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Divider(
                        thickness: 0.5,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.abc, color: Colors.white),
                                    SizedBox(width: 4),
                                    Icon(Icons.abc, color: Colors.white),
                                    SizedBox(width: 4),
                                    Icon(Icons.abc, color: Colors.white),
                                    SizedBox(width: 4),
                                    Icon(Icons.abc, color: Colors.white)
                                  ],
                                )
                              ]),
                          Expanded(child: SizedBox()),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Reviews",
                                    style: TextStyle(color: Colors.white)),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(width: 2),
                                    Icon(Icons.star,
                                        color: Colors.white, size: 16),
                                    SizedBox(width: 2),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(width: 2),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(width: 2),
                                    Icon(
                                      Icons.star_outline,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(width: 16),
                                    Text(
                                      "4.0",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    )
                                  ],
                                )
                              ]),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        // const CounterButton(),
      ],
    );
  }
}
