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
}
