// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_shortener_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UrlShortenerStore on _UrlShortenerStore, Store {
  final _$urlsListAtom = Atom(name: '_UrlShortenerStore.urlsList');

  @override
  ObservableList<ShortenedUrl> get urlsList {
    _$urlsListAtom.reportRead();
    return super.urlsList;
  }

  @override
  set urlsList(ObservableList<ShortenedUrl> value) {
    _$urlsListAtom.reportWrite(value, super.urlsList, () {
      super.urlsList = value;
    });
  }

  final _$stateAtom = Atom(name: '_UrlShortenerStore.state');

  @override
  EnumState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(EnumState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$shortUrlAsyncAction = AsyncAction('_UrlShortenerStore.shortUrl');

  @override
  Future shortUrl(TextEditingController controller) {
    return _$shortUrlAsyncAction.run(() => super.shortUrl(controller));
  }

  final _$saveUrlAsyncAction = AsyncAction('_UrlShortenerStore.saveUrl');

  @override
  Future<dynamic> saveUrl(ShortenedUrl shortenedUrl) {
    return _$saveUrlAsyncAction.run(() => super.saveUrl(shortenedUrl));
  }

  final _$fetchUrlsAsyncAction = AsyncAction('_UrlShortenerStore.fetchUrls');

  @override
  Future<dynamic> fetchUrls() {
    return _$fetchUrlsAsyncAction.run(() => super.fetchUrls());
  }

  final _$copyUrlToClipboardAsyncAction =
      AsyncAction('_UrlShortenerStore.copyUrlToClipboard');

  @override
  Future copyUrlToClipboard(ShortenedUrl url) {
    return _$copyUrlToClipboardAsyncAction
        .run(() => super.copyUrlToClipboard(url));
  }

  final _$removeUrlFromHistoryAsyncAction =
      AsyncAction('_UrlShortenerStore.removeUrlFromHistory');

  @override
  Future removeUrlFromHistory(ShortenedUrl url) {
    return _$removeUrlFromHistoryAsyncAction
        .run(() => super.removeUrlFromHistory(url));
  }

  @override
  String toString() {
    return '''
urlsList: ${urlsList},
state: ${state}
    ''';
  }
}
