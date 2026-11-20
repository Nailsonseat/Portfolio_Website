import 'package:equatable/equatable.dart';

enum ChatRole { user, model }

class ChatMessage extends Equatable {
  const ChatMessage({required this.text, required this.role});

  const ChatMessage.user(this.text) : role = ChatRole.user;

  const ChatMessage.model(this.text) : role = ChatRole.model;

  final String text;
  final ChatRole role;

  bool get isUser => role == ChatRole.user;

  @override
  List<Object?> get props => [text, role];
}
