import 'package:alquran_client/alquran_client.dart';

void main() async {
  final client = AlQuranClient();
  final page = await client.getPage(604, "en.asad");
  print(page?.ayahs.map((e) => e.numberInSurah));
  print(page?.surahs.values.map((e) => e.name));
}
