import 'package:flutter/foundation.dart';

import '../schemas/section_schema.dart';

class FormLayoutController extends ChangeNotifier {
  FormLayoutController({required List<SectionSchema> sections})
    : _sections = List.of(sections);

  final List<SectionSchema> _sections;

  List<SectionSchema> get sections => List.unmodifiable(_sections);

  void reorderSections(int oldIndex, int newIndex) {
    final section = _sections.removeAt(oldIndex);
    _sections.insert(newIndex, section);

    notifyListeners();
  }
}
