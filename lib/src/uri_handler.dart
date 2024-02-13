class UriHandler {
  static final Uri baseUri = Uri(
    scheme: "https",
    host: "api.alquran.cloud",
  );

  Uri getEditions({
    Map<String, String>? queryParameters,
  }) {
    return baseUri.replace(path: "/edition", queryParameters: queryParameters);
  }

  Uri getEditionLanguages() {
    return baseUri.replace(path: "/edition/language");
  }
}
