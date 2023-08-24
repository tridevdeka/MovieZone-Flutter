class Tab {
  final int index;
  final String title;

  Tab({required this.index, required this.title})
      : assert(
          index >= 0,
          "index cannot be negative",
        );
}
