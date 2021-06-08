import 'package:http/http.dart' as http;
import 'package:url_shortener/resources/constants.dart';

class DataRepository {
  static const String shrtcoUrl = 'https://api.shrtco.de/v2/';

  static Future<http.Response> _get(url) async {
    try {
      return await http.get(Uri.parse(url));
    } catch (error) {
      return await Future.value(http.Response('', serviceUnavailable));
    }
  }

  static Future<http.Response> getShrtco(urlToBeShortened) async {
    String query = "shorten?url=" + urlToBeShortened;
    return await _get(shrtcoUrl + query);
  }
}
