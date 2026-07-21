import '../exceptions/duplicate_field_key_exception.dart';
import '../exceptions/duplicate_component_id_exception.dart';

import '../schemas/form_schema.dart';
import '../schemas/input_component_schema.dart';
import '../schemas/section_schema.dart';

import 'component_parser.dart';

class FormParser {
  const FormParser._();

  static FormSchema fromJson(Map<String, dynamic> json) {
    final usedSectionIds = <String>{};
    final usedComponentIds = <String>{};
    final usedFields = <String>{};

    final sections = (json['sections'] as List)
        .cast<Map<String, dynamic>>()
        .map((sectionJson) {
          final sectionId = sectionJson['id'] as String;

          if (!usedSectionIds.add(sectionId)) {
            throw DuplicateComponentIdException(sectionId);
          }

          final children = (sectionJson['children'] as List)
              .cast<Map<String, dynamic>>()
              .map((componentJson) {
                final config = ComponentParser.fromJson(
                  componentJson['component'] as Map<String, dynamic>,
                );

                final schema = InputComponentSchema(
                  id: componentJson['id'] as String?,
                  visible: componentJson['visible'] as bool? ?? true,
                  field: componentJson['field'] as String,
                  isRequired: componentJson['required'] as bool? ?? false,
                  component: config,
                );

                if (schema.id != null && !usedComponentIds.add(schema.id!)) {
                  throw DuplicateComponentIdException(schema.id!);
                }

                if (!usedFields.add(schema.field)) {
                  throw DuplicateFieldKeyException(schema.field);
                }

                return schema;
              })
              .toList();

          return SectionSchema(
            id: sectionId,
            title: sectionJson['title'] as String,
            children: children,
          );
        })
        .toList();

    return FormSchema(
      id: json['id'] as String,
      title: json['title'] as String,
      sections: sections,
    );
  }
}
