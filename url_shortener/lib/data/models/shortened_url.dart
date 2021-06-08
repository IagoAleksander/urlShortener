import 'package:mobx/mobx.dart';
import 'package:url_shortener/data/database_helper.dart';

class ShortenedUrl {
  final int id;
  final String originalLink;
  final String shortLink;

  @observable
  bool isSelected;

  ShortenedUrl({
    this.id = -1,
    required this.originalLink,
    required this.shortLink,
    this.isSelected = false,
  });

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnOriginalLink: originalLink,
      DatabaseHelper.columnShortLink: shortLink,
    };
  }

  @override
  String toString() {
    return 'ShortenedUrl{id: $id, originalLink: $originalLink, shortLink: $shortLink}';
  }
}
