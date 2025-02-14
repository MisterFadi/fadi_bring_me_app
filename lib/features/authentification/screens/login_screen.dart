import 'package:fadi_bring_me_app/database/repository/auth_repo.dart';
import 'package:fadi_bring_me_app/features/authentification/screens/sign_in_screen.dart';
import 'package:fadi_bring_me_app/features/authentification/widgets/oder_devider_widget.dart';
import 'package:fadi_bring_me_app/shared/login_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    //required String language,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                textAlign: TextAlign.left,
                "Willkomen auf BringMe",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 50,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onLongPress: () {
                      _launchUrlA();
                    },
                    onTap: () {
                      context.read<AuthRepo>().signInWithGoogle();
                    },
                    child: Container(
                      height: 130,
                      width: 130,
                      color: Colors.white,
                      child: const Image(
                          image: AssetImage("assets/images/Google_logo.png")),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onLongPress: () {
                      _launchUrlG();
                    },
                    onTap: () {
                      context.read<AuthRepo>().signInWithGoogle();
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.white,
                      child: const Image(
                          image: AssetImage("assets/images/Apple_logo.png")),
                    ),
                  ),
                ],
              ),

              const OderDeviderWidget(),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
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
              ),
              //const SizedBox(height: 6),

              const SizedBox(height: 10),
              /*
              TextButton(
                onPressed: () {
                  context.read<AuthRepo>().signInWithGoogle();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ListScreen(),
                    ),
                  );
                },
                child: const Text("Register with Google"),
              ),
              */

              // SocialLoginButton(
              //   width: 300,
              //   borderRadius: 15,
              //   buttonType: SocialLoginButtonType.google,
              //   onPressed: () {
              //     context.read<AuthRepo>().signInWithGoogle();
              //   }, // _launchUrlG();
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
                child: TextFormField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.black54),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    // labelText: "Email",
                    // labelStyle: const TextStyle(fontSize: 20, color: Colors.blueGrey),
                    hintText: "Email",
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: showPassword,
                  style: const TextStyle(color: Colors.black54),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                          showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black),
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    ),
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
              const SizedBox(height: 50),

              LoginButton(
                contHeight: 50,
                contWidth: 150,
                emailController: emailController,
                passwordController: passwordController,
              ),
              const Expanded(child: SizedBox()),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
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
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),
              //const Spacer(),
              //const RichtlinienWidget(),
            ],
          ),
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

// // Anmelden mit Google
Future<void> _launchUrlG() async {
  final Uri urlg = Uri.parse(
      "https://accounts.google.com/v3/signin/identifier?continue=https%3A%2F%2Fmyaccount.google.com%3Futm_source%3Daccount-marketing-page%26utm_medium%3Dgo-to-account-button%26gar%3DWzEzMywiMjM2NzM2Il0%26sl%3Dtrue&ifkv=AcMMx-fDv4ESgor_zUcoT4WS1kMxjPi5GfLtGy_ldidV55I1zPusVPPF6pvPUNoWjZyAVWhmS4rv&service=accountsettings&flowName=GlifWebSignIn&flowEntry=ServiceLogin&dsh=S991440918%3A1733412585038140&ddm=1");
  if (!await launchUrl(urlg)) {
    throw Exception("Seite konnte nicht geladen werden $urlg");
  }
}
