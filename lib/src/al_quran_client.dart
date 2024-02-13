import 'package:alquran_client/src/get.dart';
import 'package:alquran_client/src/models/quran_edition.dart';
import 'package:alquran_client/src/urls.dart';

class AlQuranClient {
  final UriHandler _uriHandler = UriHandler();

  AlQuranClient();

  Future<List<QuranEdition>> getEditions({
    EditionFormat? format,
    String? language,
    EditionType? type,
  }) async {
    final params = <String, String>{
      if (format != null) "format": format.name,
      if (language != null) "language": language,
      if (type != null) "type": type.id,
    };
    return get(_uriHandler.getEditions(queryParameters: params)).then((result) {
      if (result is ApiSuccessList) {
        return result.data.map((e) => QuranEdition.fromJson(e)).toList();
      } else {
        return [];
      }
    });
  }
}
