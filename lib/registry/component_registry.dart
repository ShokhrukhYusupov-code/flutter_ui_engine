import 'component_definition.dart';

class ComponentRegistry {
  ComponentRegistry._();

  static final _definitions = <String, ComponentDefinition>{};

  static void register(ComponentDefinition definition) {
    _definitions[definition.type] = definition;
  }

  static ComponentDefinition definition(String type) {
    final definition = _definitions[type];

    if (definition == null) {
      throw StateError('Unknown component "$type".');
    }

    return definition;
  }
}
