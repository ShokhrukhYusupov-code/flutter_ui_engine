class DuplicateFieldKeyException implements Exception {
  const DuplicateFieldKeyException(this.fieldKey);

  final String fieldKey;

  @override
  String toString() {
    return 'Duplicate field key "$fieldKey". Every field key must be unique.';
  }
}
