class UrlShortenerResponse {
  late bool isSuccess;
  late String code;
  late String shortLink;
  late String fullShortLink;
  late String shortLink2;
  late String fullShortLink2;
  late String shareLink;
  late String fullShareLink;
  late String originalLink;
  late Map<String, dynamic> jsonResponse;

  UrlShortenerResponse(
      this.isSuccess,
      this.code,
      this.shortLink,
      this.fullShortLink,
      this.shortLink2,
      this.fullShortLink2,
      this.shareLink,
      this.fullShareLink,
      this.originalLink,
      this.jsonResponse);

  factory UrlShortenerResponse.fromJson(Map<String, dynamic> json) {
    return UrlShortenerResponse(
      json['ok'],
      json['result']['code'],
      json['result']['short_link'],
      json['result']['full_short_link'],
      json['result']['short_link2'],
      json['result']['full_short_link2'],
      json['result']['share_link'],
      json['result']['full_share_link'],
      json['result']['original_link'],
      json,
    );
  }
}
