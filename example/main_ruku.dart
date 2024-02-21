import 'package:alquran_client/alquran_client.dart';

void main() async {
  final client = AlQuranClient();
  final ruku = await client.getRuku(4, "en.asad");
  print(ruku?.ayahs.map((e) => e.numberInSurah));
  print(ruku?.surahs.values.map((e) => e.name));
}
