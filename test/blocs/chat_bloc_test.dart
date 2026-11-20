import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio_website/blocs/chat/chat_bloc.dart';
import 'package:portfolio_website/data/chat_message.dart';
import 'package:portfolio_website/data/chat_repository.dart';

class _MockChatRepository extends Mock implements ChatRepository {}

void main() {
  late _MockChatRepository repository;

  const greeting = ChatMessage.model(chatGreeting);
  const hi = ChatMessage.user('hi');

  setUp(() => repository = _MockChatRepository());

  test('starts with the greeting and is idle', () {
    expect(ChatBloc(chatRepository: repository).state, const ChatState(messages: [greeting]));
  });

  blocTest<ChatBloc, ChatState>(
    'sends the conversation and appends the reply',
    setUp: () => when(() => repository.reply(any())).thenAnswer((_) async => 'hello!'),
    build: () => ChatBloc(chatRepository: repository),
    act: (bloc) => bloc.add(const ChatMessageSent('  hi  ')),
    expect: () => const [
      ChatState(messages: [greeting, hi], status: ChatStatus.sending),
      ChatState(messages: [greeting, hi, ChatMessage.model('hello!')]),
    ],
    verify: (_) => verify(() => repository.reply(const [greeting, hi])).called(1),
  );

  blocTest<ChatBloc, ChatState>(
    'ignores blank messages',
    build: () => ChatBloc(chatRepository: repository),
    act: (bloc) => bloc.add(const ChatMessageSent('   ')),
    expect: () => const <ChatState>[],
    verify: (_) => verifyNever(() => repository.reply(any())),
  );

  blocTest<ChatBloc, ChatState>(
    'does not add an empty reply',
    setUp: () => when(() => repository.reply(any())).thenAnswer((_) async => null),
    build: () => ChatBloc(chatRepository: repository),
    act: (bloc) => bloc.add(const ChatMessageSent('hi')),
    expect: () => const [
      ChatState(messages: [greeting, hi], status: ChatStatus.sending),
      ChatState(messages: [greeting, hi]),
    ],
  );

  blocTest<ChatBloc, ChatState>(
    'reports failure and re-enables input when the request throws',
    setUp: () => when(() => repository.reply(any())).thenThrow(Exception('offline')),
    build: () => ChatBloc(chatRepository: repository),
    act: (bloc) => bloc.add(const ChatMessageSent('hi')),
    expect: () => const [
      ChatState(messages: [greeting, hi], status: ChatStatus.sending),
      ChatState(messages: [greeting, hi], status: ChatStatus.failure),
    ],
    errors: () => [isA<Exception>()],
  );

  blocTest<ChatBloc, ChatState>(
    'drops messages sent while a reply is in flight',
    setUp: () {
      final pending = Completer<String?>();
      when(() => repository.reply(any())).thenAnswer((_) => pending.future);
      Future<void>.delayed(const Duration(milliseconds: 10), () => pending.complete('first reply'));
    },
    build: () => ChatBloc(chatRepository: repository),
    act: (bloc) => bloc
      ..add(const ChatMessageSent('hi'))
      ..add(const ChatMessageSent('spam')),
    wait: const Duration(milliseconds: 50),
    expect: () => const [
      ChatState(messages: [greeting, hi], status: ChatStatus.sending),
      ChatState(messages: [greeting, hi, ChatMessage.model('first reply')]),
    ],
    verify: (_) => verify(() => repository.reply(any())).called(1),
  );
}
