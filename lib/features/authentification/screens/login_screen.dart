import 'package:fadi_bring_me_app/database/repository/database_repository.dart';
import 'package:fadi_bring_me_app/features/authentification/screens/sign_up_screen.dart';
import 'package:fadi_bring_me_app/features/authentification/widgets/oder_devider_widget.dart';
import 'package:fadi_bring_me_app/shared/anmelde_button.dart';
import 'package:fadi_bring_me_app/shared/richtlinien_widget.dart';
import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  final DatabaseRepository repository;
  const LoginScreen(
      {super.key, required String language, required this.repository});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = true;

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
                obscureText: showPassword,
                style: const TextStyle(color: Colors.black54),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                        showPassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black),
                    onPressed: () {
                      setState(
                        () {
                          showPassword = !showPassword; // Sichtbarkeeit
                        },
                      );
                    },
                  ),

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
                AnmeldeButton(
                  contHeight: 50,
                  contWidth: 150,
                  repository: widget.repository,
                ),
                const Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    // print("Sie haben ihr Passwort vergessen?");
                  },
                  child: Text(
                    "Passwort vergessen?",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(
                  width: 30,
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
                        builder: (context) => SignUpScreen(
                              repository: widget.repository,
                            )));
              },
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.displaySmall,
                  children: const <TextSpan>[
                    TextSpan(
                      text: "Noch kein Account? ",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    TextSpan(
                        text: "Hier Registrieren",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              // child: Text(
              //   "Noch kein Account? Hier Registrieren",
              //   style: Theme.of(context).textTheme.bodyMedium,
              //   textAlign: TextAlign.right,
              // ),
            ),
            //const SizedBox(height: 6),
            const SizedBox(height: 15),
            SocialLoginButton(
              width: 300,
              borderRadius: 15,
              buttonType: SocialLoginButtonType.appleBlack,
              onPressed: () {
                _launchUrlA();
                //print("Apple");
              },
              //text: "Anmelden mit Apple",
            ),
            const SizedBox(height: 10),
            SocialLoginButton(
              width: 300,
              borderRadius: 15,
              buttonType: SocialLoginButtonType.google,
              onPressed: () {
                _launchUrlG();
                //print("Google");
              },
              //text: "Anmelden mit Google",
            ),
            const Spacer(),
            const RichtlinienWidget(),
          ],
        ),
      ),
    );
  }
}

// Anmedelnde mit Apple
Future<void> _launchUrlA() async {
  final Uri urla = Uri.parse("https://support.apple.com/de-de/108647");
  if (!await launchUrl(urla)) {
    throw Exception("Seite konnte nicht geladen werden $urla");
  }
}

// Anmelden mit Google
Future<void> _launchUrlG() async {
  final Uri urlg = Uri.parse(
      "https://accounts.google.com/v3/signin/identifier?continue=https%3A%2F%2Fmyaccount.google.com%3Futm_source%3Daccount-marketing-page%26utm_medium%3Dgo-to-account-button%26gar%3DWzEzMywiMjM2NzM2Il0%26sl%3Dtrue&ifkv=AcMMx-fDv4ESgor_zUcoT4WS1kMxjPi5GfLtGy_ldidV55I1zPusVPPF6pvPUNoWjZyAVWhmS4rv&service=accountsettings&flowName=GlifWebSignIn&flowEntry=ServiceLogin&dsh=S991440918%3A1733412585038140&ddm=1");
  if (!await launchUrl(urlg)) {
    throw Exception("Seite konnte nicht geladen werden $urlg");
  }
}
