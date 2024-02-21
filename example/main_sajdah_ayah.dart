import 'package:alquran_client/alquran_client.dart';

void main() async {
  final client = AlQuranClient();
  final sajdahAyahs = await client.getSajdaAyahs("en.asad");
  print(sajdahAyahs.map((e) => e.numberInSurah));
}
