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

  factory QuranEdition.fromJson(Map<String, dynamic> json) {
    EditionType type = switch (json["type"]) {
      "tafsir" => EditionType.tafsir,
      "translation" => EditionType.translation,
      "transliteration" => EditionType.transliteration,
      "versebyverse" => EditionType.versebyverse,
      "quran" => EditionType.quran,
      _ => EditionType.quran,
    };
    EditionFormat format = switch (json["format"]) {
      "text" => EditionFormat.text,
      "audio" => EditionFormat.audio,
      _ => EditionFormat.text,
    };
    return QuranEdition(
      identifier: json["identifier"],
      language: json["language"],
      name: json["name"],
      englishName: json["englishName"],
      format: format,
      type: type,
      direction: json["direction"],
    );
  }

  @override
  String toString() {
    return "QuranEdition(identifier: $identifier, language: $language, name: $name, englishName: $englishName, format: $format, type: $type, direction: $direction)";
  }
}

enum EditionType {
  tafsir("tafsir"),
  translation("translation"),
  transliteration("transliteration"),
  quran("quran"),
  versebyverse("versebyverse");

  final String id;

  const EditionType(this.id);

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
  text("text"),
  audio("audio");

  final String name;

  const EditionFormat(this.name);

  static EditionFormat? valueOfOrNull(String name) {
    return switch (name) {
      "text" => EditionFormat.text,
      "audio" => EditionFormat.audio,
      _ => null,
    };
  }
}
