import 'package:flutter_gemini/flutter_gemini.dart';

import '../constants/prompts.dart';
import 'chat_message.dart';

/// Greeting shown as the first message of every conversation.
const String chatGreeting = 'Hello! My name is Aadarsh Verma';

/// Sends chat conversations to Gemini, primed with the portfolio context prompt.
class ChatRepository {
  ChatRepository({Gemini? gemini}) : _gemini = gemini;

  final Gemini? _gemini;

  /// Returns the model's reply to [history], or `null` if it produced no text.
  Future<String?> reply(List<ChatMessage> history) async {
    final response = await (_gemini ?? Gemini.instance).chat([
      Content(parts: [Part.text(Prompts.context)], role: 'user'),
      for (final message in history) Content(parts: [Part.text(message.text)], role: message.isUser ? 'user' : 'model'),
    ]);
    return response?.output;
  }
}
