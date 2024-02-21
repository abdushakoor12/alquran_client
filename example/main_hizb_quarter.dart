import 'package:alquran_client/alquran_client.dart';

void main() async {
  final client = AlQuranClient();
  final hizbQuarter = await client.getHizbQuarter(240, "en.asad");
  print(hizbQuarter?.ayahs.map((e) => e.numberInSurah));
  print(hizbQuarter?.surahs.values.map((e) => e.name));
}
