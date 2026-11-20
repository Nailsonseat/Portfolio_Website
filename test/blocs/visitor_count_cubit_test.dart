import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio_website/blocs/home/visitor_count_cubit.dart';
import 'package:portfolio_website/data/visitor_repository.dart';

class _MockVisitorRepository extends Mock implements VisitorRepository {}

void main() {
  late _MockVisitorRepository repository;

  setUp(() => repository = _MockVisitorRepository());

  blocTest<VisitorCountCubit, VisitorCountState>(
    'emits the count once loaded',
    setUp: () => when(() => repository.fetchVisitorCount()).thenAnswer((_) async => 800),
    build: () => VisitorCountCubit(visitorRepository: repository),
    act: (cubit) => cubit.load(),
    expect: () => const [VisitorCountState(count: 800)],
  );

  blocTest<VisitorCountCubit, VisitorCountState>(
    'emits a failed state when the request throws',
    setUp: () => when(() => repository.fetchVisitorCount()).thenThrow(Exception('offline')),
    build: () => VisitorCountCubit(visitorRepository: repository),
    act: (cubit) => cubit.load(),
    expect: () => const [VisitorCountState(failed: true)],
  );
}
