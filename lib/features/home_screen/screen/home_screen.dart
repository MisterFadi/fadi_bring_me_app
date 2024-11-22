import 'package:fadi_bring_me_app/database/repository/database_repository.dart';
import 'package:fadi_bring_me_app/features/authentification/screens/login_screen.dart';
import 'package:fadi_bring_me_app/features/authentification/widgets/steck_brief_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final DatabaseRepository repository;

  const HomeScreen({
    super.key,
    required this.repository,
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
                width: 120,
                height: 120,
              ),
            ),
            Text(
              "Bitte Sprache auswählen",
              style: Theme.of(context).textTheme.headlineMedium,
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
                child: FutureBuilder(
                  future: repository.getCountrys(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Ladeanzeige
                      return const Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      );
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            //print(snapshot.data![index].imageTitle);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(
                                  language: snapshot.data![index].imageTitle,
                                  repository: repository,
                                ),
                              ),
                            );
                          },
                          child: SteckBriefWidget(
                            image: snapshot.data![index].imagePath,
                            title: snapshot.data![index].imageTitle,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 2);
                      },
                      itemCount: snapshot.data!.length,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
