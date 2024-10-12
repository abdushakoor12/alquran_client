import 'package:alquran_client/src/search.dart';

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