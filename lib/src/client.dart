import 'package:alquran_client/alquran_client.dart';
import 'package:alquran_client/src/get.dart';
import 'package:alquran_client/src/models/search_match.dart';
import 'package:alquran_client/src/uri_handler.dart';

class AlQuranClient {
  final UriHandler _uriHandler = UriHandler();

  AlQuranClient();

  /// get editions of quran available
  /// [format] text or audio
  /// [language] language code like en, ar, fr, etc
  /// [type] tafsir, translation, transliteration, versebyverse, quran
  /// [direction] rtl or ltr, note that this is only applicable for text format
  /// when [direction] is not null, and format is audio, direction will be ignored
  /// if no parameters are provided, all editions will be returned
  Future<List<QuranEdition>> getEditions({
    EditionFormat? format,
    EditionLanguage? language,
    EditionType? type,
    EditionDirection? direction,
  }) {
    final params = <String, String>{
      if (format != null) "format": format.name,
      if (language != null) "language": language.name,
      if (type != null) "type": type.name,
    };
    return get(_uriHandler.getEditions(queryParameters: params)).then((result) {
      if (result is ApiSuccessList) {
        return result.data
            .map((edition) => QuranEdition.fromMap(edition))
            .where((e) {
          if (direction != null) {
            if (format != EditionFormat.audio) {
              return e.direction == direction;
            } else {
              return true;
            }
          }
          return true;
        }).toList();
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

  /// get full quran based on edition
  Future<QuranFull?> getFullQuranByEdition(QuranEdition edition) {
    return getQuran(editionId: edition.identifier);
  }

  /// returns a single surah in arabic if no editionId is provided
  /// [number] surah number between 1 and 114
  Future<SurahModel?> getSurah(
    int number, {
    String? editionId,
  }) {
    return get(_uriHandler.getSurah(number, editionId)).then((result) {
      if (result is ApiSuccessMap) {
        return SurahModel.fromMap(result.data);
      } else {
        return null;
      }
    });
  }

  /// get surah based on edition
  Future<SurahModel?> getSurahByEdition(
    int number,
    QuranEdition edition,
  ) {
    return getSurah(number, editionId: edition.identifier);
  }

  /// get single ayah based on ediiton and ayah number
  Future<SingleAyahModel?> getAyah(
    int ayahNumberInQuran, {
    required String editionId,
  }) {
    return get(_uriHandler.getAyah(ayahNumberInQuran, editionId)).then(
      (result) {
        if (result is ApiSuccessMap) {
          return SingleAyahModel.fromMap(result.data);
        } else {
          return null;
        }
      },
    );
  }

  // returns a list of all the ayahs that have sajda in quran
  Future<List<SingleAyahModel>> getSajdaAyahs(String editionId) {
    return get(_uriHandler.getSajdaAyahs(editionId)).then((result) {
      if (result is ApiSuccessMap) {
        List ayahs = result.data["ayahs"];
        return ayahs.map((ayah) => SingleAyahModel.fromMap(ayah)).toList();
      } else {
        return [];
      }
    });
  }

  /// get a whole page of quran ranging from 1 to 604
  Future<QuranPageModel?> getPage(int page, String editionId) {
    assert(page >= 1 && page <= 604);
    return get(_uriHandler.getPage(page, editionId)).then((result) {
      if (result is ApiSuccessMap) {
        return QuranPageModel.fromMap(result.data);
      } else {
        return null;
      }
    });
  }

  /// get a whole ruku of quran ranging from 1 to 556
  Future<QuranRukuModel?> getRuku(int number, String editionId) {
    assert(number >= 1 && number <= 556);
    return get(_uriHandler.getRuku(number, editionId)).then((result) {
      if (result is ApiSuccessMap) {
        return QuranRukuModel.fromMap(result.data);
      } else {
        return null;
      }
    });
  }

  /// get a whole juz of quran ranging from 1 to 30
  Future<QuranJuzModel?> getJuz(int number, String editionId) {
    assert(number >= 1 && number <= 30);
    return get(_uriHandler.getJuz(number, editionId)).then((result) {
      if (result is ApiSuccessMap) {
        return QuranJuzModel.fromMap(result.data);
      } else {
        return null;
      }
    });
  }

  /// get a whole hizbQuarter of quran ranging from 1 to 240
  Future<QuranHizbQuarterModel?> getHizbQuarter(int number, String editionId) {
    assert(number >= 1 && number <= 240);
    return get(_uriHandler.getHizb(number, editionId)).then((result) {
      if (result is ApiSuccessMap) {
        return QuranHizbQuarterModel.fromMap(result.data);
      } else {
        return null;
      }
    });
  }

  /// get a whole manzil of quran ranging from 1 to 7
  Future<QuranManzilModel?> getManzil(int number, String editionId) {
    assert(number >= 1 && number <= 7);
    return get(_uriHandler.getManzil(number, editionId)).then((result) {
      if (result is ApiSuccessMap) {
        return QuranManzilModel.fromMap(result.data);
      } else {
        return null;
      }
    });
  }

  Future<List<SearchMatch>> search(
      String keyword, SearchType searchType, SearchBy searchBy) {
    return get(_uriHandler.search(keyword, searchType, searchBy))
        .then((result) {
      if (result is ApiSuccessMap) {
        return (result.data["matches"] as List)
            .map((e) => SearchMatch.fromMap(e))
            .toList();
      } else {
        return [];
      }
    });
  }
}
