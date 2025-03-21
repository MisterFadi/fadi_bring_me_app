import 'package:fadi_bring_me_app/config/colors.dart';
import 'package:fadi_bring_me_app/features/search_list.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({
    super.key,
  });

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
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
                      builder: (context) => const SearchList(),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: appColorLogo),
                    ],
                    borderRadius: BorderRadius.circular(10),
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
                          builder: (context) => const SearchList()));
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
                    borderRadius: BorderRadius.circular(10),
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
                          builder: (context) => const SearchList()));
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text("Wocheneinkaufs-Liste",
                        style: Theme.of(context).textTheme.headlineSmall),
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchList()));
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text("+ Neue Liste",
                        style: Theme.of(context).textTheme.headlineSmall),
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchList()));
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("Dessert",
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchList()));
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("Shopping",
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchList()));
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("Büro",
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
