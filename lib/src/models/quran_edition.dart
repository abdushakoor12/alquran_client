import 'dart:convert';
import 'package:equatable/equatable.dart';

class QuranEdition extends Equatable {
  final String identifier;
  final EditionLanguage language;
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
      language:
          EditionLanguage.valueOfOrNull(map["language"]) ?? EditionLanguage.en,
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
      "language": language.name,
      "name": name,
      "englishName": englishName,
      "format": format.name,
      "type": type.name,
      "direction": direction,
    };
  }

  String toJson() => jsonEncode(toMap());

  @override
  List<Object?> get props {
    return [
      identifier,
      language,
      name,
      englishName,
      format,
      type,
      direction,
    ];
  }
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

enum EditionLanguage {
  ar,
  am,
  az,
  ber,
  bn,
  cs,
  de,
  dv,
  en,
  es,
  fa,
  fr,
  ha,
  hi,
  id,
  it,
  ja,
  ko,
  ku,
  ml,
  nl,
  no,
  pl,
  ps,
  pt,
  ro,
  ru,
  sd,
  so,
  sq,
  sv,
  sw,
  ta,
  tg,
  th,
  tr,
  tt,
  ug,
  ur,
  uz;

  static EditionLanguage? valueOfOrNull(String name) {
    return switch (name) {
      "ar" => EditionLanguage.ar,
      "am" => EditionLanguage.am,
      "az" => EditionLanguage.az,
      "ber" => EditionLanguage.ber,
      "bn" => EditionLanguage.bn,
      "cs" => EditionLanguage.cs,
      "de" => EditionLanguage.de,
      "dv" => EditionLanguage.dv,
      "en" => EditionLanguage.en,
      "es" => EditionLanguage.es,
      "fa" => EditionLanguage.fa,
      "fr" => EditionLanguage.fr,
      "ha" => EditionLanguage.ha,
      "hi" => EditionLanguage.hi,
      "id" => EditionLanguage.id,
      "it" => EditionLanguage.it,
      "ja" => EditionLanguage.ja,
      "ko" => EditionLanguage.ko,
      "ku" => EditionLanguage.ku,
      "ml" => EditionLanguage.ml,
      "nl" => EditionLanguage.nl,
      "no" => EditionLanguage.no,
      "pl" => EditionLanguage.pl,
      "ps" => EditionLanguage.ps,
      "pt" => EditionLanguage.pt,
      "ro" => EditionLanguage.ro,
      "ru" => EditionLanguage.ru,
      "sd" => EditionLanguage.sd,
      "so" => EditionLanguage.so,
      "sq" => EditionLanguage.sq,
      "sv" => EditionLanguage.sv,
      "sw" => EditionLanguage.sw,
      "ta" => EditionLanguage.ta,
      "tg" => EditionLanguage.tg,
      "th" => EditionLanguage.th,
      "tr" => EditionLanguage.tr,
      "tt" => EditionLanguage.tt,
      "ug" => EditionLanguage.ug,
      "ur" => EditionLanguage.ur,
      "uz" => EditionLanguage.uz,
      _ => null,
    };
  }
}
