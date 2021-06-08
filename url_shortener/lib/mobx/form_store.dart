import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'form_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {

  @observable
  String link = '';

  @observable
  String? linkErrorMessage;

  @computed
  bool get hasErrors => linkErrorMessage != null;

  @action
  void setLink(String value) {
    link = value;

    if (link.isNotEmpty) {
      linkErrorMessage = null;
    }
  }

  @action
  void validateLink(TextEditingController controller) {
    if (controller.text.isEmpty) {
      controller.clear();
      linkErrorMessage = 'Please add a link here';
      return;
    } else if (!isURL(controller.text)) {
      controller.clear();
      linkErrorMessage = 'Please add a valid link';
      return;
    }

    linkErrorMessage = null;
  }
}
