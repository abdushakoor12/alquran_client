import 'package:equatable/equatable.dart';

class QuranMetadata extends Equatable {
  final AyahsMetadata ayahs;
  final SurahsMetadata surahs;
  final SajdasMetadata sajdas;
  final RukusMetadata rukus;
  final PagesMetadata pages;
  final ManzilsMetadata manzils;
  final HizbQurartersMetadata hizbQuarters;
  final JuzsMetadata juzs;

  QuranMetadata({
    required this.ayahs,
    required this.surahs,
    required this.sajdas,
    required this.rukus,
    required this.pages,
    required this.manzils,
    required this.hizbQuarters,
    required this.juzs,
  });

  factory QuranMetadata.fromMap(Map<String, dynamic> map) {
    return QuranMetadata(
      ayahs: AyahsMetadata.fromMap(map["ayahs"]),
      surahs: SurahsMetadata.fromMap(map["surahs"]),
      sajdas: SajdasMetadata.fromMap(map["sajdas"]),
      rukus: RukusMetadata.fromMap(map["rukus"]),
      pages: PagesMetadata.fromMap(map["pages"]),
      manzils: ManzilsMetadata.fromMap(map["manzils"]),
      hizbQuarters: HizbQurartersMetadata.fromMap(map["hizbQuarters"]),
      juzs: JuzsMetadata.fromMap(map["juzs"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "ayahs": ayahs.toMap(),
      "surahs": surahs.toMap(),
      "sajdas": sajdas.toMap(),
      "rukus": rukus.toMap(),
      "pages": pages.toMap(),
      "manzils": manzils.toMap(),
      "hizbQuarters": hizbQuarters.toMap(),
      "juzs": juzs.toMap(),
    };
  }

  @override
  List<Object?> get props {
    return [
      ayahs,
      surahs,
      sajdas,
      rukus,
      pages,
      manzils,
      hizbQuarters,
      juzs,
    ];
  }
}

class AyahsMetadata extends Equatable {
  final int count;

  AyahsMetadata({required this.count});

  factory AyahsMetadata.fromMap(Map<String, dynamic> map) {
    return AyahsMetadata(
      count: map["count"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "count": count,
    };
  }

  @override
  List<Object?> get props {
    return [count];
  }
}

class SurahsMetadata extends Equatable {
  final int count;
  final List<SurahReference> references;

  SurahsMetadata({required this.count, required this.references});

  factory SurahsMetadata.fromMap(Map<String, dynamic> map) {
    return SurahsMetadata(
      count: map["count"],
      references: List<SurahReference>.from(
          map["references"].map((x) => SurahReference.fromMap(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "count": count,
      "references": List<dynamic>.from(references.map((x) => x.toMap())),
    };
  }

  @override
  List<Object?> get props {
    return [count, references];
  }
}

class SurahReference extends Equatable {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final int numberOfAyahs;
  final String revelationType;

  SurahReference({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.numberOfAyahs,
    required this.revelationType,
  });

  factory SurahReference.fromMap(Map<String, dynamic> map) {
    return SurahReference(
      number: map["number"],
      name: map["name"],
      englishName: map["englishName"],
      englishNameTranslation: map["englishNameTranslation"],
      numberOfAyahs: map["numberOfAyahs"],
      revelationType: map["revelationType"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "number": number,
      "name": name,
      "englishName": englishName,
      "englishNameTranslation": englishNameTranslation,
      "numberOfAyahs": numberOfAyahs,
      "revelationType": revelationType,
    };
  }

  @override
  List<Object?> get props {
    return [
      number,
      name,
      englishName,
      englishNameTranslation,
      numberOfAyahs,
      revelationType,
    ];
  }
}

class SajdasMetadata extends Equatable {
  final int count;
  final List<SajdaReference> references;

  SajdasMetadata({
    required this.count,
    required this.references,
  });

  factory SajdasMetadata.fromMap(Map<String, dynamic> map) {
    return SajdasMetadata(
      count: map["count"],
      references: List<SajdaReference>.from(
        map["references"].map((x) => SajdaReference.fromMap(x)),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "count": count,
      "references": List<dynamic>.from(references.map((x) => x.toMap())),
    };
  }

  @override
  List<Object?> get props {
    return [count, references];
  }
}

class SajdaReference extends Equatable {
  final int surah;
  final int ayah;
  final bool recommended;
  final bool obligatory;

  SajdaReference({
    required this.surah,
    required this.ayah,
    required this.recommended,
    required this.obligatory,
  });

  factory SajdaReference.fromMap(Map<String, dynamic> map) {
    return SajdaReference(
      surah: map["surah"],
      ayah: map["ayah"],
      recommended: map["recommended"],
      obligatory: map["obligatory"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "surah": surah,
      "ayah": ayah,
      "recommended": recommended,
      "obligatory": obligatory,
    };
  }

  @override
  List<Object?> get props {
    return [surah, ayah, recommended, obligatory];
  }
}

class RukusMetadata extends Equatable {
  final int count;
  final List<RukuReference> references;

  RukusMetadata({
    required this.count,
    required this.references,
  });

  factory RukusMetadata.fromMap(Map<String, dynamic> map) {
    return RukusMetadata(
      count: map["count"],
      references: List<RukuReference>.from(
        map["references"].map((x) => RukuReference.fromMap(x)),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "count": count,
      "references": List<dynamic>.from(references.map((x) => x.toMap())),
    };
  }

  @override
  List<Object?> get props {
    return [count, references];
  }
}

class RukuReference extends Equatable {
  final int surah;
  final int ayah;

  RukuReference({
    required this.surah,
    required this.ayah,
  });

  factory RukuReference.fromMap(Map<String, dynamic> map) {
    return RukuReference(
      surah: map["surah"],
      ayah: map["ayah"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "surah": surah,
      "ayah": ayah,
    };
  }

  @override
  List<Object?> get props {
    return [surah, ayah];
  }
}

class PagesMetadata extends Equatable {
  final int count;
  final List<PageReference> references;

  PagesMetadata({
    required this.count,
    required this.references,
  });

  factory PagesMetadata.fromMap(Map<String, dynamic> map) {
    return PagesMetadata(
      count: map["count"],
      references: List<PageReference>.from(
        map["references"].map((x) => PageReference.fromMap(x)),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "count": count,
      "references": List<dynamic>.from(references.map((x) => x.toMap())),
    };
  }

  @override
  List<Object?> get props {
    return [count, references];
  }
}

class PageReference extends Equatable {
  final int surah;
  final int ayah;

  PageReference({
    required this.surah,
    required this.ayah,
  });

  factory PageReference.fromMap(Map<String, dynamic> map) {
    return PageReference(
      surah: map["surah"],
      ayah: map["ayah"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "surah": surah,
      "ayah": ayah,
    };
  }

  @override
  List<Object?> get props {
    return [surah, ayah];
  }
}

class ManzilsMetadata extends Equatable {
  final int count;
  final List<ManzilReference> references;

  ManzilsMetadata({
    required this.count,
    required this.references,
  });

  factory ManzilsMetadata.fromMap(Map<String, dynamic> map) {
    return ManzilsMetadata(
      count: map["count"],
      references: List<ManzilReference>.from(
        map["references"].map((x) => ManzilReference.fromMap(x)),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "count": count,
      "references": List<dynamic>.from(references.map((x) => x.toMap())),
    };
  }

  @override
  List<Object?> get props {
    return [count, references];
  }
}

class ManzilReference extends Equatable {
  final int surah;
  final int ayah;

  ManzilReference({
    required this.surah,
    required this.ayah,
  });

  factory ManzilReference.fromMap(Map<String, dynamic> map) {
    return ManzilReference(
      surah: map["surah"],
      ayah: map["ayah"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "surah": surah,
      "ayah": ayah,
    };
  }

  @override
  List<Object?> get props {
    return [surah, ayah];
  }
}

class HizbQurartersMetadata extends Equatable {
  final int count;
  final List<HizbQuarterReference> references;

  HizbQurartersMetadata({
    required this.count,
    required this.references,
  });

  factory HizbQurartersMetadata.fromMap(Map<String, dynamic> map) {
    return HizbQurartersMetadata(
      count: map["count"],
      references: List<HizbQuarterReference>.from(
        map["references"].map((x) => HizbQuarterReference.fromMap(x)),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "count": count,
      "references": List<dynamic>.from(references.map((x) => x.toMap())),
    };
  }

  @override
  List<Object?> get props {
    return [count, references];
  }
}

class HizbQuarterReference extends Equatable {
  final int surah;
  final int ayah;

  HizbQuarterReference({
    required this.surah,
    required this.ayah,
  });

  factory HizbQuarterReference.fromMap(Map<String, dynamic> map) {
    return HizbQuarterReference(
      surah: map["surah"],
      ayah: map["ayah"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "surah": surah,
      "ayah": ayah,
    };
  }

  @override
  List<Object?> get props {
    return [surah, ayah];
  }
}

class JuzsMetadata extends Equatable {
  final int count;
  final List<JuzReference> references;

  JuzsMetadata({
    required this.count,
    required this.references,
  });

  factory JuzsMetadata.fromMap(Map<String, dynamic> map) {
    return JuzsMetadata(
      count: map["count"],
      references: List<JuzReference>.from(
        map["references"].map((x) => JuzReference.fromMap(x)),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "count": count,
      "references": List<dynamic>.from(references.map((x) => x.toMap())),
    };
  }

  @override
  List<Object?> get props {
    return [count, references];
  }
}

class JuzReference extends Equatable {
  final int surah;
  final int ayah;

  JuzReference({
    required this.surah,
    required this.ayah,
  });

  factory JuzReference.fromMap(Map<String, dynamic> map) {
    return JuzReference(
      surah: map["surah"],
      ayah: map["ayah"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "surah": surah,
      "ayah": ayah,
    };
  }

  @override
  List<Object?> get props {
    return [surah, ayah];
  }
}
