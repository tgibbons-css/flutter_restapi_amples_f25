// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CardList cardListFromJson(String str) => CardList.fromJson(json.decode(str));

String cardListToJson(CardList data) => json.encode(data.toJson());

class CardList {
  List<PokemonCard> cardList;
  int page;
  int pageSize;
  int count;
  int totalCount;

  CardList({
    required this.cardList,
    required this.page,
    required this.pageSize,
    required this.count,
    required this.totalCount,
  });

  factory CardList.fromJson(Map<String, dynamic> json) => CardList(
    cardList: List<PokemonCard>.from(json["data"].map((x) => PokemonCard.fromJson(x))),
    page: json["page"],
    pageSize: json["pageSize"],
    count: json["count"],
    totalCount: json["totalCount"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(cardList.map((x) => x.toJson())),
    "page": page,
    "pageSize": pageSize,
    "count": count,
    "totalCount": totalCount,
  };
}

class PokemonCard {
  String id;
  String name;
  Supertype supertype;
  List<Subtype> subtypes;
  String hp;
  List<TypeElement> types;
  String? evolvesFrom;
  List<Attack>? attacks;
  // List<Resistance>? weaknesses;
  // List<Resistance>? resistances;
  // List<TypeElement>? retreatCost;
  // int? convertedRetreatCost;
  // Set datumSet;
  // String number;
  // String artist;
  // Rarity? rarity;
  String? flavorText;
  // List<int> nationalPokedexNumbers;
  // Legalities legalities;
  // DatumImages images;
  // Tcgplayer? tcgplayer;
  // Cardmarket? cardmarket;
  // List<String>? evolvesTo;
  // String? level;
  // List<Ability>? abilities;
  // List<String>? rules;
  // String? regulationMark;

  PokemonCard({
    required this.id,
    required this.name,
    required this.supertype,
    required this.subtypes,
    required this.hp,
    required this.types,
    this.evolvesFrom,
    this.attacks,
    // this.weaknesses,
    // this.resistances,
    // this.retreatCost,
    // this.convertedRetreatCost,
    // required this.datumSet,
    // required this.number,
    // required this.artist,
    // this.rarity,
    this.flavorText,
    // required this.nationalPokedexNumbers,
    // required this.legalities,
    // required this.images,
    // this.tcgplayer,
    // this.cardmarket,
    // this.evolvesTo,
    // this.level,
    // this.abilities,
    // this.rules,
    // this.regulationMark,
  });

