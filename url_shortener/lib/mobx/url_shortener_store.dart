import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:mobx/mobx.dart';
import 'package:url_shortener/data/database_helper.dart';
import 'package:url_shortener/data/models/shortened_url.dart';
import 'package:url_shortener/data/models/url_shortener_response.dart';
import 'package:url_shortener/data/repositories/short_link_repository.dart';

part 'url_shortener_store.g.dart';

class UrlShortenerStore = _UrlShortenerStore with _$UrlShortenerStore;

enum EnumState { emptyState, loadingHistory, shorteningUrl, contentList, errorState }

abstract class _UrlShortenerStore with Store {
  @observable
  ObservableList<ShortenedUrl> urlsList = ObservableList();

  @observable
  EnumState state = EnumState.loadingHistory;

  final Client client = Client();
  final DatabaseHelper databaseHelper = DatabaseHelper();

  _UrlShortenerStore() {
    _init();
  }

  _init() async {
    state = EnumState.loadingHistory;
    fetchUrls();
  }

  @action
  shortUrl(TextEditingController controller) async {
    if (state != EnumState.shorteningUrl) {
      List<String> urlList = [];
      urlsList.asMap().values.forEach((shortenedUrl) {
        urlList.add(shortenedUrl.originalLink);
      });
      if (!urlList.contains(controller.value.text) && !urlList.contains("http://${controller.value.text}")) {
        state = EnumState.shorteningUrl;

        UrlShortenerResponse? response =
            await fetchUrl(client, controller.text);
        ShortenedUrl url = ShortenedUrl(
          originalLink: response.originalLink,
          shortLink: response.shortLink,
        );
        int insertedId = await saveUrl(url);

        if (insertedId > 0) {
          fetchUrls();
          controller.clear();
          state = EnumState.contentList;
        } else {
          //todo display database error toast message
        }
      }
      else {
        state = EnumState.errorState;
      }
    }
  }

  @action
  Future saveUrl(ShortenedUrl shortenedUrl) async {
    return await databaseHelper.insertUrl(shortenedUrl);
  }

  @action
  Future fetchUrls() async {
    List<ShortenedUrl>? list = await databaseHelper.getUrlList();
    if (list != null) {
      urlsList = ObservableList<ShortenedUrl>.of(list);
      state = urlsList.isEmpty ? EnumState.emptyState : EnumState.contentList;
    } else {
      state = EnumState.emptyState;
    }
  }

  @action
  copyUrlToClipboard(ShortenedUrl url) async {
    var list = urlsList.toList();
    for (var element in list) {
      if (element.isSelected) {
        element.isSelected = false;
      }
      if (element.id == url.id) {
        Clipboard.setData(ClipboardData(text: url.shortLink));
        element.isSelected = true;
      }
    }
    urlsList = ObservableList<ShortenedUrl>.of(list);
  }

  @action
  removeUrlFromHistory(ShortenedUrl url) async {
    await databaseHelper.deleteUrl(url.id);
    fetchUrls();
  }
}
