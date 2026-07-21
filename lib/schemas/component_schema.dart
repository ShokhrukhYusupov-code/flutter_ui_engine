import '../configs/component_config.dart';

abstract class ComponentSchema<T extends ComponentConfig> {
  const ComponentSchema({
    this.id,
    this.visible = true,
    required this.component,
  });

  final String? id;

  final bool visible;

  final T component;

  Map<String, dynamic> toJson();
}
