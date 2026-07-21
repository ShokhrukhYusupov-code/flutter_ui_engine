import 'package:flutter/material.dart';

import '../../configs/component_config.dart';
import '../../controller/form_controller.dart';
import '../../schemas/input_component_schema.dart';

abstract class BaseInputWidget<T extends ComponentConfig>
    extends StatefulWidget {
  const BaseInputWidget({
    super.key,
    required this.schema,
    required this.controller,
  });

  final InputComponentSchema schema;

  final FormController controller;
}