  factory PokemonCard.fromJson(Map<String, dynamic> json) => PokemonCard(
    id: json["id"],
    name: json["name"],
    supertype: supertypeValues.map[json["supertype"]]!,
    subtypes: List<Subtype>.from(json["subtypes"].map((x) => subtypeValues.map[x]!)),
    hp: json["hp"],
    types: List<TypeElement>.from(json["types"].map((x) => typeElementValues.map[x]!)),
    evolvesFrom: json["evolvesFrom"],
    attacks: json["attacks"] == null ? [] : List<Attack>.from(json["attacks"]!.map((x) => Attack.fromJson(x))),
    // weaknesses: json["weaknesses"] == null ? [] : List<Resistance>.from(json["weaknesses"]!.map((x) => Resistance.fromJson(x))),
    // resistances: json["resistances"] == null ? [] : List<Resistance>.from(json["resistances"]!.map((x) => Resistance.fromJson(x))),
    // retreatCost: json["retreatCost"] == null ? [] : List<TypeElement>.from(json["retreatCost"]!.map((x) => typeElementValues.map[x]!)),
    // convertedRetreatCost: json["convertedRetreatCost"],
    // datumSet: Set.fromJson(json["set"]),
    // number: json["number"],
    // artist: json["artist"],
    // rarity: rarityValues.map[json["rarity"]]!,
    flavorText: json["flavorText"],
    // nationalPokedexNumbers: List<int>.from(json["nationalPokedexNumbers"].map((x) => x)),
    // legalities: Legalities.fromJson(json["legalities"]),
    // images: DatumImages.fromJson(json["images"]),
    // tcgplayer: json["tcgplayer"] == null ? null : Tcgplayer.fromJson(json["tcgplayer"]),
    // cardmarket: json["cardmarket"] == null ? null : Cardmarket.fromJson(json["cardmarket"]),
    // evolvesTo: json["evolvesTo"] == null ? [] : List<String>.from(json["evolvesTo"]!.map((x) => x)),
    // level: json["level"],
    // abilities: json["abilities"] == null ? [] : List<Ability>.from(json["abilities"]!.map((x) => Ability.fromJson(x))),
    // rules: json["rules"] == null ? [] : List<String>.from(json["rules"]!.map((x) => x)),
    // regulationMark: json["regulationMark"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "supertype": supertypeValues.reverse[supertype],
    "subtypes": List<dynamic>.from(subtypes.map((x) => subtypeValues.reverse[x])),
    "hp": hp,
    "types": List<dynamic>.from(types.map((x) => typeElementValues.reverse[x])),
    "evolvesFrom": evolvesFrom,
    "attacks": attacks == null ? [] : List<dynamic>.from(attacks!.map((x) => x.toJson())),
    // "weaknesses": weaknesses == null ? [] : List<dynamic>.from(weaknesses!.map((x) => x.toJson())),
    // "resistances": resistances == null ? [] : List<dynamic>.from(resistances!.map((x) => x.toJson())),
    // "retreatCost": retreatCost == null ? [] : List<dynamic>.from(retreatCost!.map((x) => typeElementValues.reverse[x])),
    // "convertedRetreatCost": convertedRetreatCost,
    // "set": datumSet.toJson(),
    // "number": number,
    // "artist": artist,
    // "rarity": rarityValues.reverse[rarity],
    "flavorText": flavorText,
    // "nationalPokedexNumbers": List<dynamic>.from(nationalPokedexNumbers.map((x) => x)),
    // "legalities": legalities.toJson(),
    // "images": images.toJson(),
    // "tcgplayer": tcgplayer?.toJson(),
    // "cardmarket": cardmarket?.toJson(),
    // "evolvesTo": evolvesTo == null ? [] : List<dynamic>.from(evolvesTo!.map((x) => x)),
    // "level": level,
    // "abilities": abilities == null ? [] : List<dynamic>.from(abilities!.map((x) => x.toJson())),
    // "rules": rules == null ? [] : List<dynamic>.from(rules!.map((x) => x)),
    // "regulationMark": regulationMark,
  };
}

class Ability {
  String name;
  String text;
  AbilityType type;

  Ability({
    required this.name,
    required this.text,
    required this.type,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
    name: json["name"],
    text: json["text"],
    type: abilityTypeValues.map[json["type"]]!,
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "text": text,
    "type": abilityTypeValues.reverse[type],
  };
}

enum AbilityType {
  ABILITY,
  POKMON_POWER,
  POK_BODY,
  POK_POWER
}

final abilityTypeValues = EnumValues({
  "Ability": AbilityType.ABILITY,
  "Pokémon Power": AbilityType.POKMON_POWER,
  "Poké-Body": AbilityType.POK_BODY,
  "Poké-Power": AbilityType.POK_POWER
});

class Attack {
  String name;
  List<TypeElement> cost;
  int convertedEnergyCost;
  String damage;
  String text;

  Attack({
    required this.name,
    required this.cost,
    required this.convertedEnergyCost,
    required this.damage,
    required this.text,
  });

  factory Attack.fromJson(Map<String, dynamic> json) => Attack(
    name: json["name"],
    cost: List<TypeElement>.from(json["cost"].map((x) => typeElementValues.map[x]!)),
    convertedEnergyCost: json["convertedEnergyCost"],
    damage: json["damage"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "cost": List<dynamic>.from(cost.map((x) => typeElementValues.reverse[x])),
    "convertedEnergyCost": convertedEnergyCost,
    "damage": damage,
    "text": text,
  };
}

enum TypeElement {
  COLORLESS,
  DARKNESS,
  DRAGON,
  FIGHTING,
  FIRE,
  GRASS,
  LIGHTNING,
  METAL,
  PSYCHIC,
  WATER
}

final typeElementValues = EnumValues({
  "Colorless": TypeElement.COLORLESS,
  "Darkness": TypeElement.DARKNESS,
  "Dragon": TypeElement.DRAGON,
  "Fighting": TypeElement.FIGHTING,
  "Fire": TypeElement.FIRE,
  "Grass": TypeElement.GRASS,
  "Lightning": TypeElement.LIGHTNING,
  "Metal": TypeElement.METAL,
  "Psychic": TypeElement.PSYCHIC,
  "Water": TypeElement.WATER
});

class Cardmarket {
  String url;
  UpdatedAt updatedAt;
  Map<String, double> prices;

  Cardmarket({
    required this.url,
    required this.updatedAt,
    required this.prices,
  });

