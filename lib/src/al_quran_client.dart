import 'package:alquran_client/src/get.dart';
import 'package:alquran_client/src/models/quran_edition.dart';
import 'package:alquran_client/src/uri_handler.dart';

class AlQuranClient {
  final UriHandler _uriHandler = UriHandler();

  AlQuranClient();

  /// get editions of quran available
  /// [format] text or audio
  /// [language] language code like en, ar, fr, etc
  /// [type] tafsir, translation, transliteration, versebyverse, quran
  /// if no parameters are provided, all editions will be returned
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
