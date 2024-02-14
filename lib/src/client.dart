import 'package:alquran_client/src/get.dart';
import 'package:alquran_client/src/models/quran_edition.dart';
import 'package:alquran_client/src/models/quran_full.dart';
import 'package:alquran_client/src/models/quran_metadata.dart';
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

  /// get metadata of quran
  Future<QuranMetadata?> getMetadata() {
    return get(_uriHandler.getMetadata()).then((result) {
      if (result is ApiSuccessMap) {
        return QuranMetadata.fromMap(result.data);
      } else {
        return null;
      }
    });
  }

  /// get full quran based on edition id
  /// [editionId] id of the edition that can be obtained from getEditions
  Future<QuranFull?> getQuran({
    required String editionId,
  }) {
    return get(_uriHandler.getQuran(editionId: editionId)).then((result) {
      if (result is ApiSuccessMap) {
        return QuranFull.fromMap(result.data);
      } else {
        return null;
      }
    });
  }

  Future<QuranFull?> getFullQuranByEdition(QuranEdition edition) {
    return getQuran(editionId: edition.identifier);
  }
}
