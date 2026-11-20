import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../data/chat_message.dart';
import '../../data/chat_repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';

/// Drives the "Aadarsh AI" chat dialog.
///
/// A Bloc (rather than a Cubit) so that sends are explicit events and can use
/// the [droppable] transformer: any message submitted while a reply is still
/// in flight is ignored instead of racing the pending request.
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({required ChatRepository chatRepository})
      : _chatRepository = chatRepository,
        super(const ChatState()) {
    on<ChatMessageSent>(_onMessageSent, transformer: droppable());
  }

  final ChatRepository _chatRepository;

  Future<void> _onMessageSent(ChatMessageSent event, Emitter<ChatState> emit) async {
    final text = event.text.trim();
    if (text.isEmpty) return;

    final history = [...state.messages, ChatMessage.user(text)];
    emit(ChatState(messages: history, status: ChatStatus.sending));

    try {
      final reply = await _chatRepository.reply(history);
      emit(ChatState(messages: [...history, if (reply != null && reply.isNotEmpty) ChatMessage.model(reply)]));
    } catch (error, stackTrace) {
      Logger().w('Chat request failed: $error');
      addError(error, stackTrace);
      emit(ChatState(messages: history, status: ChatStatus.failure));
    }
  }
}
