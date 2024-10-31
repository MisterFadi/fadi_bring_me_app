import 'package:fadi_bring_me_app/features/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text("BringMe", style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(width: 65),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()));
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
              size: 30,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ListScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 242, 232, 207),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Center(
                    child: Text("Party-Liste",
                        style: Theme.of(context).textTheme.headlineSmall),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListScreen()));
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 242, 232, 207),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Center(
                    child: Text("Shopping-Liste",
                        style: Theme.of(context).textTheme.headlineSmall),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListScreen()));
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 242, 232, 207),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Center(
                    child: Text("Wocheneinkaufs-Liste",
                        style: Theme.of(context).textTheme.headlineSmall),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListScreen()));
                },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 242, 232, 207),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Center(
                    child: Text("+ Neue Liste",
                        style: Theme.of(context).textTheme.headlineSmall),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              Row(
                children: [
                  const SizedBox(width: 35),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListScreen()));
                    },
                    child: Container(
                      height: 150,
                      width: 100,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 242, 232, 207),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Center(
                        child: Text("Dessert",
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListScreen()));
                    },
                    child: Container(
                      height: 150,
                      width: 100,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 242, 232, 207),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Center(
                        child: Text("Shopping",
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListScreen()));
                    },
                    child: Container(
                      height: 150,
                      width: 100,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 242, 232, 207),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Center(
                        child: Text("Büro",
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
