import 'dart:convert';

class QuranEdition {
  final String identifier;
  final String language;
  final String name;
  final String englishName;
  final EditionFormat format;
  final EditionType type;
  final String? direction;

  const QuranEdition({
    required this.identifier,
    required this.language,
    required this.name,
    required this.englishName,
    required this.format,
    required this.type,
    required this.direction,
  });

  factory QuranEdition.fromMap(Map<String, dynamic> map) {
    return QuranEdition(
      identifier: map["identifier"],
      language: map["language"],
      name: map["name"],
      englishName: map["englishName"],
      format: EditionFormat.valueOfOrNull(map["format"]) ?? EditionFormat.text,
      type: EditionType.valueOfOrNull(map["type"]) ?? EditionType.quran,
      direction: map["direction"],
    );
  }

  factory QuranEdition.fromJson(String source) =>
      QuranEdition.fromMap(jsonDecode(source));

  Map<String, dynamic> toMap() {
    return {
      "identifier": identifier,
      "language": language,
      "name": name,
      "englishName": englishName,
      "format": format.name,
      "type": type.name,
      "direction": direction,
    };
  }

  String toJson() => jsonEncode(toMap());
}

enum EditionType {
  tafsir,
  translation,
  transliteration,
  quran,
  versebyverse;

  static EditionType? valueOfOrNull(String id) {
    return switch (id) {
      "tafsir" => EditionType.tafsir,
      "translation" => EditionType.translation,
      "transliteration " => EditionType.transliteration,
      "quran" => EditionType.quran,
      "versebyverse" => EditionType.versebyverse,
      _ => null,
    };
  }
}

enum EditionFormat {
  text,
  audio;

  static EditionFormat? valueOfOrNull(String name) {
    return switch (name) {
      "text" => EditionFormat.text,
      "audio" => EditionFormat.audio,
      _ => null,
    };
  }
}
