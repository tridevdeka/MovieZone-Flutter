extension StringExtension on String {
  String toIntelliTrim(int size) {
    return length > size ? '${substring(0, size)}...' : this;
  }
}
