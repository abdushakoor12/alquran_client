import 'package:alquran_client/alquran_client.dart';

void main() async {
  final AlQuranClient client = AlQuranClient();
  final surah = await client.getSurah(114);
  print(surah?.ayahs.first.text);
  final surahEn = await client.getSurah(114, editionId: "en.asad");
  print(surahEn?.ayahs.first.text);
}
