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

class AyahModel extends Equatable {
  final int number;
  final String text;
  final int numberInSurah;
  final int juz;
  final int manzil;
  final int page;
  final int ruku;
  final int hizbQuarter;
  final SajdaModel? sajda;

  AyahModel({
    required this.number,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    this.sajda,
  });

  factory AyahModel.fromMap(Map<String, dynamic> map) {
    return AyahModel(
      number: map["number"],
      text: map["text"],
      numberInSurah: map["numberInSurah"],
      juz: map["juz"],
      manzil: map["manzil"],
      page: map["page"],
      ruku: map["ruku"],
      hizbQuarter: map["hizbQuarter"],
      sajda: map["sajda"] is Map ? SajdaModel.fromMap(map["sajda"]) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "number": number,
      "text": text,
      "numberInSurah": numberInSurah,
      "juz": juz,
      "manzil": manzil,
      "page": page,
      "ruku": ruku,
      "hizbQuarter": hizbQuarter,
      "sajda": sajda?.toMap(),
    };
  }

  @override
  List<Object?> get props => [
        number,
        text,
        numberInSurah,
        juz,
        manzil,
        page,
        ruku,
        hizbQuarter,
        sajda,
      ];
}

class SajdaModel extends Equatable {
  final int id;
  final bool recommended;
  final bool obligatory;

  SajdaModel({
    required this.id,
    required this.recommended,
    required this.obligatory,
  });

  factory SajdaModel.fromMap(Map<String, dynamic> map) {
    return SajdaModel(
      id: map["id"],
      recommended: map["recommended"],
      obligatory: map["obligatory"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "recommended": recommended,
      "obligatory": obligatory,
    };
  }

  @override
  List<Object?> get props => [id, recommended, obligatory];
}
