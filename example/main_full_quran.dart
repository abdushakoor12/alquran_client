import 'package:alquran_client/alquran_client.dart';

void main() async {
  AlQuranClient client = AlQuranClient();

  final fullQuran = await client.getQuran(editionId: "en.asad");
  if (fullQuran == null) {
    print("Failed to get full quran");
    return;
  }
  for (final surah in fullQuran.surahs) {
    print(
        "${surah.name} - ${surah.englishName} - total ayahs: ${surah.numberOfAyahs}");
  }
}
