import 'section_schema.dart';

class FormSchema {
  const FormSchema({
    required this.id,
    required this.title,
    required this.sections,
  });

  final String id;
  final String title;

  final List<SectionSchema> sections;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'sections': sections.map((e) => e.toJson()).toList(),
    };
  }
}
