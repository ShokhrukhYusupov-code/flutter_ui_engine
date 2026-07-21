import '../configs/component_config.dart';
import '../registry/component_registry.dart';

class ComponentParser {
  const ComponentParser._();

  static ComponentConfig fromJson(Map<String, dynamic> json) {
    return ComponentRegistry.definition(json["type"]).parser(json);
  }
}
