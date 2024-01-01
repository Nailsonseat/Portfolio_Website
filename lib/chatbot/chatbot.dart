import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_website/providers/chatbot_provider.dart';
import 'package:provider/provider.dart';

class ChatGPTDialog extends StatelessWidget {
  const ChatGPTDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        height: 900,
        width: 900,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          children: [
            Column(
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: OutlinedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(50, 50))),
                        onPressed: () => context.pop(),
                        child: const Center(
                            child: Text(
                          "x",
                          style: TextStyle(fontSize: 18),
                        )))),
                const Divider(
                  height: 20,
                  color: Colors.black,
                )
              ],
            ),
            Expanded(
              child: Consumer<ChatBotProvider>(
                builder: (_, chatBot, __) {
                  List<Content> messages = chatBot.messages;
                  return ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final reversedIndex = messages.length - 1 - index;
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[100],
                        ),
                        child: ListTile(
                          title: Text(
                              messages[reversedIndex].parts?.last.text ?? ''),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Consumer<ChatBotProvider>(builder: (_, chatBot, __) {
                      return TextField(
                        maxLines: 1,
                        controller: chatBot.promptEditingController,
                        enabled: !chatBot.isSending,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelText: "Message Aadarsh",
                          hintText: 'Type your message...',
                        ),
                      );
                    }),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: Consumer<ChatBotProvider>(builder: (_, chatBot, __) {
                      return ElevatedButton(
                        onPressed: () =>
                            chatBot.isSending ? null : chatBot.generate(),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size.fromHeight(68)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.lightBlueAccent),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )),
                        ),
                        child: chatBot.isSending
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              )
                            : const Text(
                                'Send',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
