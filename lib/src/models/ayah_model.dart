import 'package:equatable/equatable.dart';

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

  const AyahModel({
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
