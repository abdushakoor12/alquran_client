[![alquran_client](https://img.shields.io/pub/v/alquran_client.svg)](https://pub.dev/packages/alquran_client)

Client for [AlQuran.cloud API](https://alquran.cloud/api)

## Usage

### Initialize

```dart
AlQuranClient client = AlQuranClient();
```

### Editions

#### All Editions

```dart
client.getEditions();
```

#### Editions by Format (text or audio)

```dart
client.getEditions(
    format: EditionFormat.audio
);
```

#### Editions by Type (tafsir, translation, transliteration,quran,versebyverse)

```dart
client.getEditions(
    type: EditionType.tafsir
);
```

#### Editions by Language

```dart
client.getEditions(
    language: EditionLanguage.en
);
```

#### Editions by Text Direction (only for text format)

```dart
client.getEditions(
    direction: EditionDirection.ltr
);
```

## TODO

- [ ] Juz
- [x] Surah
- [ ] Ayah
- [ ] Search
- [ ] Manzil
- [ ] Ruku
- [ ] Page
- [ ] Hizb Quarter
- [ ] Sajda
- [x] Meta
