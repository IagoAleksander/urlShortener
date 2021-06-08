// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:url_shortener/data/models/url_shortener_response.dart';
import 'package:url_shortener/data/repositories/short_link_repository.dart';

import 'shorten_url_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('returns shortened url Information if the http call completes successfully', () async {
    final client = MockClient();

    when(client.get(Uri.parse('https://api.shrtco.de/v2/shorten?url=example.org/very/long/link.html')))
        .thenAnswer((_) async => http.Response('''{
    "ok": true,
    "result": {
    "code": "KCveN",
    "short_link": "shrtco.de/KCveN",
    "full_short_link": "https://shrtco.de/KCveN",
    "short_link2": "9qr.de/KCveN",
    "full_short_link2": "https://9qr.de/KCveN",
    "share_link": "shrtco.de/share/KCveN",
    "full_share_link": "https://shrtco.de/share/KCveN",
    "original_link": "http://example.org/very/long/link.html"
    }
    }''', 201));

    UrlShortenerResponse response = await fetchUrl(client, "example.org/very/long/link.html");

    expect(response.isSuccess, true);
    expect(response.shortLink, "shrtco.de/KCveN");
    expect(response.originalLink, contains("example.org/very/long/link.html"));
  });
}
