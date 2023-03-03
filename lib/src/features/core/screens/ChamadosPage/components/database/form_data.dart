import 'dart:collection';

import 'package:flutter/material.dart';

class FormRepository extends ChangeNotifier {
  List<Form> _form = [];

  UnmodifiableListView<Form> get form => UnmodifiableListView(_form);

  saveAll(List<Form> formulario) {
    formulario.forEach((formulario) {
      if (!_form.contains(formulario)) _form.add(formulario);
    });
    notifyListeners();
  }

  remove(Form formulario) {
    _form.remove(formulario);
    notifyListeners();
  }
}
