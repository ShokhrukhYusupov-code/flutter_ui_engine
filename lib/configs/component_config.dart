abstract class ComponentConfig {
  const ComponentConfig({required this.type});

  final String type;

  Map<String, dynamic> toJson();
}
