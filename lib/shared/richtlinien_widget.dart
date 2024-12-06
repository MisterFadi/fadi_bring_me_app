import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RichtlinienWidget extends StatelessWidget {
  const RichtlinienWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: GestureDetector(
          onTap: () {
            // print("Indem du BringMe verwendest, stimmst du unseren Nutzungs- und Datenschutzbestimmungen zu.");
          },
          child: GestureDetector(
            onTap: _launchUrl,
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.displaySmall,
                children: const <TextSpan>[
                  TextSpan(
                    text: "Indem du BringMe verwendest, stimmst du unseren ",
                  ),
                  TextSpan(
                    text: "Nutzungs- und \nDatenschutzbestimmungen ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: "zu"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _launchUrl() async {
  final Uri url = Uri.parse(
      "https://de.m.wikipedia.org/wiki/Allgemeine_Geschäftsbedingungen");
  if (!await launchUrl(url)) {
    throw Exception("Seite konnte nicht geladen werden $url");
  }
}


/*
          "Indem du BringMe verwendest, stimmst du unseren Nutzungs- und Datenschutzbestimmungen zu.",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displaySmall),
    )
  }
}
*/
