import '../registry/component_types.dart';

import 'component_config.dart';

class TextInputConfig extends ComponentConfig {
  const TextInputConfig({
    super.type = ComponentTypes.textInput,

    this.label,
    this.hint,
    this.helper,

    this.enabled = true,
    this.obscureText = false,

    this.maxLength,
  });

  factory TextInputConfig.fromJson(Map<String, dynamic> json) {
    return TextInputConfig(
      label: json['label'],
      hint: json['hint'],
      helper: json['helper'],
      enabled: json['enabled'] ?? true,
      obscureText: json['obscureText'] ?? false,
      maxLength: json['maxLength'],
    );
  }

  final String? label;

  final String? hint;

  final String? helper;

  final bool enabled;

  final bool obscureText;

  final int? maxLength;

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,

      if (label != null) "label": label,
      if (hint != null) "hint": hint,
      if (helper != null) "helper": helper,

      if (!enabled) "enabled": false,
      if (obscureText) "obscureText": true,

      if (maxLength != null) "maxLength": maxLength,
    };
  }
}