  factory Cardmarket.fromJson(Map<String, dynamic> json) => Cardmarket(
    url: json["url"],
    updatedAt: updatedAtValues.map[json["updatedAt"]]!,
    prices: Map.from(json["prices"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "updatedAt": updatedAtValues.reverse[updatedAt],
    "prices": Map.from(prices).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

enum UpdatedAt {
  THE_20230327,
  THE_20231120
}

final updatedAtValues = EnumValues({
  "2023/03/27": UpdatedAt.THE_20230327,
  "2023/11/20": UpdatedAt.THE_20231120
});

class Set {
  String id;
  String name;
  Series series;
  int printedTotal;
  int total;
  Legalities legalities;
  String? ptcgoCode;
  String releaseDate;
  String updatedAt;
  SetImages images;

  Set({
    required this.id,
    required this.name,
    required this.series,
    required this.printedTotal,
    required this.total,
    required this.legalities,
    this.ptcgoCode,
    required this.releaseDate,
    required this.updatedAt,
    required this.images,
  });

  factory Set.fromJson(Map<String, dynamic> json) => Set(
    id: json["id"],
    name: json["name"],
    series: seriesValues.map[json["series"]]!,
    printedTotal: json["printedTotal"],
    total: json["total"],
    legalities: Legalities.fromJson(json["legalities"]),
    ptcgoCode: json["ptcgoCode"],
    releaseDate: json["releaseDate"],
    updatedAt: json["updatedAt"],
    images: SetImages.fromJson(json["images"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "series": seriesValues.reverse[series],
    "printedTotal": printedTotal,
    "total": total,
    "legalities": legalities.toJson(),
    "ptcgoCode": ptcgoCode,
    "releaseDate": releaseDate,
    "updatedAt": updatedAt,
    "images": images.toJson(),
  };
}

class SetImages {
  String symbol;
  String logo;

  SetImages({
    required this.symbol,
    required this.logo,
  });

  factory SetImages.fromJson(Map<String, dynamic> json) => SetImages(
    symbol: json["symbol"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "symbol": symbol,
    "logo": logo,
  };
}

class Legalities {
  Unlimited unlimited;
  Unlimited? expanded;

  Legalities({
    required this.unlimited,
    this.expanded,
  });

  factory Legalities.fromJson(Map<String, dynamic> json) => Legalities(
    unlimited: unlimitedValues.map[json["unlimited"]]!,
    expanded: unlimitedValues.map[json["expanded"]]!,
  );

  Map<String, dynamic> toJson() => {
    "unlimited": unlimitedValues.reverse[unlimited],
    "expanded": unlimitedValues.reverse[expanded],
  };
}

enum Unlimited {
  LEGAL
}

final unlimitedValues = EnumValues({
  "Legal": Unlimited.LEGAL
});

enum Series {
  BASE,
  BLACK_WHITE,
  DIAMOND_PEARL,
  EX,
  E_CARD,
  GYM,
  HEART_GOLD_SOUL_SILVER,
  NEO,
  OTHER,
  PLATINUM,
  POP,
  SUN_MOON,
  SWORD_SHIELD,
  XY
}

final seriesValues = EnumValues({
  "Base": Series.BASE,
  "Black & White": Series.BLACK_WHITE,
  "Diamond & Pearl": Series.DIAMOND_PEARL,
  "EX": Series.EX,
  "E-Card": Series.E_CARD,
  "Gym": Series.GYM,
  "HeartGold & SoulSilver": Series.HEART_GOLD_SOUL_SILVER,
  "Neo": Series.NEO,
  "Other": Series.OTHER,
  "Platinum": Series.PLATINUM,
  "POP": Series.POP,
  "Sun & Moon": Series.SUN_MOON,
  "Sword & Shield": Series.SWORD_SHIELD,
  "XY": Series.XY
});

class DatumImages {
  String small;
  String large;

  DatumImages({
    required this.small,
    required this.large,
  });

  factory DatumImages.fromJson(Map<String, dynamic> json) => DatumImages(
    small: json["small"],
    large: json["large"],
  );

  Map<String, dynamic> toJson() => {
    "small": small,
    "large": large,
  };
}

enum Rarity {
  COMMON,
  PROMO,
  RARE,
  RARE_HOLO,
  RARE_HOLO_EX,
  RARE_HOLO_GX,
  RARE_HOLO_V,
  RARE_ULTRA,
  UNCOMMON
}

final rarityValues = EnumValues({
  "Common": Rarity.COMMON,
  "Promo": Rarity.PROMO,
  "Rare": Rarity.RARE,
  "Rare Holo": Rarity.RARE_HOLO,
  "Rare Holo EX": Rarity.RARE_HOLO_EX,
  "Rare Holo GX": Rarity.RARE_HOLO_GX,
  "Rare Holo V": Rarity.RARE_HOLO_V,
  "Rare Ultra": Rarity.RARE_ULTRA,
  "Uncommon": Rarity.UNCOMMON
});

class Resistance {
  TypeElement type;
  String value;

  Resistance({
    required this.type,
    required this.value,
  });

  factory Resistance.fromJson(Map<String, dynamic> json) => Resistance(
    type: typeElementValues.map[json["type"]]!,
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "type": typeElementValues.reverse[type],
    "value": value,
  };
}

enum Subtype {
  BASIC,
  EX,
  GX,
  MEGA,
  RESTORED,
  SP,
  STAGE_1,
  STAGE_2,
  TAG_TEAM,
  TEAM_PLASMA,
  V
}

final subtypeValues = EnumValues({
  "Basic": Subtype.BASIC,
  "EX": Subtype.EX,
  "GX": Subtype.GX,
  "MEGA": Subtype.MEGA,
  "Restored": Subtype.RESTORED,
  "SP": Subtype.SP,
  "Stage 1": Subtype.STAGE_1,
  "Stage 2": Subtype.STAGE_2,
  "TAG TEAM": Subtype.TAG_TEAM,
  "Team Plasma": Subtype.TEAM_PLASMA,
  "V": Subtype.V
});

enum Supertype {
  POKMON
}

final supertypeValues = EnumValues({
  "Pokémon": Supertype.POKMON
});

class Tcgplayer {
  String url;
  UpdatedAt updatedAt;
  Prices? prices;

  Tcgplayer({
    required this.url,
    required this.updatedAt,
    this.prices,
  });

  factory Tcgplayer.fromJson(Map<String, dynamic> json) => Tcgplayer(
    url: json["url"],
    updatedAt: updatedAtValues.map[json["updatedAt"]]!,
    prices: json["prices"] == null ? null : Prices.fromJson(json["prices"]),
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "updatedAt": updatedAtValues.reverse[updatedAt],
    "prices": prices?.toJson(),
  };
}

class Prices {
  The1StEditionHolofoil? holofoil;
  The1StEditionHolofoil? reverseHolofoil;
  The1StEditionHolofoil? normal;
  The1StEditionHolofoil? the1StEditionHolofoil;
  The1StEditionHolofoil? unlimitedHolofoil;

  Prices({
    this.holofoil,
    this.reverseHolofoil,
    this.normal,
    this.the1StEditionHolofoil,
    this.unlimitedHolofoil,
  });

  factory Prices.fromJson(Map<String, dynamic> json) => Prices(
    holofoil: json["holofoil"] == null ? null : The1StEditionHolofoil.fromJson(json["holofoil"]),
    reverseHolofoil: json["reverseHolofoil"] == null ? null : The1StEditionHolofoil.fromJson(json["reverseHolofoil"]),
    normal: json["normal"] == null ? null : The1StEditionHolofoil.fromJson(json["normal"]),
    the1StEditionHolofoil: json["1stEditionHolofoil"] == null ? null : The1StEditionHolofoil.fromJson(json["1stEditionHolofoil"]),
    unlimitedHolofoil: json["unlimitedHolofoil"] == null ? null : The1StEditionHolofoil.fromJson(json["unlimitedHolofoil"]),
  );

  Map<String, dynamic> toJson() => {
    "holofoil": holofoil?.toJson(),
    "reverseHolofoil": reverseHolofoil?.toJson(),
    "normal": normal?.toJson(),
    "1stEditionHolofoil": the1StEditionHolofoil?.toJson(),
    "unlimitedHolofoil": unlimitedHolofoil?.toJson(),
  };
}

class The1StEditionHolofoil {
  double low;
  double mid;
  double high;
  double? market;
  double? directLow;

  The1StEditionHolofoil({
    required this.low,
    required this.mid,
    required this.high,
    required this.market,
    required this.directLow,
  });

  factory The1StEditionHolofoil.fromJson(Map<String, dynamic> json) => The1StEditionHolofoil(
    low: json["low"]?.toDouble(),
    mid: json["mid"]?.toDouble(),
    high: json["high"]?.toDouble(),
    market: json["market"]?.toDouble(),
    directLow: json["directLow"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "low": low,
    "mid": mid,
    "high": high,
    "market": market,
    "directLow": directLow,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}