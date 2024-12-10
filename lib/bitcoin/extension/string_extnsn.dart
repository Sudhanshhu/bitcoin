extension CapsFirst on String {
  String capitalizeFirst() {
    return this[0].toUpperCase() + substring(1);
  }

  String capitalizeEach() {
    return split(' ').map((str) => str.capitalizeFirst()).join(' ');
  }

  String removeDashAndCapsFirst() {
    return replaceAll('-', ' ').toLowerCase().capitalizeFirst();
  }
}
