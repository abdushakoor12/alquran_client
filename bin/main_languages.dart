import 'package:alquran_client/src/al_quran_client.dart';

void main() async {
  final client = AlQuranClient();

  final List<String> languages = await client.getEditionLanguages();
  print(languages);
  print('Total languages: ${languages.length}');
}
