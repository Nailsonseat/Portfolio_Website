import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:portfolio_website/data/visitor_repository.dart';

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
}
