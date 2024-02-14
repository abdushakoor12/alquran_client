import 'package:alquran_client/src/uri_handler.dart';
import 'package:test/test.dart';

void main() {
  group('UriHandler Tests', () {
    test('getEditions', () async {
      final UriHandler uriHandler = UriHandler();

      const simpleUrl = "https://api.alquran.cloud/v1/edition";
      expect(uriHandler.getEditions().toString(), simpleUrl);

      const urlWithQuery = "https://api.alquran.cloud/v1/edition?language=ar";
      expect(
          uriHandler
              .getEditions(queryParameters: {"language": "ar"}).toString(),
          urlWithQuery);

      const urlWithMultipleQuery =
          "https://api.alquran.cloud/v1/edition?language=ar&format=text";
      expect(
          uriHandler.getEditions(queryParameters: {
            "language": "ar",
            "format": "text",
          }).toString(),
          urlWithMultipleQuery);
    });
  });
}
