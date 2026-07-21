class DuplicateComponentIdException implements Exception {
  const DuplicateComponentIdException(this.sectionId);

  final String sectionId;

  @override
  String toString() {
    return 'Duplicate section id "$sectionId". Every section id must be unique.';
  }
}
