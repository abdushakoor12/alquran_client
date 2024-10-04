import 'package:alquran_client/alquran_client.dart';

class SearchMatch {
  /// the number of the ayah in the Quran
  final int number;

  final int numberInSurah;
  final String text;

  /// the edition of the quran, as search match could be from different editions
  /// when given a language instead of edition identifier
  final QuranEdition edition;

  final SearchSurahModel surah;

  SearchMatch({
    required this.number,
    required this.numberInSurah,
    required this.text,
    required this.edition,
    required this.surah,
  });

  factory SearchMatch.fromMap(Map<String, dynamic> map) {
    return SearchMatch(
      number: map["number"],
      numberInSurah: map["numberInSurah"],
      text: map["text"],
      edition: QuranEdition.fromMap(map["edition"]),
      surah: SearchSurahModel.fromMap(map["surah"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "number": number,
      "numberInSurah": numberInSurah,
      "text": text,
      "edition": edition.toMap(),
      "surah": surah.toMap(),
    };
  }
}

class SearchSurahModel {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;

  SearchSurahModel({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
  });

  factory SearchSurahModel.fromMap(Map<String, dynamic> map) {
    return SearchSurahModel(
      number: map["number"],
      name: map["name"],
      englishName: map["englishName"],
      englishNameTranslation: map["englishNameTranslation"],
      revelationType: map["revelationType"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "number": number,
      "name": name,
      "englishName": englishName,
      "englishNameTranslation": englishNameTranslation,
      "revelationType": revelationType,
    };
  }
}