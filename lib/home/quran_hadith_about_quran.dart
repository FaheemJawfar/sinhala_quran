class AboutQuranReferences {
  final String quote;
  final String reference;

  AboutQuranReferences({required this.quote, required this.reference});

  factory AboutQuranReferences.fromJson(Map<String, dynamic> json) {
    return AboutQuranReferences(
      quote: json['verse'] as String,
      reference: json['resource'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'verse': quote,
      'resource': reference,
    };
  }

  static List<AboutQuranReferences> listOfVersesAndHadhiths = [
    AboutQuranReferences(
      quote:
          "නියත වශයෙන්ම මෙම කුර්ආනය වඩාත් නිවැරදි දෑ වෙතට මග පෙන්වයි. තවද යහකම් කරන දේවත්වය විශ්වාස කරන්නන් හට සැබැවින්ම ඔවුනට මහත් වූ කුලිය ඇති බවට එය ශුභාරංචි දන්වයි.",
      reference: "(ශුද්ධ වූ අල්කුර්ආන් 17:9)",
    ),
    AboutQuranReferences(
      quote:
          "ලෝවැසියන්ට එය අවවාදයක් වනු පිණිස තම ගැත්තා මත (සත්‍ය හා අසත්‍ය වෙන් කර දක්වන) මිනුම් දණ්ඩය (හෙවත් අල් කුර්ආනය) පහළ කළා වූ ඔහු උත්කෘෂ්ට විය. ",
      reference: "(ශුද්ධ වූ අල්කුර්ආන් 25:1)",
    ),
    AboutQuranReferences(
      quote:
          "අල්-කුර්ආනය පාරායනය කරනු ලබන විට නුඹලා එයට සවන් දෙනු. තවද නුඹලා නිහඬ ව සිටිනු. (එමඟින්) නුඹලා දයාව දක්වනු ලැබිය හැක.",
      reference: "(ශුද්ධ වූ අල්කුර්ආන් 7:204)",
    ),
    AboutQuranReferences(
      quote:
          "තවද අල් කුර්ආනය මෙනෙහි කිරීම සඳහා සැබැවින්ම අපි පහසු කළෙමු. එහෙයින් මෙනෙහි කරන කිසිවකු හෝ වෙත් ද?",
      reference: "(ශුද්ධ වූ අල්කුර්ආන් 54:32)",
    ),
    AboutQuranReferences(
      quote:
          "එහෙයින් ඔවුන් අල් කුර්ආනය පරිශීලනය නොකරන්නෝ ද? එසේ නැතහොත් (ඔවුන්ගේ) හදවත් මත ඒවාට අගුල් (දමා) තිබේද?",
      reference: "(ශුද්ධ වූ අල්කුර්ආන් 47:24)",
    ),

    AboutQuranReferences(
      quote:
          "තවද දේවත්වය විශ්වාස කරන්නන් හට දයාව හා සුවය ඇති දෑ අපි අල් කුර්ආනයෙන් පහළ කරන්නෙමු. නමුත් අපරාධකරුවන්ට අලාභය මිස වෙනත් කිසිවක් එය වැඩි නොකරනු ඇත.",
      reference: "(ශුද්ධ වූ අල්කුර්ආන් 17:82)",
    ),
    AboutQuranReferences(
      quote:
          "(එය) සකල ලෝකයන්ගේ පරමාධිපතිගෙන් පහළ කරනු ලැබූවකි. ප්‍රබන්ධයන් සමහරක් අප වෙත ඔහු ගොතා පැවසුවේ නම්, අපි ඔහු ව දකුණතින් හසුකර ගන්නෙමු.",
      reference: "(ශුද්ධ වූ අල්කුර්ආන් 69:43-46)",
    ),
    AboutQuranReferences(
      quote:
          "(මෙය) ජීවමාන ව සිටින්නන්හට ඔහු අවවාද කරනු පිණිසය. තවද දේවත්වය ප්‍රතික්ෂේප කරන්නන් හට (දඬුවමේ) ප්‍රකාශය නියම වනු පිණිසය.",
      reference: "(ශුද්ධ වූ අල්කුර්ආන් 36:70)",
    ),
    AboutQuranReferences(
      quote:
          "එහෙයින් නුඹ අල් කුර්ආනය පාරායනා කළ විට පලවා හරින ලද ෂෙයිතාන්ගෙන් ආරක්ෂාව අල්ලාහ්ගෙන් පතනු.",
      reference: "(ශුද්ධ වූ අල්කුර්ආන් 16:98)",
    ),
    AboutQuranReferences(
      quote:
          "නියත වශයෙන්ම අපමය මෙම මෙනෙහි කිරීම (අල් කුර්ආනය) පහළ කළේ. තවද නියත වශයෙන්ම අපි එයට ආරක්ෂකයෝ වෙමු.",
      reference: "(ශුද්ධ වූ අල්කුර්ආන් 15:9)",
    ),
    AboutQuranReferences(
      quote: "අල් කුර්ආනය නිසි අයුරින් පිළිවෙළට පාරායනය කරනු. ",
      reference: "(ශුද්ධ වූ අල්කුර්ආන් 73:4)",
    ),
    AboutQuranReferences(
      quote:
          "අලිෆ්, ලාම්, රා (නබිවරය) අපි මෙය නුඹ වෙත පහළ දේව ග්‍රන්ථයයි. ( ජනයා) ඔවුන්ගේ පරමාධිපතිගේ අනුහසින් අන්ධකාරයන්ගෙන් ආලෝකයට ප්‍රශංසාලාභී, සර්ව බලධාරියාගේ මාර්ගය වෙත නුඹ ඔවුන් යොමු කරනු පිණිස.",
      reference: "(ශුද්ධ වූ අල්කුර්ආන් 14:1)",
    ),
  ];
}
