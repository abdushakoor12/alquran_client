import 'package:alquran_client/alquran_client.dart';

Future<void> main() async {
  final client = AlQuranClient();
  final searchMatches = await client.search(
    "Cow",
    SearchType.surah(2),
    SearchBy.edition("en.asad"),
  );

  if (searchMatches.isEmpty) {
    print("No matches found");
  } else {
    print("Found ${searchMatches.length} matches");
    for (final match in searchMatches) {
      print(match.surah.name);
      print(match.text);
    }
  }
}
