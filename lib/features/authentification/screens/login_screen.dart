import 'package:fadi_bring_me_app/features/authentification/screens/sign_up_screen.dart';
import 'package:fadi_bring_me_app/features/authentification/widgets/oder_devider_widget.dart';
import 'package:fadi_bring_me_app/shared/anmelde_button.dart';
import 'package:fadi_bring_me_app/shared/richtlinien_widget.dart';
import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required String language});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
              child: TextFormField(
                style: const TextStyle(color: Colors.black54),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  // labelText: "Email",
                  // labelStyle: const TextStyle(fontSize: 20, color: Colors.blueGrey),
                  hintText: "Email oder Telefonnummer",
                  hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
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
                  hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 27),
                const AnmeldeButton(
                  contHeight: 50,
                  contWidth: 150,
                ),
                const SizedBox(width: 40),
                GestureDetector(
                  onTap: () {
                    print("Sie haben ihr Passwort vergessen?");
                  },
                  child: Text("Passwort vergessen?",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const OderDeviderWidget(),

            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()));
              },
              child: Text(
                "Noch kein Account? Hier Registrieren",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.right,
              ),
            ),
            //const SizedBox(height: 6),
            const SizedBox(height: 15),
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
            // const SizedBox(height: 80),
            const Spacer(),
            const RichtlinienWidget(),
          ],
        ),
      ),
    );
  }
}
