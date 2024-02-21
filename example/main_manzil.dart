import 'package:alquran_client/alquran_client.dart';

void main() async {
  final client = AlQuranClient();
  final manzil = await client.getManzil(1, "en.asad");
  print(manzil?.ayahs.map((e) => e.numberInSurah));
  print(manzil?.surahs.values.map((e) => e.name));
}
