import 'package:fadi_bring_me_app/database/repository/database_repository.dart';
import 'package:fadi_bring_me_app/shared/anmelde_button.dart';
import 'package:fadi_bring_me_app/shared/richtlinien_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final DatabaseRepository repository;
  const SignUpScreen({
    super.key,
    required this.repository,
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
                child: TextFormField(
                  style: const TextStyle(color: Colors.black54),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    // labelText: "Email",
                    // labelStyle: const TextStyle(fontSize: 20, color: Colors.blueGrey),
                    hintText: "Email oder Telefonnummer",
                    hintStyle:
                        const TextStyle(fontSize: 12, color: Colors.grey),
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
                child: TextFormField(
                  style: const TextStyle(color: Colors.black54),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    // labelText: "Email",
                    // labelStyle: const TextStyle(fontSize: 20, color: Colors.blueGrey),
                    hintText: "Email oder Telefonnumme wiederholen",
                    hintStyle:
                        const TextStyle(fontSize: 12, color: Colors.grey),
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
                child: TextFormField(
                  obscureText: true,
                  style: const TextStyle(color: Colors.black54),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    // labelText: "Passwort",
                    // labelStyle: const TextStyle(fontSize: 15, color: Colors.blueGrey),
                    hintText: "Passwort",
                    hintStyle:
                        const TextStyle(fontSize: 15, color: Colors.grey),
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
                child: TextFormField(
                  obscureText: true,
                  style: const TextStyle(color: Colors.black54),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    // labelText: "Passwort",
                    // labelStyle: const TextStyle(fontSize: 15, color: Colors.blueGrey),
                    hintText: "Passwort wiederholen",
                    hintStyle:
                        const TextStyle(fontSize: 15, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              AnmeldeButton(
                contHeight: 60,
                contWidth: 330,
                repository: repository,
              ),
              const Spacer(),
              const RichtlinienWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
