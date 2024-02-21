import 'package:alquran_client/alquran_client.dart';
import 'package:alquran_client/src/models/ayah_model.dart';
import 'package:equatable/equatable.dart';

/// similar to [AyahModel] but with a [SingleSurahModel] and [QuranEdition] too
class SingleAyahModel extends AyahModel {
  final SingleSurahModel surah;
  const SingleAyahModel({
    required this.surah,
    required int number,
    required String text,
    required int numberInSurah,
    required int juz,
    required int manzil,
    required int page,
    required int ruku,
    required int hizbQuarter,
    required SajdaModel? sajda,
  }) : super(
          number: number,
          text: text,
          numberInSurah: numberInSurah,
          juz: juz,
          manzil: manzil,
          page: page,
          ruku: ruku,
          hizbQuarter: hizbQuarter,
          sajda: sajda,
        );

  factory SingleAyahModel.fromMap(Map<String, dynamic> map) {
    return SingleAyahModel(
      surah: SingleSurahModel.fromMap(map["surah"]),
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

  @override
  Map<String, dynamic> toMap() {
    return {
      "surah": surah.toMap(),
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
        surah,
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

class SingleSurahModel extends Equatable {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;
  final int numberOfAyahs;

  SingleSurahModel({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.numberOfAyahs,
  });

  factory SingleSurahModel.fromMap(Map<String, dynamic> map) {
    return SingleSurahModel(
      number: map["number"],
      name: map["name"],
      englishName: map["englishName"],
      englishNameTranslation: map["englishNameTranslation"],
      revelationType: map["revelationType"],
      numberOfAyahs: map["numberOfAyahs"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "number": number,
      "name": name,
      "englishName": englishName,
      "englishNameTranslation": englishNameTranslation,
      "revelationType": revelationType,
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
        numberOfAyahs,
      ];
}
