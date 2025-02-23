import 'package:fadi_bring_me_app/config/colors.dart';
import 'package:fadi_bring_me_app/features/list_screen/screen/list_screen.dart';
import 'package:fadi_bring_me_app/features/search_list.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Listenansicht",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
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
                      builder: (context) => const SearchList(),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: appColor),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text("Party-Liste",
                        style: Theme.of(context).textTheme.bodyLarge),
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
                    boxShadow: [
                      BoxShadow(
                        color: appColor,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text("Shopping-Liste",
                        style: Theme.of(context).textTheme.bodyLarge),
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
                    boxShadow: [
                      BoxShadow(color: appColor),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text("Wocheneinkaufs-Liste",
                        style: Theme.of(context).textTheme.bodyLarge,
                        selectionColor: Colors.blueAccent),
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
                    boxShadow: [
                      BoxShadow(color: appColor),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text("+ Neue Liste",
                        style: Theme.of(context).textTheme.bodyLarge),
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
                        boxShadow: [
                          BoxShadow(color: appColor),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("Dessert",
                            style: Theme.of(context).textTheme.bodyLarge),
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
                        boxShadow: [
                          BoxShadow(color: appColor),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("Shopping",
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
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
                        boxShadow: [
                          BoxShadow(color: appColor),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("Büro",
                            style: Theme.of(context).textTheme.bodyLarge),
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
      backgroundColor: backgroundColor,
    );
  }
}
