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
    EditionLanguage? language,
    EditionType? type,
  }) {
    final params = <String, String>{
      if (format != null) "format": format.name,
      if (language != null) "language": language.name,
      if (type != null) "type": type.name,
    };
    return get(_uriHandler.getEditions(queryParameters: params)).then((result) {
      if (result is ApiSuccessList) {
        return result.data.map((e) => QuranEdition.fromMap(e)).toList();
      } else {
        return [];
      }
    });
  }
}