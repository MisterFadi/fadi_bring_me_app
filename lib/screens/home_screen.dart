import 'package:fadi_bring_me_app/repositories/country_data.dart';
import 'package:fadi_bring_me_app/screens/login_screen.dart';
import 'package:fadi_bring_me_app/widgets/steck_brief_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 5),
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                "assets/logo/BringMe_Logo.png",
                fit: BoxFit.cover,
                width: 80,
                height: 80,
              ),
            ),
            const Text(
              "Bitte Sprache auswählen",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const Divider(
              thickness: 3,
              height: 15,
              indent: 35,
              endIndent: 35,
              color: Color.fromARGB(100, 242, 232, 207),
            ),
            Expanded(
              child: Scrollbar(
                trackVisibility: true,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(
                                language: countrys[index].imageTitle),
                          ),
                        );
                      },
                      child: SteckBriefWidget(
                        image: countrys[index].imagePath,
                        title: countrys[index].imageTitle,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 2,
                    );
                  },
                  itemCount: countrys.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
