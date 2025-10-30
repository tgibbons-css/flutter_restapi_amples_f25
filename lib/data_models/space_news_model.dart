// To parse this JSON data, do
//
//     final spaceNews = spaceNewsFromJson(jsonString);

import 'dart:convert';

SpaceNews spaceNewsFromJson(String str) => SpaceNews.fromJson(json.decode(str));

String spaceNewsToJson(SpaceNews data) => json.encode(data.toJson());

class SpaceNews {
  int count;
  String next;
  dynamic previous;
  List<Result> results;

  SpaceNews({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory SpaceNews.fromJson(Map<String, dynamic> json) => SpaceNews(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  int id;
  String title;
  List<Author> authors;
  String url;
  String imageUrl;
  String newsSite;
  String summary;
  DateTime publishedAt;
  DateTime updatedAt;
  bool featured;
  List<dynamic> launches;
  List<dynamic> events;

  Result({
    required this.id,
    required this.title,
    required this.authors,
    required this.url,
    required this.imageUrl,
    required this.newsSite,
    required this.summary,
    required this.publishedAt,
    required this.updatedAt,
    required this.featured,
    required this.launches,
    required this.events,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    title: json["title"],
    authors: List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
    url: json["url"],
    imageUrl: json["image_url"],
    newsSite: json["news_site"],
    summary: json["summary"],
    publishedAt: DateTime.parse(json["published_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    featured: json["featured"],
    launches: List<dynamic>.from(json["launches"].map((x) => x)),
    events: List<dynamic>.from(json["events"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
    "url": url,
    "image_url": imageUrl,
    "news_site": newsSite,
    "summary": summary,
    "published_at": publishedAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "featured": featured,
    "launches": List<dynamic>.from(launches.map((x) => x)),
    "events": List<dynamic>.from(events.map((x) => x)),
  };
}

class Author {
  String name;
  Socials? socials;

  Author({
    required this.name,
    required this.socials,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    name: json["name"],
    socials: json["socials"] == null ? null : Socials.fromJson(json["socials"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "socials": socials?.toJson(),
  };
}

class Socials {
  String x;
  String youtube;
  String instagram;
  String linkedin;
  String mastodon;
  String bluesky;

  Socials({
    required this.x,
    required this.youtube,
    required this.instagram,
    required this.linkedin,
    required this.mastodon,
    required this.bluesky,
  });

  factory Socials.fromJson(Map<String, dynamic> json) => Socials(
    x: json["x"],
    youtube: json["youtube"],
    instagram: json["instagram"],
    linkedin: json["linkedin"],
    mastodon: json["mastodon"],
    bluesky: json["bluesky"],
  );

  Map<String, dynamic> toJson() => {
    "x": x,
    "youtube": youtube,
    "instagram": instagram,
    "linkedin": linkedin,
    "mastodon": mastodon,
    "bluesky": bluesky,
  };
}
