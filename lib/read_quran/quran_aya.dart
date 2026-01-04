class QuranAya {
  final int suraIndex;
  final int ayaIndex;
  final String ayaNumberList;
  final String text;
  final String? footnotes;

  QuranAya({
    required this.suraIndex,
    required this.ayaIndex,
    required this.ayaNumberList,
    required this.text,
    this.footnotes,
  });
}
