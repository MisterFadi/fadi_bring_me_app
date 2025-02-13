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
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                child: TextFormField(
                  controller: repeatEmailController,
                  style: const TextStyle(color: Colors.black54),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    // labelText: "Email",
                    // labelStyle: const TextStyle(fontSize: 20, color: Colors.blueGrey),
                    hintText: "Email wiederholen",
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
                  controller: passwordController,
                  obscureText: showPassword,
                  style: const TextStyle(color: Colors.black54),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                          showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
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
                  controller: repeatPasswordController,
                  obscureText: showNewPassword,
                  style: const TextStyle(color: Colors.black54),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                          showNewPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
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
                        const TextStyle(fontSize: 15, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SignInButton(
                text: "Sign Up!",
                onPressed: () async {
                  if (passwordController.text ==
                      repeatPasswordController.text) {
                    try {
                      await context
                          .read<AuthRepo>()
                          .createUserWithEmailAndPassword(
                            emailController.text,
                            passwordController.text,
                          );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    } catch (e) {
                      print(e);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text("Registration failed: ${e.toString()}")),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Passwords do not match")),
                    );
                  }
                },
                contHeight: 60,
                contWidth: 335,
                emailController: emailController,
                passwordController: passwordController,
              ),
              const SizedBox(height: 40),
              const Spacer(),
              const RichtlinienWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthRepository {
  Future<void> createWithEmailAndPassword(
      String email, String password) async {}

  signInWithEmailAndPassword(String trim, String trim2) {}
}
