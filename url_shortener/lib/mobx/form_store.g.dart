// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormStore on _FormStore, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors => (_$hasErrorsComputed ??=
          Computed<bool>(() => super.hasErrors, name: '_FormStore.hasErrors'))
      .value;

  final _$linkAtom = Atom(name: '_FormStore.link');

  @override
  String get link {
    _$linkAtom.reportRead();
    return super.link;
  }

  @override
  set link(String value) {
    _$linkAtom.reportWrite(value, super.link, () {
      super.link = value;
    });
  }

  final _$linkErrorMessageAtom = Atom(name: '_FormStore.linkErrorMessage');

  @override
  String? get linkErrorMessage {
    _$linkErrorMessageAtom.reportRead();
    return super.linkErrorMessage;
  }

  @override
  set linkErrorMessage(String? value) {
    _$linkErrorMessageAtom.reportWrite(value, super.linkErrorMessage, () {
      super.linkErrorMessage = value;
    });
  }

  final _$_FormStoreActionController = ActionController(name: '_FormStore');

  @override
  void setLink(String value) {
    final _$actionInfo =
        _$_FormStoreActionController.startAction(name: '_FormStore.setLink');
    try {
      return super.setLink(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateLink(TextEditingController controller) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validateLink');
    try {
      return super.validateLink(controller);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
link: ${link},
linkErrorMessage: ${linkErrorMessage},
hasErrors: ${hasErrors}
    ''';
  }
}
