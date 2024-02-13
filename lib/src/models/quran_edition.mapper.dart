// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'quran_edition.dart';

class EditionTypeMapper extends EnumMapper<EditionType> {
  EditionTypeMapper._();

  static EditionTypeMapper? _instance;
  static EditionTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EditionTypeMapper._());
    }
    return _instance!;
  }

  static EditionType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  EditionType decode(dynamic value) {
    switch (value) {
      case 'tafsir':
        return EditionType.tafsir;
      case 'translation':
        return EditionType.translation;
      case 'transliteration':
        return EditionType.transliteration;
      case 'quran':
        return EditionType.quran;
      case 'versebyverse':
        return EditionType.versebyverse;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(EditionType self) {
    switch (self) {
      case EditionType.tafsir:
        return 'tafsir';
      case EditionType.translation:
        return 'translation';
      case EditionType.transliteration:
        return 'transliteration';
      case EditionType.quran:
        return 'quran';
      case EditionType.versebyverse:
        return 'versebyverse';
    }
  }
}

extension EditionTypeMapperExtension on EditionType {
  String toValue() {
    EditionTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<EditionType>(this) as String;
  }
}

class EditionFormatMapper extends EnumMapper<EditionFormat> {
  EditionFormatMapper._();

  static EditionFormatMapper? _instance;
  static EditionFormatMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EditionFormatMapper._());
    }
    return _instance!;
  }

  static EditionFormat fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  EditionFormat decode(dynamic value) {
    switch (value) {
      case 'text':
        return EditionFormat.text;
      case 'audio':
        return EditionFormat.audio;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(EditionFormat self) {
    switch (self) {
      case EditionFormat.text:
        return 'text';
      case EditionFormat.audio:
        return 'audio';
    }
  }
}

extension EditionFormatMapperExtension on EditionFormat {
  String toValue() {
    EditionFormatMapper.ensureInitialized();
    return MapperContainer.globals.toValue<EditionFormat>(this) as String;
  }
}

class QuranEditionMapper extends ClassMapperBase<QuranEdition> {
  QuranEditionMapper._();

  static QuranEditionMapper? _instance;
  static QuranEditionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QuranEditionMapper._());
      EditionFormatMapper.ensureInitialized();
      EditionTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'QuranEdition';

  static String _$identifier(QuranEdition v) => v.identifier;
  static const Field<QuranEdition, String> _f$identifier =
      Field('identifier', _$identifier);
  static String _$language(QuranEdition v) => v.language;
  static const Field<QuranEdition, String> _f$language =
      Field('language', _$language);
  static String _$name(QuranEdition v) => v.name;
  static const Field<QuranEdition, String> _f$name = Field('name', _$name);
  static String _$englishName(QuranEdition v) => v.englishName;
  static const Field<QuranEdition, String> _f$englishName =
      Field('englishName', _$englishName);
  static EditionFormat _$format(QuranEdition v) => v.format;
  static const Field<QuranEdition, EditionFormat> _f$format =
      Field('format', _$format);
  static EditionType _$type(QuranEdition v) => v.type;
  static const Field<QuranEdition, EditionType> _f$type = Field('type', _$type);
  static String? _$direction(QuranEdition v) => v.direction;
  static const Field<QuranEdition, String> _f$direction =
      Field('direction', _$direction);

  @override
  final MappableFields<QuranEdition> fields = const {
    #identifier: _f$identifier,
    #language: _f$language,
    #name: _f$name,
    #englishName: _f$englishName,
    #format: _f$format,
    #type: _f$type,
    #direction: _f$direction,
  };

  static QuranEdition _instantiate(DecodingData data) {
    return QuranEdition(
        identifier: data.dec(_f$identifier),
        language: data.dec(_f$language),
        name: data.dec(_f$name),
        englishName: data.dec(_f$englishName),
        format: data.dec(_f$format),
        type: data.dec(_f$type),
        direction: data.dec(_f$direction));
  }

  @override
  final Function instantiate = _instantiate;

  static QuranEdition fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<QuranEdition>(map);
  }

  static QuranEdition fromJson(String json) {
    return ensureInitialized().decodeJson<QuranEdition>(json);
  }
}

mixin QuranEditionMappable {
  String toJson() {
    return QuranEditionMapper.ensureInitialized()
        .encodeJson<QuranEdition>(this as QuranEdition);
  }

  Map<String, dynamic> toMap() {
    return QuranEditionMapper.ensureInitialized()
        .encodeMap<QuranEdition>(this as QuranEdition);
  }

  QuranEditionCopyWith<QuranEdition, QuranEdition, QuranEdition> get copyWith =>
      _QuranEditionCopyWithImpl(this as QuranEdition, $identity, $identity);
  @override
  String toString() {
    return QuranEditionMapper.ensureInitialized()
        .stringifyValue(this as QuranEdition);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            QuranEditionMapper.ensureInitialized()
                .isValueEqual(this as QuranEdition, other));
  }

  @override
  int get hashCode {
    return QuranEditionMapper.ensureInitialized()
        .hashValue(this as QuranEdition);
  }
}

extension QuranEditionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, QuranEdition, $Out> {
  QuranEditionCopyWith<$R, QuranEdition, $Out> get $asQuranEdition =>
      $base.as((v, t, t2) => _QuranEditionCopyWithImpl(v, t, t2));
}

abstract class QuranEditionCopyWith<$R, $In extends QuranEdition, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? identifier,
      String? language,
      String? name,
      String? englishName,
      EditionFormat? format,
      EditionType? type,
      String? direction});
  QuranEditionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _QuranEditionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, QuranEdition, $Out>
    implements QuranEditionCopyWith<$R, QuranEdition, $Out> {
  _QuranEditionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<QuranEdition> $mapper =
      QuranEditionMapper.ensureInitialized();
  @override
  $R call(
          {String? identifier,
          String? language,
          String? name,
          String? englishName,
          EditionFormat? format,
          EditionType? type,
          Object? direction = $none}) =>
      $apply(FieldCopyWithData({
        if (identifier != null) #identifier: identifier,
        if (language != null) #language: language,
        if (name != null) #name: name,
        if (englishName != null) #englishName: englishName,
        if (format != null) #format: format,
        if (type != null) #type: type,
        if (direction != $none) #direction: direction
      }));
  @override
  QuranEdition $make(CopyWithData data) => QuranEdition(
      identifier: data.get(#identifier, or: $value.identifier),
      language: data.get(#language, or: $value.language),
      name: data.get(#name, or: $value.name),
      englishName: data.get(#englishName, or: $value.englishName),
      format: data.get(#format, or: $value.format),
      type: data.get(#type, or: $value.type),
      direction: data.get(#direction, or: $value.direction));

  @override
  QuranEditionCopyWith<$R2, QuranEdition, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _QuranEditionCopyWithImpl($value, $cast, t);
}
