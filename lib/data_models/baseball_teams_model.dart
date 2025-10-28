// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Baseball_Teams mblTeamsFromJson(String str) => Baseball_Teams.fromJson(json.decode(str));

String mlbTeamsToJson(Baseball_Teams data) => json.encode(data.toJson());

class Baseball_Teams {
  String copyright;
  List<Team> teams;

  Baseball_Teams ({
    required this.copyright,
    required this.teams,
  });

  factory Baseball_Teams .fromJson(Map<String, dynamic> json) => Baseball_Teams (
    copyright: json["copyright"],
    teams: List<Team>.from(json["teams"].map((x) => Team.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "copyright": copyright,
    "teams": List<dynamic>.from(teams.map((x) => x.toJson())),
  };
}

class Team {
  AllStarStatus allStarStatus;
  int id;
  String name;
  String link;
  int season;
  League venue;
  String teamCode;
  String? fileCode;
  String abbreviation;
  String teamName;
  String? locationName;
  String? firstYearOfPlay;
  League league;
  League sport;
  String shortName;
  String? parentOrgName;
  int? parentOrgId;
  String? franchiseName;
  String? clubName;
  bool active;
  League? division;
  League? springLeague;
  SpringVenue? springVenue;

  Team({
    required this.allStarStatus,
    required this.id,
    required this.name,
    required this.link,
    required this.season,
    required this.venue,
    required this.teamCode,
    this.fileCode,
    required this.abbreviation,
    required this.teamName,
    this.locationName,
    this.firstYearOfPlay,
    required this.league,
    required this.sport,
    required this.shortName,
    this.parentOrgName,
    this.parentOrgId,
    this.franchiseName,
    this.clubName,
    required this.active,
    this.division,
    this.springLeague,
    this.springVenue,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    allStarStatus: allStarStatusValues.map[json["allStarStatus"]]!,
    id: json["id"],
    name: json["name"],
    link: json["link"],
    season: json["season"],
    venue: League.fromJson(json["venue"]),
    teamCode: json["teamCode"],
    fileCode: json["fileCode"],
    abbreviation: json["abbreviation"],
    teamName: json["teamName"],
    locationName: json["locationName"],
    firstYearOfPlay: json["firstYearOfPlay"],
    league: League.fromJson(json["league"]),
    sport: League.fromJson(json["sport"]),
    shortName: json["shortName"],
    parentOrgName: json["parentOrgName"],
    parentOrgId: json["parentOrgId"],
    franchiseName: json["franchiseName"],
    clubName: json["clubName"],
    active: json["active"],
    division: json["division"] == null ? null : League.fromJson(json["division"]),
    springLeague: json["springLeague"] == null ? null : League.fromJson(json["springLeague"]),
    springVenue: json["springVenue"] == null ? null : SpringVenue.fromJson(json["springVenue"]),
  );

  Map<String, dynamic> toJson() => {
    "allStarStatus": allStarStatusValues.reverse[allStarStatus],
    "id": id,
    "name": name,
    "link": link,
    "season": season,
    "venue": venue.toJson(),
    "teamCode": teamCode,
    "fileCode": fileCode,
    "abbreviation": abbreviation,
    "teamName": teamName,
    "locationName": locationName,
    "firstYearOfPlay": firstYearOfPlay,
    "league": league.toJson(),
    "sport": sport.toJson(),
    "shortName": shortName,
    "parentOrgName": parentOrgName,
    "parentOrgId": parentOrgId,
    "franchiseName": franchiseName,
    "clubName": clubName,
    "active": active,
    "division": division?.toJson(),
    "springLeague": springLeague?.toJson(),
    "springVenue": springVenue?.toJson(),
  };
}

enum AllStarStatus {
  N
}

final allStarStatusValues = EnumValues({
  "N": AllStarStatus.N
});

class League {
  int? id;
  String? name;
  String link;
  Abbreviation? abbreviation;

  League({
    this.id,
    this.name,
    required this.link,
    this.abbreviation,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
    id: json["id"],
    name: json["name"],
    link: json["link"],
    abbreviation: abbreviationValues.map[json["abbreviation"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "link": link,
    "abbreviation": abbreviationValues.reverse[abbreviation],
  };
}

enum Abbreviation {
  CL,
  GL
}

final abbreviationValues = EnumValues({
  "CL": Abbreviation.CL,
  "GL": Abbreviation.GL
});

class SpringVenue {
  int id;
  String link;

  SpringVenue({
    required this.id,
    required this.link,
  });

  factory SpringVenue.fromJson(Map<String, dynamic> json) => SpringVenue(
    id: json["id"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "link": link,
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
