import 'package:flutter/cupertino.dart';

class NewFolderButton extends StatelessWidget {
  const NewFolderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CupertinoAlertDialog(
      title: Text("Kamera Nutzung"),
      content: Text("Darf BringMe die Kamera benutzen?"),
    );
  }
}
