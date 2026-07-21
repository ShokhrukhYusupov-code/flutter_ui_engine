import '../schemas/form_schema.dart';

class FormSerializer {
  const FormSerializer._();

  static Map<String, dynamic> toJson(FormSchema form) {
    return form.toJson();
  }
}
