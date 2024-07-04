import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import '../constants/prompts.dart';

const String contextResponse = "Hello! My name is Aadarsh Verma";
const int preInsertedPrompts = 1;

const String userRole = 'user';
const String modelRole = 'model';

class ChatBotProvider extends ChangeNotifier {
  final gemini = Gemini.instance;

  final List<Content> _messages = [
    Content(parts: [Parts(text: Prompts.context)], role: userRole),
    Content(parts: [Parts(text: contextResponse)], role: modelRole)
  ];

  bool isSending = false;
  final TextEditingController _promptEditingController = TextEditingController();

  TextEditingController get promptEditingController => _promptEditingController;

  List<Content> get messages => _messages.sublist(preInsertedPrompts);

  void addMessage({required String message, bool ai = false}) {
    if (ai) {
      _messages.add(Content(parts: [Parts(text: message)], role: modelRole));
    } else {
      _messages.add(Content(parts: [Parts(text: message)], role: userRole));
    }
  }

  void generate() {
    String message = promptEditingController.text;

    if (message.isNotEmpty) {
      addMessage(message: message);
      isSending = true;
      notifyListeners();

      gemini.chat(_messages).then((value) {
        if (value != null) {
          addMessage(message: value.output ?? "", ai: true);
        }
        isSending = false;
        notifyListeners();
      });
    }
    promptEditingController.clear();
  }
}
