import 'component_schema.dart';

class SectionSchema {
  const SectionSchema({
    required this.id,
    required this.title,
    required this.children,
  });

  final String id;
  final String title;

  final List<ComponentSchema> children;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'children': children.map((e) => e.toJson()).toList(),
    };
  }
}
