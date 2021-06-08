import 'dart:convert';

import 'package:http/http.dart';
import 'package:url_shortener/data/models/url_shortener_response.dart';
import 'package:url_shortener/resources/constants.dart';

import 'data_repository.dart';

Future<UrlShortenerResponse?> shortenUrl(String urlToBeShortened) async {
  Response response = await DataRepository.getShrtco(urlToBeShortened);
  try {
    if (response.statusCode == created) {
      UrlShortenerResponse urlShortenerResponse =
          UrlShortenerResponse.fromJson(json.decode(response.body));
      return urlShortenerResponse;
    }
  } catch (error) {
    return null;
  }
  return null;
}
