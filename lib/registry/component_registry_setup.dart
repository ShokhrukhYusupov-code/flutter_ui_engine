import '../configs/text_input_config.dart';

import '../schemas/input_component_schema.dart';
import '../widgets/input/text_input_widget.dart';

import 'component_definition.dart';
import 'component_registry.dart';
import 'component_types.dart';

void registerComponents() {
  _registerInputComponents();
}

void _registerInputComponents() {
  // TextInputWidget
  ComponentRegistry.register(
    ComponentDefinition(
      type: ComponentTypes.textInput,
      parser: TextInputConfig.fromJson,
      builder: ({key, required schema, required controller}) {
        return TextInputWidget(
          key: key,
          schema: schema as InputComponentSchema,
          controller: controller,
        );
      },
    ),
  );
}
