// To parse this JSON data, do
//
//     final dogFact = dogFactFromJson(jsonString);

import 'dart:convert';

DogFact dogFactFromJson(String str) => DogFact.fromJson(json.decode(str));

String dogFactToJson(DogFact data) => json.encode(data.toJson());

class DogFact {
  List<String> facts;
  bool success;

  DogFact({
    required this.facts,
    required this.success,
  });

  factory DogFact.fromJson(Map<String, dynamic> json) => DogFact(
    facts: List<String>.from(json["facts"].map((x) => x)),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "facts": List<dynamic>.from(facts.map((x) => x)),
    "success": success,
  };
}
