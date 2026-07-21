import 'package:flutter/widgets.dart';

import '../configs/component_config.dart';
import '../controller/form_controller.dart';
import '../schemas/component_schema.dart';

typedef ComponentParser<T extends ComponentConfig> =
    T Function(Map<String, dynamic> json);

typedef ComponentBuilder<T extends ComponentConfig> =
    Widget Function({
      Key? key,
      required ComponentSchema<T> schema,
      required FormController controller,
    });

class ComponentDefinition {
  const ComponentDefinition({
    required this.type,
    required this.parser,
    required this.builder,
  });

  final String type;

  final ComponentConfig Function(Map<String, dynamic>) parser;

  final Widget Function({
    Key? key,
    required ComponentSchema schema,
    required FormController controller,
  })
  builder;
}
