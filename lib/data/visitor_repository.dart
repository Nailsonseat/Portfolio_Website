import 'dart:convert';

import 'package:http/http.dart' as http;

/// Reads and increments the visitor counter hosted on counterapi.dev.
///
/// The counter URL contains no secret, so it is safe to ship in the web bundle.
class VisitorRepository {
  VisitorRepository({http.Client? client, DateTime Function()? clock})
      : _client = client ?? http.Client(),
        _clock = clock ?? DateTime.now;

  static const String counterUrl = 'https://api.counterapi.dev/v2/aadarsh-portfolio/portfolio-website-visitor-counter';

  /// Visits recorded before the counter moved here from Firestore.
  static const int legacyVisitorCount = 786;

  final http.Client _client;
  final DateTime Function() _clock;

  /// counterapi.dev responses are cached by Cloudflare for hours, so every
  /// request carries a unique query parameter to reach the real counter.
  Uri _uri(String path) =>
      Uri.parse('$counterUrl$path').replace(queryParameters: {'t': '${_clock().microsecondsSinceEpoch}'});

  /// Records one visit.
  Future<void> incrementVisitorCount() async {
    final response = await _client.get(_uri('/up'));
    if (response.statusCode != 200) {
      throw http.ClientException('Counter increment failed (${response.statusCode})', response.request?.url);
    }
  }

  /// Total visits, including those recorded before the move from Firestore.
  ///
  /// The service applies increments with a short delay, so a visit made
  /// moments ago may not be reflected yet.
  Future<int> fetchVisitorCount() async {
    final response = await _client.get(_uri(''));
    if (response.statusCode != 200) {
      throw http.ClientException('Counter read failed (${response.statusCode})', response.request?.url);
    }
    final data = (jsonDecode(response.body) as Map<String, dynamic>)['data'] as Map<String, dynamic>;
    return legacyVisitorCount + (data['up_count'] as num).toInt();
  }
}
