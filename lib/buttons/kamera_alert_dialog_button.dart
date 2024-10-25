import 'package:flutter/cupertino.dart';

class KameraAlertDialogButton extends StatelessWidget {
  const KameraAlertDialogButton({
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
