import 'component_schema.dart';

class InputComponentSchema extends ComponentSchema {
  const InputComponentSchema({
    super.id,
    super.visible,
    required super.component,

    required this.field,

    this.isRequired = false,
  });

  final String field;

  final bool isRequired;

  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) "id": id,

      "field": field,

      if (isRequired) "required": true,
      if (!visible) "visible": false,

      "component": component.toJson(),
    };
  }
}
