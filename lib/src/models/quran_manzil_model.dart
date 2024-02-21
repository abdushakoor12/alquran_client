import 'package:alquran_client/src/models/single_ayah_model.dart';
import 'package:equatable/equatable.dart';

class QuranManzilModel extends Equatable {
  final int number;
  final List<SingleAyahModel> ayahs;
  final Map<String, SingleSurahModel> surahs;

  const QuranManzilModel({
    required this.number,
    required this.ayahs,
    required this.surahs,
  });

  @override
  List<Object?> get props => [number, ayahs, surahs];

  factory QuranManzilModel.fromMap(Map<String, dynamic> map) {
    return QuranManzilModel(
      number: map["number"],
      ayahs: (map["ayahs"] as List)
          .map((e) => SingleAyahModel.fromMap(e))
          .toList(),
      surahs: (map["surahs"] as Map<String, dynamic>).map(
        (key, value) {
          return MapEntry(key, SingleSurahModel.fromMap(value));
        },
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "number": number,
      "ayahs": ayahs.map((e) => e.toMap()).toList(),
      "surahs": surahs.map((key, value) => MapEntry(key, value.toMap())),
    };
  }
}
