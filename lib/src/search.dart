import 'package:alquran_client/alquran_client.dart';

sealed class SearchType {
  const SearchType();

  factory SearchType.all() => SearchAll();
  factory SearchType.surah(int surahNumber) => SearchSurah(surahNumber);

  String get param => switch (this) {
        SearchAll() => "all",
        SearchSurah surah => surah.surahNumber.toString(),
      };
}

class SearchAll extends SearchType {
  const SearchAll();
}

class SearchSurah extends SearchType {
  final int surahNumber;

  const SearchSurah(this.surahNumber);
}

sealed class SearchBy {
  const SearchBy();

  factory SearchBy.edition(String editionId) => SearchByEdition(editionId);
  factory SearchBy.language(EditionLanguage language) =>
      SearchByLanguage(language);

  String get param => switch (this) {
        SearchByEdition edition => edition.editionId,
        SearchByLanguage language => language.language.name,
      };
}

class SearchByEdition extends SearchBy {
  final String editionId;

  const SearchByEdition(this.editionId);
}

class SearchByLanguage extends SearchBy {
  final EditionLanguage language;

  const SearchByLanguage(this.language);
}
