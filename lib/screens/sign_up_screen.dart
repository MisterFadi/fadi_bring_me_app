import 'package:fadi_bring_me_app/buttons/anmelde_button.dart';
import 'package:fadi_bring_me_app/widgets/richtlinien_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  "assets/logo/BringMe_Logo.png",
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                child: TextField(
                  obscureText: false, // text sehen
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "Benutzername",
                    hintStyle: const TextStyle(
                      fontSize: 13,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                child: TextField(
                  obscureText: false, // text sehen
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "E-Mail oder Telefonnummer",
                    hintStyle: const TextStyle(
                      fontSize: 13,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                child: TextField(
                  obscureText: true, // text uns
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "Passwort",
                    hintStyle: const TextStyle(
                      fontSize: 13,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                child: TextField(
                  obscureText: true, // text uns
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "Passwort wiederholen",
                    hintStyle: const TextStyle(
                      fontSize: 13,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const AnmeldeButton(
                contHeight: 60,
                contWidth: 330,
              ),
              const Expanded(child: SizedBox()),
              const RichtlinienWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
