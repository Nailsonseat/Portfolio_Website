import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio_website/blocs/launch/launch_cubit.dart';
import 'package:portfolio_website/data/visitor_repository.dart';

class _MockVisitorRepository extends Mock implements VisitorRepository {}

void main() {
  const step = Duration(milliseconds: 10);
  late _MockVisitorRepository repository;

  setUp(() => repository = _MockVisitorRepository());

  test('starts at the initial progress', () {
    expect(LaunchCubit(visitorRepository: repository).state, LaunchCubit.initialProgress);
  });

  blocTest<LaunchCubit, double>(
    'advances to mid then complete progress, then stops',
    build: () => LaunchCubit(visitorRepository: repository, stepInterval: step),
    act: (cubit) => cubit.startProgress(),
    wait: step * 6,
    expect: () => const [LaunchCubit.midProgress, LaunchCubit.completeProgress],
  );

  blocTest<LaunchCubit, double>(
    'restarting does not run two timers',
    build: () => LaunchCubit(visitorRepository: repository, stepInterval: step),
    act: (cubit) => cubit
      ..startProgress()
      ..startProgress(),
    wait: step * 6,
    expect: () => const [LaunchCubit.midProgress, LaunchCubit.completeProgress],
  );

  test('recordVisit increments the counter', () async {
    when(() => repository.incrementVisitorCount()).thenAnswer((_) async {});
    await LaunchCubit(visitorRepository: repository).recordVisit();
    verify(() => repository.incrementVisitorCount()).called(1);
  });

  test('recordVisit swallows repository errors', () async {
    when(() => repository.incrementVisitorCount()).thenThrow(Exception('offline'));
    await expectLater(LaunchCubit(visitorRepository: repository).recordVisit(), completes);
  });
}
