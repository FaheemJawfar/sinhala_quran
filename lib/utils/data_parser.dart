import 'package:flutter/services.dart';
import 'package:xml/xml.dart' as xml;
import '../read_quran/quran_aya.dart';
import '../read_quran/quran_sura.dart';

class DataParser {
  static Future<List<QuranSura>> loadXmlFromAssets(
      String selectedTranslation) async {
    // Map translation keys to XML file names
    Map<String, String> translationFileMap = {
      'rowwad': 'sinhalese_mahir',
      'acju': 'sinhalese_acju',
      'quran': 'quran',
    };

    String xmlFileName =
        translationFileMap[selectedTranslation] ?? selectedTranslation;
    String xmlFilePath = 'assets/quran_db/$xmlFileName.xml';
    List<QuranSura> listOfAllSuras = [];

    final xmlString = await rootBundle.loadString(xmlFilePath);
    final document = xml.XmlDocument.parse(xmlString);

    // All XML files now use the same format: id attributes + innerText
    for (var suraElement in document.findAllElements('sura')) {
      final suraIndex = int.parse(suraElement.getAttribute('id')!);
      final ayas = <QuranAya>[];

      int ayaIndex = 1;

      for (var ayaElement in suraElement.findElements('aya')) {
        final ayaNumberList = ayaElement.getAttribute('id');
        final ayaText = ayaElement.innerText;
        ayas.add(QuranAya(
            suraIndex: suraIndex,
            ayaIndex: ayaIndex,
            ayaNumberList: ayaNumberList!,
            text: ayaText));

        ayaIndex++;
      }

      listOfAllSuras.add(QuranSura(suraIndex, ayas));
    }

    return listOfAllSuras;
  }
}
