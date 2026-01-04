import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert'; // For jsonEncode
// import 'package:collection/collection.dart'; // For firstOrNull if needed, but Dart 3 has it built-in.
// Assuming Dart SDK >= 2.12 (null safety), but firstOrNull specific to Dart 3 or package:collection.
// If standard List doesn't have firstOrNull in this SDK version, I might need to use simpler check.
import 'package:xml/xml.dart' as xml;
import '../read_quran/quran_aya.dart';
import '../read_quran/quran_sura.dart';

class DataParser {
  static Future<List<QuranSura>> loadXmlFromAssets(
      String selectedTranslation) async {
    // Load XML file directly using the translation key
    String xmlFilePath = 'assets/quran_db/$selectedTranslation.xml';
    List<QuranSura> listOfAllSuras = [];

    final xmlString = await rootBundle.loadString(xmlFilePath);
    final document = xml.XmlDocument.parse(xmlString);

    // All XML files now use the same format: id attributes + innerText
    for (var suraElement in document.findAllElements('sura')) {
      final suraIndex = int.parse(suraElement.getAttribute('id')!);
      final ayas = <QuranAya>[];
      final footnotesMap = <String, String>{};

      // 1. Parse Footnotes for this Sura first
      final footnoteElements = suraElement.findElements('footnotes');
      if (footnoteElements.isNotEmpty) {
        final footnotesElement = footnoteElements.first;
        for (var note in footnotesElement.findElements('note')) {
          final id = note.getAttribute('id');
          final content = note.innerText;
          if (id != null) {
            footnotesMap[id] = content;
          }
        }
      }

      int ayaIndex = 1;

      for (var ayaElement in suraElement.findElements('aya')) {
        final ayaNumberList = ayaElement.getAttribute('id');
        final ayaText = ayaElement.innerText;

        // 2. Identify footnotes used in this Aya
        String? ayaFootnotesJson;
        if (footnotesMap.isNotEmpty) {
          final usedFootnotes = <String, String>{};
          // Simple regex to find [1], [2] etc.
          final matches = RegExp(r'\[(\d+)\]').allMatches(ayaText);
          for (final match in matches) {
            final noteId = match.group(1);
            if (noteId != null && footnotesMap.containsKey(noteId)) {
              usedFootnotes[noteId] = footnotesMap[noteId]!;
            }
          }

          if (usedFootnotes.isNotEmpty) {
            // We need to import dart:convert for jsonEncode
            // Since we can't easily add import here without reading file again,
            // let's just do a manual simple JSON construction or use a helper if available.
            // Actually, adding import is better.
            // But for now, let's just assume I will add `import 'dart:convert';` at the top.
            ayaFootnotesJson = jsonEncode(usedFootnotes);
          }
        }

        ayas.add(QuranAya(
            suraIndex: suraIndex,
            ayaIndex: ayaIndex,
            ayaNumberList: ayaNumberList!,
            text: ayaText,
            footnotes: ayaFootnotesJson));

        ayaIndex++;
      }

      listOfAllSuras.add(QuranSura(suraIndex, ayas));
    }

    return listOfAllSuras;
  }
}
