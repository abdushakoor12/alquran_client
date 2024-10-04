import 'package:alquran_client/alquran_client.dart';

class UriHandler {
  static final Uri baseUri = Uri(
    scheme: "https",
    host: "api.alquran.cloud",
  );

  Uri getEditions({
    Map<String, String>? queryParameters,
  }) {
    return baseUri.replace(
        path: "v1/edition", queryParameters: queryParameters);
  }

  Uri getMetadata() {
    return baseUri.replace(path: "v1//meta");
  }

  Uri getQuran({required String editionId}) {
    return baseUri.replace(path: "v1/quran/$editionId");
  }

  Uri getSurah(int number, String? editionId) {
    String path = "v1/surah/$number";
    if (editionId != null) {
      path += "/$editionId";
    }
    return baseUri.replace(path: path);
  }

  Uri getAyah(ayahNumber, String editionId) {
    String path = "v1/ayah/$ayahNumber/$editionId";
    return baseUri.replace(path: path);
  }

  Uri getSajdaAyahs(String editionId) {
    String path = "v1/sajda/$editionId";
    final s = baseUri.replace(path: path);
    print(s);
    return s;
  }

  Uri getPage(int page, String editionId) {
    String path = "v1/page/$page/$editionId";
    return baseUri.replace(path: path);
  }

  Uri getRuku(int ruku, String editionId) {
    String path = "v1/ruku/$ruku/$editionId";
    return baseUri.replace(path: path);
  }

  Uri getJuz(int juz, String editionId) {
    String path = "v1/juz/$juz/$editionId";
    return baseUri.replace(path: path);
  }

  Uri getHizb(int hizb, String editionId) {
    String path = "v1/hizbQuarter/$hizb/$editionId";
    return baseUri.replace(path: path);
  }

  Uri getManzil(int manzil, String editionId) {
    String path = "v1/manzil/$manzil/$editionId";
    return baseUri.replace(path: path);
  }

  Uri search(String keyword, SearchType searchType, SearchBy searchBy) {
    String path = "v1/search/$keyword/${searchType.param}/${searchBy.param}";
    return baseUri.replace(path: path);
  }
}

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
