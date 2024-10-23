import 'package:fadi_bring_me_app/buttons/anmelde_button.dart';
import 'package:fadi_bring_me_app/screens/sign_up_screen.dart';
import 'package:fadi_bring_me_app/widgets/oder_devider_widget.dart';
import 'package:fadi_bring_me_app/widgets/richtlinien_widget.dart';
import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required String language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green,
      body: SafeArea(
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
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: TextField(
                obscureText: false, // text sehen
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: "E-Mail",
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    obscureText: true, // text unsichtbar
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      //helperText: "forgot Password",
                      hintText: "Passwort",
                      hintStyle: const TextStyle(fontSize: 12),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const AnmeldeButton(
                        contHeight: 50,
                        contWidth: 150,
                      ),
                      const SizedBox(width: 60),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const Text(
                          "Passwort vergessen?",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const OderDeviderWidget(),
                ],
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()));
              },
              child: const Text(
                "Noch kein Account? Hier Registrieren",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 10),
                  SocialLoginButton(
                    width: 350,
                    borderRadius: 15,
                    buttonType: SocialLoginButtonType.appleBlack,
                    onPressed: () {
                      print("Apple");
                    },
                    text: "Anmelden mit Apple",
                  ),
                  const SizedBox(height: 10),
                  SocialLoginButton(
                    width: 350,
                    borderRadius: 15,
                    buttonType: SocialLoginButtonType.google,
                    onPressed: () {
                      print("Google");
                    },
                    text: "Anmelden mit Google",
                  ),
                  const SizedBox(height: 10),
                  SocialLoginButton(
                    borderRadius: 15,
                    width: 350,
                    buttonType: SocialLoginButtonType.facebook,
                    onPressed: () {
                      print("Facebook");
                    },
                    text: "Anmelden mit Facebook",
                  ),
                  const SizedBox(height: 40),
                  const RichtlinienWidget()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
