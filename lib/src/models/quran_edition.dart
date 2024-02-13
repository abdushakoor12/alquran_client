import 'package:dart_mappable/dart_mappable.dart';

part 'quran_edition.mapper.dart';

@MappableClass()
class QuranEdition with QuranEditionMappable {
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
}

@MappableEnum()
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

@MappableEnum()
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
