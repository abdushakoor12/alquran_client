import 'package:alquran_client/alquran_client.dart';
import 'dart:io';

void main() async {
  final client = AlQuranClient();

  print('Enter the language code (en, ar, fr, etc):');
  final language = stdin.readLineSync();
  print('Enter the format (text or audio):');
  final format = stdin.readLineSync();
  print(
      'Enter the type (tafsir, translation, transliteration, versebyverse, quran):');
  final type = stdin.readLineSync();
  print('Enter the direction (rtl or ltr):');
  final direction = stdin.readLineSync();

  final List<QuranEdition> editions = await client.getEditions(
    format: format == null ? null : EditionFormat.valueOfOrNull(format),
    language: language == null ? null : EditionLanguage.valueOfOrNull(language),
    type: type == null ? null : EditionType.valueOfOrNull(type),
    direction:
        direction == null ? null : EditionDirection.valueOfOrNull(direction),
  );

  for (final edition in editions) {
    print(edition.direction);
  }
  print('Total editions: ${editions.length}');
}
