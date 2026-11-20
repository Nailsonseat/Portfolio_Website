part of 'chat_bloc.dart';

enum ChatStatus { idle, sending, failure }

final class ChatState extends Equatable {
  const ChatState({this.messages = const [ChatMessage.model(chatGreeting)], this.status = ChatStatus.idle});

  final List<ChatMessage> messages;
  final ChatStatus status;

  bool get isSending => status == ChatStatus.sending;

  @override
  List<Object?> get props => [messages, status];
}
