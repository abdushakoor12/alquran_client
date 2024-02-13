import 'package:alquran_client/src/urls.dart';
import 'package:test/test.dart';

void main() {
  group('UriHandler Tests', () {
    test('getEditions', () async {
      final UriHandler uriHandler = UriHandler();

      const simpleUrl = "https://api.alquran.cloud/edition";
      expect(uriHandler.getEditions().toString(), simpleUrl);

      const urlWithQuery = "https://api.alquran.cloud/edition?language=ar";
      expect(
          uriHandler
              .getEditions(queryParameters: {"language": "ar"}).toString(),
          urlWithQuery);

      const urlWithMultipleQuery =
          "https://api.alquran.cloud/edition?language=ar&format=text";
      expect(
          uriHandler.getEditions(queryParameters: {
            "language": "ar",
            "format": "text",
          }).toString(),
          urlWithMultipleQuery);
    });
  });
}
