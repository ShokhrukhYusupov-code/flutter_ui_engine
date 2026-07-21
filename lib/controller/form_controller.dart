import 'package:flutter/foundation.dart';

class FormController extends ChangeNotifier {
  FormController({Map<String, dynamic>? initialValues})
    : _values = Map.of(initialValues ?? {});

  final Map<String, dynamic> _values;

  /// Получить значение поля
  T? value<T>(String key) {
    return _values[key] as T?;
  }

  /// Установить значение поля
  void setValue(String key, dynamic value) {
    if (_values[key] == value) {
      return;
    }

    _values[key] = value;
    notifyListeners();
  }

  /// Проверить существование поля
  bool contains(String key) {
    return _values.containsKey(key);
  }

  /// Удалить поле
  void remove(String key) {
    if (_values.remove(key) != null) {
      notifyListeners();
    }
  }

  /// Очистить форму
  void clear() {
    if (_values.isEmpty) {
      return;
    }

    _values.clear();
    notifyListeners();
  }

  /// Получить все значения
  Map<String, dynamic> toJson() {
    return Map<String, dynamic>.from(_values);
  }
}
