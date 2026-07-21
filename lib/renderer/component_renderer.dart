import 'package:flutter/material.dart';

import '../configs/component_config.dart';
import '../controller/form_controller.dart';
import '../registry/component_registry.dart';
import '../schemas/component_schema.dart';

class ComponentRenderer<T extends ComponentConfig> extends StatelessWidget {
  const ComponentRenderer({
    super.key,
    required this.component,
    required this.controller,
  });

  final ComponentSchema component;
  final FormController controller;

  @override
  Widget build(BuildContext context) {
    final definition = ComponentRegistry.definition(component.component.type);

    return definition.builder(
      key: ValueKey(component.id),
      schema: component,
      controller: controller,
    );
  }
}
