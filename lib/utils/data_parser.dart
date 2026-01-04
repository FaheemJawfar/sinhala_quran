import 'package:flutter/services.dart';
import 'package:xml/xml.dart' as xml;
import '../read_quran/quran_aya.dart';
import '../read_quran/quran_sura.dart';

class DataParser {
  static Future<List<QuranSura>> loadXmlFromAssets(
      String selectedTranslation) async {
    // Check if it's a CSV translation (acju or rowwad)
    if (selectedTranslation == 'acju' || selectedTranslation == 'rowwad') {
      return await _loadCsvFromAssets(selectedTranslation);
    }

    // Otherwise load XML (for quran.xml and other translations)
    String xmlFilePath = 'assets/quran_db/$selectedTranslation.xml';
    List<QuranSura> listOfAllSuras = [];

    final xmlString = await rootBundle.loadString(xmlFilePath);
    final document = xml.XmlDocument.parse(xmlString);

    for (var suraElement in document.findAllElements('sura')) {
      final suraIndex = int.parse(suraElement.getAttribute('index')!);
      final ayas = <QuranAya>[];

      int ayaIndex = 1;

      for (var ayaElement in suraElement.findElements('aya')) {
        final ayaNumberList = ayaElement.getAttribute('index');
        final ayaText = ayaElement.getAttribute('text');
        ayas.add(QuranAya(
            suraIndex: suraIndex,
            ayaIndex: ayaIndex,
            ayaNumberList: ayaNumberList!,
            text: ayaText!));

        ayaIndex++;
      }

      listOfAllSuras.add(QuranSura(suraIndex, ayas));
    }

    return listOfAllSuras;
  }

  static Future<List<QuranSura>> _loadCsvFromAssets(
      String selectedTranslation) async {
    // Map translation names to CSV file names
    String csvFileName;
    if (selectedTranslation == 'acju') {
      csvFileName = 'sinhalese_acju.csv';
    } else if (selectedTranslation == 'rowwad') {
      csvFileName = 'sinhalese_mahir.csv';
    } else {
      throw Exception('Unknown CSV translation: $selectedTranslation');
    }

    String csvFilePath = 'assets/quran_db/$csvFileName';
    List<QuranSura> listOfAllSuras = [];

    final csvString = await rootBundle.loadString(csvFilePath);
    final lines = csvString.split('\n');

    // Skip header row
    int currentSuraIndex = -1;
    List<QuranAya> currentAyas = [];
    int ayaIndex = 0;

    for (int i = 1; i < lines.length; i++) {
      final line = lines[i].trim();
      if (line.isEmpty) continue;

      final parts = _parseCsvLine(line);
      if (parts.length < 3) continue; // Skip invalid lines

      final suraIndex = int.parse(parts[0]);
      final ayaNumber = int.parse(parts[1]);
      final text = parts[2];
      final footnotes = parts.length > 3 ? parts[3] : null;

      // If we've moved to a new sura, save the previous one
      if (suraIndex != currentSuraIndex) {
        if (currentSuraIndex != -1) {
          listOfAllSuras.add(QuranSura(currentSuraIndex, currentAyas));
        }
        currentSuraIndex = suraIndex;
        currentAyas = [];
        ayaIndex = 0;
      }

      ayaIndex++;
      currentAyas.add(QuranAya(
        suraIndex: suraIndex,
        ayaIndex: ayaIndex,
        ayaNumberList: ayaNumber.toString(),
        text: text,
        footnotes: footnotes,
      ));
    }

    // Add the last sura
    if (currentSuraIndex != -1) {
      listOfAllSuras.add(QuranSura(currentSuraIndex, currentAyas));
    }

    return listOfAllSuras;
  }

  // Parse a CSV line, handling quoted fields that may contain commas
  static List<String> _parseCsvLine(String line) {
    List<String> result = [];
    StringBuffer current = StringBuffer();
    bool inQuotes = false;

    for (int i = 0; i < line.length; i++) {
      final char = line[i];

      if (char == '"') {
        // Handle escaped quotes ("")
        if (inQuotes && i + 1 < line.length && line[i + 1] == '"') {
          current.write('"');
          i++; // Skip next quote
        } else {
          inQuotes = !inQuotes;
        }
      } else if (char == ',' && !inQuotes) {
        result.add(current.toString());
        current = StringBuffer();
      } else {
        current.write(char);
      }
    }

    // Add the last field
    result.add(current.toString());

    return result;
  }
}
