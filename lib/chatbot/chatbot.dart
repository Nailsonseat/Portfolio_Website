import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/blocs/chat/chat_bloc.dart';
import 'package:portfolio_website/data/chat_message.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ChatGPTDialog extends StatefulWidget {
  const ChatGPTDialog({super.key});

  @override
  State<ChatGPTDialog> createState() => _ChatGPTDialogState();
}

class _ChatGPTDialogState extends State<ChatGPTDialog> {
  final TextEditingController _promptController = TextEditingController();

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  void _send() {
    final chatBloc = context.read<ChatBloc>();
    if (chatBloc.state.isSending) return;
    chatBloc.add(ChatMessageSent(_promptController.text));
    _promptController.clear();
  }

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
                child: BlocSelector<ChatBloc, ChatState, List<ChatMessage>>(
                  selector: (state) => state.messages,
                  builder: (_, messages) {
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
                            title: Text(messages[reversedIndex].text,
                                style: isLengthGreaterThanWidth ? const TextStyle(fontSize: 16) : null),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              BlocSelector<ChatBloc, ChatState, bool>(
                selector: (state) => state.status == ChatStatus.failure,
                builder: (_, failed) => failed
                    ? const Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Text(
                          "Couldn't reach Aadarsh AI. Please try again.",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: isLengthGreaterThanWidth ? 9 : 7,
                      child: BlocSelector<ChatBloc, ChatState, bool>(
                        selector: (state) => state.isSending,
                        builder: (_, isSending) {
                          return TextFormField(
                            maxLines: 1,
                            controller: _promptController,
                            enabled: !isSending,
                            onFieldSubmitted: (_) => _send(),
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
                      child: BlocSelector<ChatBloc, ChatState, bool>(
                        selector: (state) => state.isSending,
                        builder: (_, isSending) {
                          if (isLengthGreaterThanWidth) {
                            return IconButton(
                              onPressed: _send,
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
                              icon: isSending
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
                            onPressed: _send,
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
                            child: isSending
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
