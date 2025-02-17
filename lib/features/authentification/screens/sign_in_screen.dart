import 'package:fadi_bring_me_app/config/colors.dart';
import 'package:fadi_bring_me_app/database/repository/auth_repo.dart';
import 'package:fadi_bring_me_app/features/home_screen/screen/home_screen.dart';
import 'package:fadi_bring_me_app/shared/richtlinien_widget.dart';
import 'package:fadi_bring_me_app/shared/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    super.key,
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final repeatEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  final nameController = TextEditingController();

  bool showPassword = true;
  bool showNewPassword = true;

  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        Text(
          textAlign: TextAlign.center,
          "Hebe dein Einkaufserlebnis \nauf ein hohes Level",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: appColor),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          child: TextFormField(
            controller: nameController,
            style: TextStyle(color: colorTextFormField),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email),
              // labelText: "Email",
              // labelStyle: const TextStyle(fontSize: 20, color: Colors.blueGrey),
              hintText: "Benutzername",
              hintStyle:
                  TextStyle(fontSize: 15, color: colorTextFormFieldHintText),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          child: TextFormField(
            controller: emailController,
            style: TextStyle(color: colorTextFormField),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email),
              // labelText: "Email",
              // labelStyle: const TextStyle(fontSize: 20, color: Colors.blueGrey),
              hintText: "Email",
              hintStyle:
                  TextStyle(fontSize: 15, color: colorTextFormFieldHintText),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          child: TextFormField(
            controller: passwordController,
            obscureText: showPassword,
            style: TextStyle(color: colorTextFormField),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
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

              prefixIcon: const Icon(Icons.lock),
              // labelText: "Passwort",
              // labelStyle: const TextStyle(fontSize: 15, color: Colors.blueGrey),
              hintText: "Passwort",
              hintStyle:
                  TextStyle(fontSize: 15, color: colorTextFormFieldHintText),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          child: TextFormField(
            controller: repeatPasswordController,
            obscureText: showNewPassword,
            style: TextStyle(color: colorTextFormField),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                    showNewPassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black),
                onPressed: () {
                  setState(
                    () {
                      showNewPassword = !showNewPassword; // Sichtbarkeeit
                    },
                  );
                },
              ),
              prefixIcon: const Icon(Icons.lock),
              // labelText: "Passwort",
              // labelStyle: const TextStyle(fontSize: 15, color: Colors.blueGrey),
              hintText: "Passwort wiederholen",
              hintStyle:
                  TextStyle(fontSize: 15, color: colorTextFormFieldHintText),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        SignInButton(
          onPressed: () async {
            if (passwordController.text == repeatPasswordController.text) {
              try {
                await context.read<AuthRepo>().createUserWithEmailAndPassword(
                    emailController.text,
                    passwordController.text,
                    nameController.text);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              } catch (e) {
                print(e);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text("Registration failed: ${e.toString()}")),
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Passwords do not match")),
              );
            }
          },
          contHeight: 50,
          contWidth: 330,
          emailController: emailController,
          passwordController: passwordController,
        ),
        const SizedBox(height: 40),
        const RichtlinienWidget(),
      ],
    );
  }
}

class AuthRepository {
  Future<void> createWithEmailAndPassword(
      String email, String password) async {}

  signInWithEmailAndPassword(String trim, String trim2) {}
}
