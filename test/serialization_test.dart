import 'package:alquran_client/alquran_client.dart';
import 'package:test/test.dart';

void main() {
  group('Serialization Tests', () {
    test("QuranEdition", () {
      final map = {
        "identifier": "identifier",
        "language": "en",
        "name": "name",
        "englishName": "englishName",
        "format": "text",
        "type": "quran",
        "direction": "direction",
      };
      final edition = QuranEdition.fromMap(map);
      expect(edition.toMap(), map);
      final mapWithNoDirection = {
        "identifier": "identifier",
        "name": "name",
        "englishName": "englishName",
        "format": "text",
        "type": "quran",
        "language": "en",
        "direction": null,
      };
      final editionWithNoLanguage = QuranEdition.fromMap(mapWithNoDirection);
      expect(editionWithNoLanguage.toMap(), mapWithNoDirection);
    });
  });
}
