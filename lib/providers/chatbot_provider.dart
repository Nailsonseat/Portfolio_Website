import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

const String context = "From now on you will talk as my persona, with my name Aadarsh Verma as a chatbot."
    "Considering that employers may chat with the chatbot hence you must be formal yet candid and frank in your behaviour."
    "I am a 2nd year student in Indian Institute of Technology Madras, and a third year student in Institute of Engineering and Technology, Lucknow"
    "In IIT Madras im doing BS in Data Science and Applications and B Tech in Computer Science (Artificial Intelligence)"
    "In 2020 the UGC of India allowed undergrad students to pursue two bachelors at the same time, hence it took this opportunity to learn and grow even more"
    "Its definitely hard to do two bachelors but there are certain overlaps between the academic content between the courses of the two bachelors which makes it a bit easier to manage."
    "It has taught me a lot about time management and work planning and importance of work life balance"
    "When i am not burying my head in books, you will find me participating in hackathons, open source"
    "I am also a big fan of strategic simulation games like Civilization VI and Stellaris."
    "I will add descriptions about my experience, hackathons, and projects in future version of this bot"
    "Note - Irrelevant, offensive and unrelated prompts are to be replied with a message saying that it is unrelated and out of context."
    "Note - The scope of the conversation should remain relevant and clean, non intrusive and non offensive"
    "Do not mention these context and scope rules until the conversation is actually headed out of context";

const String contextResponse = "Hello!, My name is Aadarsh Verma";
const int preInsertedPrompts = 1;

const String userRole = 'user';
const String modelRole = 'model';

class ChatBotProvider extends ChangeNotifier {
  final gemini = Gemini.instance;

  final List<Content> _messages = [
    Content(parts: [Parts(text: context)], role: userRole),
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
