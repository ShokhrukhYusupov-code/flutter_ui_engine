import 'package:flutter/material.dart';

import '../controller/form_controller.dart';
import '../controller/form_layout_controller.dart';

import 'section_renderer.dart';

class FormRenderer extends StatelessWidget {
  const FormRenderer({
    super.key,
    required this.layoutController,
    required this.formController,
  });

  final FormLayoutController layoutController;

  final FormController formController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: layoutController,
      builder: (_, _) {
        return ReorderableListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),

          itemCount: layoutController.sections.length,

          onReorderItem: layoutController.reorderSections,

          itemBuilder: (context, index) {
            final section = layoutController.sections[index];

            return SectionRenderer(
              key: ValueKey(section.id),
              section: section,
              controller: formController,
            );
          },
        );
      },
    );
  }
}
