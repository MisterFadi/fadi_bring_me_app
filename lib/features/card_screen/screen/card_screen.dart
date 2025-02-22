import 'package:fadi_bring_me_app/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({
    super.key,
  });

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  late GenerativeModel _model;
  final String? apiKey = dotenv.env['API_KEY'];
  final _controller = TextEditingController();
  final _messages = [];
  @override
  void initState() {
    super.initState();
    if (apiKey != null) {
      _model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey!);
    }
  }

  void _sendMessage() async {
    if (_controller.text.isEmpty || apiKey == null) return;

    String userMessage = _controller.text;
    setState(() {
      _messages.add({'user': userMessage});
    });
    _controller.clear();

    final content = [Content.text(userMessage)];
    final response = await _model.generateContent(content);

    setState(() {
      _messages.add({'gemini': response.text ?? 'No response'});
    });
  }

  Future<void> handleRefresh() async {
    // reloading takes some time
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Künstliche Intelligenz",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    return Align(
                      alignment: message.containsKey('user')
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            //border: Border.all(),
                            color: message.containsKey('user')
                                ? Colors.green.shade600
                                : Colors.green.shade800),
                        child: Text(
                          textAlign: message.containsKey('user')
                              ? TextAlign.end
                              : TextAlign.start,
                          style: TextStyle(
                            color: message.containsKey('user')
                                ? Colors.white
                                : Colors.white,
                          ),
                          message.containsKey('user')
                              ? '${message['user']}'
                              : '${message['gemini']}',
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: appColor),
                        textInputAction: TextInputAction.send,
                        onSubmitted: (value) {
                          _sendMessage();
                        },
                        controller: _controller,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: colorTextFormField),
                            hintText: "Schreibe eine Nachricht..."),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      child: IconButton(
                        color: whiteColor,
                        icon: const Icon(Icons.send),
                        onPressed: _sendMessage,
                      ),
                    ),
                  ],
                ),
              ),
              /*
              Expanded(
                child: LiquidPullToRefresh(
                  onRefresh: handleRefresh,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 29, 110, 45),
                          width: 0.5),
                      color: Colors.green.shade800,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Expanded(
                        child: ListView(
                          children: [
                            const Expanded(
                              child: SizedBox(),
                            ), //!---------- Nicht hart cooden
                            Text(
                              "!!!! Hier Gemini einbauen !!!",
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      
                    ),
                  ),
                ),
                */

              const SizedBox(
                height: 2,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
