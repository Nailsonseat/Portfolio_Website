import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/providers/chatbot_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ChatGPTDialog extends StatelessWidget {
  const ChatGPTDialog({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLengthGreaterThanWidth = MediaQuery.of(context).size.height > MediaQuery.of(context).size.width;
    return ResponsiveScaledBox(
      width: isLengthGreaterThanWidth ? 455 : 1978,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          height: isLengthGreaterThanWidth ? 700 : 900,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Aadarsh AI (alpha 1.12)",
                          style: GoogleFonts.robotoMono(fontSize: isLengthGreaterThanWidth ? 18 : 34),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: IconButton(
                            style: ButtonStyle(
                              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              fixedSize: WidgetStateProperty.all<Size>(const Size(40, 40)),
                            ),
                            onPressed: () => context.pop(),
                            icon: const Icon(
                              Icons.close,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 24,
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
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[100],
                          ),
                          child: ListTile(
                            title: Text(messages[reversedIndex].parts?.last.text ?? '',
                                style: isLengthGreaterThanWidth ? const TextStyle(fontSize: 16) : null),
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
                      flex: isLengthGreaterThanWidth ? 9 : 7,
                      child: Consumer<ChatBotProvider>(
                        builder: (_, chatBot, __) {
                          return TextFormField(
                            maxLines: 1,
                            controller: chatBot.promptEditingController,
                            enabled: !chatBot.isSending,
                            onFieldSubmitted: (_) => chatBot.isSending ? null : chatBot.generate(),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(21),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(38),
                              ),
                              labelText: "Message Aadarsh",
                              hintText: 'Type your message...',
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: isLengthGreaterThanWidth ? 2 : 1,
                      child: Consumer<ChatBotProvider>(
                        builder: (_, chatBot, __) {
                          if (isLengthGreaterThanWidth) {
                            return IconButton(
                              onPressed: () => chatBot.isSending ? null : chatBot.generate(),
                              style: ButtonStyle(
                                minimumSize: WidgetStateProperty.all<Size>(const Size.fromHeight(55)),
                                backgroundColor: WidgetStateProperty.all<Color>(Colors.lightBlueAccent),
                                foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                              ),
                              icon: chatBot.isSending
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                      ),
                                    )
                                  : const Icon(Icons.send),
                            );
                          }
                          return ElevatedButton(
                            onPressed: () => chatBot.isSending ? null : chatBot.generate(),
                            style: ButtonStyle(
                              minimumSize: WidgetStateProperty.all<Size>(const Size.fromHeight(68)),
                              backgroundColor: WidgetStateProperty.all<Color>(Colors.lightBlueAccent),
                              foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                            child: chatBot.isSending
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                    ),
                                  )
                                : const Text(
                                    'Send',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
