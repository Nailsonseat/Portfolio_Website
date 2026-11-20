import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:portfolio_website/data/visitor_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final fixedClock = DateTime.utc(2026, 1, 1);

  VisitorRepository repo(MockClient client) => VisitorRepository(client: client, clock: () => fixedClock);

  test('increment hits /up with a cache-busting parameter', () async {
    late Uri requested;
    await repo(
      MockClient((request) async {
        requested = request.url;
        return http.Response('{}', 200);
      }),
    ).incrementVisitorCount();

    expect(requested.path, endsWith('/portfolio-website-visitor-counter/up'));
    expect(requested.queryParameters['t'], '${fixedClock.microsecondsSinceEpoch}');
  });

  test('increment throws on a non-200 response', () {
    expect(
      repo(MockClient((_) async => http.Response('', 500))).incrementVisitorCount(),
      throwsA(isA<http.ClientException>()),
    );
  });

  test('fetch adds up_count to the legacy count', () async {
    final count = await repo(
      MockClient((_) async => http.Response('{"code":"200","data":{"up_count":5}}', 200)),
    ).fetchVisitorCount();
    expect(count, VisitorRepository.legacyVisitorCount + 5);
  });

  test('fetch throws on a non-200 response', () {
    expect(
      repo(MockClient((_) async => http.Response('', 503))).fetchVisitorCount(),
      throwsA(isA<http.ClientException>()),
    );
  });

  group('recordVisitIfNew', () {
    var now = fixedClock;
    var upCalls = 0;

    VisitorRepository timedRepo() => VisitorRepository(
          client: MockClient((_) async {
            upCalls++;
            return http.Response('{}', 200);
          }),
          clock: () => now,
        );

    setUp(() {
      now = fixedClock;
      upCalls = 0;
      SharedPreferences.setMockInitialValues({});
    });

    test('counts a first visit, then ignores refreshes within 24 hours', () async {
      final repository = timedRepo();
      expect(await repository.recordVisitIfNew(), isTrue);
      now = fixedClock.add(const Duration(hours: 23, minutes: 59));
      expect(await repository.recordVisitIfNew(), isFalse);
      expect(upCalls, 1);
    });

    test('counts again after 24 hours', () async {
      final repository = timedRepo();
      await repository.recordVisitIfNew();
      now = fixedClock.add(const Duration(hours: 24));
      expect(await repository.recordVisitIfNew(), isTrue);
      expect(upCalls, 2);
    });

    test('a failed request is not remembered, so the next visit retries', () async {
      final failing = VisitorRepository(client: MockClient((_) async => http.Response('', 500)), clock: () => now);
      await expectLater(failing.recordVisitIfNew(), throwsA(isA<http.ClientException>()));
      expect(await timedRepo().recordVisitIfNew(), isTrue);
    });

    test('a timestamp in the future (clock change) does not block counting', () async {
      SharedPreferences.setMockInitialValues({
        'last_counted_visit_ms': fixedClock.add(const Duration(days: 30)).millisecondsSinceEpoch,
      });
      expect(await timedRepo().recordVisitIfNew(), isTrue);
    });
  });
}
