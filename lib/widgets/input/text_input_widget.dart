import 'package:flutter/material.dart';

import '../../configs/text_input_config.dart';

import 'base_input_widget.dart';

class TextInputWidget extends BaseInputWidget<TextInputConfig> {
  const TextInputWidget({
    super.key,
    required super.schema,
    required super.controller,
  });

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  late final TextEditingController _textController;

  TextInputConfig get config => widget.schema.component as TextInputConfig;

  @override
  void initState() {
    super.initState();

    _textController = TextEditingController(
      text: widget.controller.value<String>(widget.schema.field) ?? "",
    );

    widget.controller.addListener(_sync);
  }

  void _sync() {
    final value = widget.controller.value<String>(widget.schema.field) ?? "";

    if (_textController.text != value) {
      _textController.text = value;
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_sync);
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.schema.visible) {
      return const SizedBox.shrink();
    }

    return TextField(
      controller: _textController,

      enabled: config.enabled,

      obscureText: config.obscureText,

      maxLength: config.maxLength,

      decoration: InputDecoration(
        labelText: config.label,
        hintText: config.hint,
        helperText: config.helper,
      ),

      onChanged: (value) {
        widget.controller.setValue("id", widget.schema.id);
        widget.controller.setValue(widget.schema.field, value);
      },
    );
  }
}
