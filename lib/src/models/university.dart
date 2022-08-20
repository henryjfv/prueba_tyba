import 'dart:convert';

List<University> universityFromJson(String str) =>
    List<University>.from(json.decode(str).map((x) => University.fromJson(x)));

String universityToJson(List<University> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class University {
  final String? alphaTwoCode;
  final List<String>? domains;
  final String? country;
  final String? stateProvince;
  final List<String>? webPages;
  final String? name;

  University({
    this.alphaTwoCode,
    this.domains,
    this.country,
    this.stateProvince,
    this.webPages,
    this.name,
  });

  factory University.fromJson(Map<String, dynamic> json) => University(
        alphaTwoCode: json["alpha_two_code"],
        domains: List<String>.from(json["domains"].map((x) => x)),
        country: json["country"],
        stateProvince: json["state-province"] ?? json["state-province"],
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "alpha_two_code": alphaTwoCodeValues.reverse[alphaTwoCode],
        "domains": List<dynamic>.from(domains!.map((x) => x)),
        "country": countryValues.reverse[country],
        "state-province": stateProvince ?? stateProvince,
        "web_pages": List<dynamic>.from(webPages!.map((x) => x)),
        "name": name,
      };
}

enum AlphaTwoCode { US }

final alphaTwoCodeValues = EnumValues({"US": AlphaTwoCode.US});

enum Country { UNITED_STATES }

final countryValues = EnumValues({"United States": Country.UNITED_STATES});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap = <T, String>{};

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
