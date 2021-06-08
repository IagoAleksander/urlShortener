import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:url_shortener/data/models/url_shortener_response.dart';
import 'package:url_shortener/resources/constants.dart';


Future<UrlShortenerResponse> fetchUrl(http.Client client, String query) async {
  const String shrtcoUrl = 'https://api.shrtco.de/v2/';

  final response = await client.get(Uri.parse(
      '${shrtcoUrl}shorten?url=$query'));

  if (response.statusCode == created) {
    return UrlShortenerResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Could not short the url');
  }
}

