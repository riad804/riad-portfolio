extension StringFormats on String {
  String toSecret() {
    if (length <= 6) {
      return this;
    }
    return '${substring(0, 3)}...${substring(length - 3)}';
  }
}
