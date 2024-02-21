import 'package:alquran_client/src/models/ayah_model.dart';
import 'package:alquran_client/src/models/quran_edition.dart';
import 'package:equatable/equatable.dart';

class QuranFull extends Equatable {
  final QuranEdition edition;
  final List<SurahModel> surahs;

  QuranFull({required this.edition, required this.surahs});

  factory QuranFull.fromMap(Map<String, dynamic> map) {
    return QuranFull(
      edition: QuranEdition.fromMap(map["edition"]),
      surahs: (map["surahs"] as List)
          .map((e) => SurahModel.fromMap(e))
          .toList(growable: false),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "edition": edition.toMap(),
      "surahs": surahs.map((e) => e.toMap()).toList(growable: false),
    };
  }

  @override
  List<Object?> get props => [edition, surahs];
}

class SurahModel extends Equatable {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;
  final List<AyahModel> ayahs;
  final int numberOfAyahs;

  SurahModel({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.ayahs,
    required this.numberOfAyahs,
  });

  factory SurahModel.fromMap(Map<String, dynamic> map) {
    final ayahs = (map["ayahs"] as List)
        .map((e) => AyahModel.fromMap(e))
        .toList(growable: false);

    return SurahModel(
      number: map["number"],
      name: map["name"],
      englishName: map["englishName"],
      englishNameTranslation: map["englishNameTranslation"],
      revelationType: map["revelationType"],
      ayahs: ayahs,
      numberOfAyahs: map["numberOfAyahs"] ?? ayahs.length,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "number": number,
      "name": name,
      "englishName": englishName,
      "englishNameTranslation": englishNameTranslation,
      "revelationType": revelationType,
      "ayahs": ayahs.map((e) => e.toMap()).toList(growable: false),
      "numberOfAyahs": numberOfAyahs,
    };
  }

  @override
  List<Object?> get props => [
        number,
        name,
        englishName,
        englishNameTranslation,
        revelationType,
        ayahs,
      ];
}
