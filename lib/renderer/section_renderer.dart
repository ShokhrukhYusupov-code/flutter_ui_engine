import 'package:flutter/material.dart';

import '../controller/form_controller.dart';
import '../schemas/section_schema.dart';

import 'component_renderer.dart';

class SectionRenderer extends StatelessWidget {
  const SectionRenderer({
    super.key,
    required this.section,
    required this.controller,
  });

  final SectionSchema section;

  final FormController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(section.title, style: Theme.of(context).textTheme.titleMedium),

            const SizedBox(height: 16),

            ...section.children.map(
              (component) => Padding(
                key: ValueKey(component.id),
                padding: const EdgeInsets.only(bottom: 12),
                child: ComponentRenderer(
                  key: ValueKey(component.id),
                  component: component,
                  controller: controller,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
