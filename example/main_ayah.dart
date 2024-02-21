import 'package:alquran_client/alquran_client.dart';

void main() async {
  final client = AlQuranClient();
  final ayah = await client.getAyah(203, editionId: "quran-simple");
  if (ayah == null) {
    print("Failed to get ayah");
    return;
  }

  print(ayah);
}
