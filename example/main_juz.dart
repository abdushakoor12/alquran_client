import 'package:alquran_client/alquran_client.dart';

void main() async {
  final client = AlQuranClient();
  final juz = await client.getJuz(30, "en.asad");
  print(juz?.ayahs.map((e) => e.numberInSurah));
  print(juz?.surahs.values.map((e) => e.name));
}
