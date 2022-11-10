import 'dart:convert';

import 'package:flutter/foundation.dart';

class Country {
  String? name;
  bool? independence;
  bool? unMember;
  String? currency;
  String? dialCode;
  List<String>? capital;
  String? region;
  double? area;
  String? map;
  int? population;
  int? gini;
  String? drivingSide;
  List<String>? timezone;
  String? flags;
  String? coatOfArms;
  Country({
    this.name,
    this.independence,
    this.unMember,
    this.currency,
    this.dialCode,
    this.capital,
    this.region,
    this.area,
    this.map,
    this.population,
    this.gini,
    this.drivingSide,
    this.timezone,
    this.flags,
    this.coatOfArms,
  });

  Country copyWith({
    String? name,
    bool? independence,
    bool? unMember,
    String? currency,
    String? dialCode,
    List<String>? capital,
    String? region,
    double? area,
    String? map,
    int? population,
    int? gini,
    String? drivingSide,
    List<String>? timezone,
    String? flags,
    String? coatOfArms,
  }) {
    return Country(
      name: name ?? this.name,
      independence: independence ?? this.independence,
      unMember: unMember ?? this.unMember,
      currency: currency ?? this.currency,
      dialCode: dialCode ?? this.dialCode,
      capital: capital ?? this.capital,
      region: region ?? this.region,
      area: area ?? this.area,
      map: map ?? this.map,
      population: population ?? this.population,
      gini: gini ?? this.gini,
      drivingSide: drivingSide ?? this.drivingSide,
      timezone: timezone ?? this.timezone,
      flags: flags ?? this.flags,
      coatOfArms: coatOfArms ?? this.coatOfArms,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'independence': independence,
      'unMember': unMember,
      'currency': currency,
      'dialCode': dialCode,
      'capital': capital,
      'region': region,
      'area': area,
      'map': map,
      'population': population,
      'gini': gini,
      'drivingSide': drivingSide,
      'timezone': timezone,
      'flags': flags,
      'coatOfArms': coatOfArms,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      name: map['name']['common'],
      independence: map['independent'],
      unMember: map['unMember'],
      currency: map['currencies']['MRU']['name'],
      dialCode: map['idd']['root'],
      capital: List<String>.from(map['capital']),
      region: map['region'],
      area: map['area']?.toDouble(),
      map: map['maps']['googleMaps'],
      population: map['population']?.toInt(),
      gini: map['gini']?.toInt(),
      drivingSide: map['car']['side'],
      timezone: map['timezones'],
      flags: map['flags']['svg'],
      coatOfArms: map['coatOfArms']['svg'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Country(name: $name, independence: $independence, unMember: $unMember, currency: $currency, dialCode: $dialCode, capital: $capital, region: $region, area: $area, map: $map, population: $population, gini: $gini, drivingSide: $drivingSide, timezone: $timezone, flags: $flags, coatOfArms: $coatOfArms)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Country &&
        other.name == name &&
        other.independence == independence &&
        other.unMember == unMember &&
        other.currency == currency &&
        other.dialCode == dialCode &&
        listEquals(other.capital, capital) &&
        other.region == region &&
        other.area == area &&
        other.map == map &&
        other.population == population &&
        other.gini == gini &&
        other.drivingSide == drivingSide &&
        listEquals(other.timezone, timezone) &&
        other.flags == flags &&
        other.coatOfArms == coatOfArms;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        independence.hashCode ^
        unMember.hashCode ^
        currency.hashCode ^
        dialCode.hashCode ^
        capital.hashCode ^
        region.hashCode ^
        area.hashCode ^
        map.hashCode ^
        population.hashCode ^
        gini.hashCode ^
        drivingSide.hashCode ^
        timezone.hashCode ^
        flags.hashCode ^
        coatOfArms.hashCode;
  }
}
