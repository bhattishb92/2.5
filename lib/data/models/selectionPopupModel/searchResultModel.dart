import 'dart:convert';

class FightSearch {
  int? entityID;
  String? type;
  String? countryName;
  String? cityName;
  // String? location;
  String? hierarchy;
  String? iataCode;
  Map? airportInformation;
  FightSearch({
    this.entityID,
    this.type,
    this.countryName,
    this.cityName,
    // this.location,
    this.hierarchy,
    this.iataCode,
    this.airportInformation,
  });

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'entityID': entityID,
      'type': type,
      'countryName': countryName,
      'cityName': cityName,
      // 'location': location,
      'hierarchy': hierarchy,
      'iataCode': iataCode,
      'airportInformation': airportInformation,
    };
  }

  factory FightSearch.fromMap(Map<dynamic, dynamic> map) {
    return FightSearch(
      entityID: map['int_id'] as int?,
      type: map['type'] as String?,
      countryName: map['city']['country']['name'] as String?,
      cityName: map['city']['name'] as String?,
      hierarchy: map['hierarchy'].toString(),
      iataCode: map['code'] as String?,
      airportInformation: map,
    );
  }

  String toJson() => json.encode(toMap());

  factory FightSearch.fromJson(String source) =>
      FightSearch.fromMap(json.decode(source) as Map<dynamic, dynamic>);
}

// class AirPortInformation {
//   int? entityID;
//   String? type;
//   String? countryName;
//   String? cityName;
//   String? location;
//   String? hierarchy;
//   String? iataCode;
//   AirPortInformation({
//     this.entityID,
//     this.type,
//     this.countryName,
//     this.cityName,
//     this.location,
//     this.hierarchy,
//     this.iataCode,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'entityID': entityID,
//       'type': type,
//       'countryName': countryName,
//       'cityName': cityName,
//       'location': location,
//       'hierarchy': hierarchy,
//       'iataCode': iataCode,
//     };
//   }

//   factory AirPortInformation.fromMap(Map<String, dynamic> map) {
//     return AirPortInformation(
//       entityID: map['entityID'] != null ? map['entityID'] as int : null,
//       type: map['type'] != null ? map['type'] as String : null,
//       countryName:
//           map['countryName'] != null ? map['countryName'] as String : null,
//       cityName: map['cityName'] != null ? map['cityName'] as String : null,
//       location: map['location'] != null ? map['location'] as String : null,
//       hierarchy: map['hierarchy'] != null ? map['hierarchy'] as String : null,
//       iataCode: map['iataCode'] != null ? map['iataCode'] as String : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory AirPortInformation.fromJson(String source) =>
//       AirPortInformation.fromMap(json.decode(source) as Map<String, dynamic>);
// }

enum FlightResultType { PLACE_TYPE_CITY, PLACE_TYPE_AIRPORT }

// class FightSearch {
//   String? id;
//   int? intId;
//   int? airportIntId;
//   bool? active;
//   String? code;
//   String? icao;
//   String? name;
//   String? slug;
//   String? slugEn;
//   List<String>? alternativeNames;
//   int? rank;
//   int? globalRankDst;
//   double? dstPopularityScore;
//   String? timezone;
//   City? city;
//   Location? location;
//   List<AlternativeDeparturePoints>? alternativeDeparturePoints;
//   List<Tags>? tags;
//   List<int>? providers;
//   List<CarRentals>? carRentals;
//   bool? newGround;
//   int? routingPriority;
//   String? type;

//   FightSearch(
//       {this.id,
//       this.intId,
//       this.airportIntId,
//       this.active,
//       this.code,
//       this.icao,
//       this.name,
//       this.slug,
//       this.slugEn,
//       this.alternativeNames,
//       this.rank,
//       this.globalRankDst,
//       this.dstPopularityScore,
//       this.timezone,
//       this.city,
//       this.location,
//       this.alternativeDeparturePoints,
//       this.tags,
//       this.providers,
//       this.carRentals,
//       this.newGround,
//       this.routingPriority,
//       this.type});

//   FightSearch.fromJson(json) {
//     id = json['id'];
//     intId = json['int_id'];
//     airportIntId = json['airport_int_id'];
//     active = json['active'];
//     code = json['code'];
//     icao = json['icao'];
//     name = json['name'];
//     slug = json['slug'];
//     slugEn = json['slug_en'];
//     alternativeNames = json['alternative_names'].cast<String>();
//     rank = json['rank'];
//     globalRankDst = json['global_rank_dst'];
//     dstPopularityScore = json['dst_popularity_score'];
//     timezone = json['timezone'];
//     city = json['city'] != null ? new City.fromJson(json['city']) : null;
//     location = json['location'] != null
//         ? new Location.fromJson(json['location'])
//         : null;
//     if (json['alternative_departure_points'] != null) {
//       alternativeDeparturePoints = <AlternativeDeparturePoints>[];
//       json['alternative_departure_points'].forEach((v) {
//         alternativeDeparturePoints!
//             .add(new AlternativeDeparturePoints.fromJson(v));
//       });
//     }
//     if (json['tags'] != null) {
//       tags = <Tags>[];
//       json['tags'].forEach((v) {
//         tags!.add(new Tags.fromJson(v));
//       });
//     }
//     providers = json['providers'].cast<int>();

//     if (json['car_rentals'] != null) {
//       carRentals = <CarRentals>[];
//       json['car_rentals'].forEach((v) {
//         carRentals!.add(new CarRentals.fromJson(v));
//       });
//     }
//     newGround = json['new_ground'];
//     routingPriority = json['routing_priority'];
//     type = json['type'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['int_id'] = this.intId;
//     data['airport_int_id'] = this.airportIntId;
//     data['active'] = this.active;
//     data['code'] = this.code;
//     data['icao'] = this.icao;
//     data['name'] = this.name;
//     data['slug'] = this.slug;
//     data['slug_en'] = this.slugEn;
//     data['alternative_names'] = this.alternativeNames;
//     data['rank'] = this.rank;
//     data['global_rank_dst'] = this.globalRankDst;
//     data['dst_popularity_score'] = this.dstPopularityScore;
//     data['timezone'] = this.timezone;
//     if (this.city != null) {
//       data['city'] = this.city!.toJson();
//     }
//     if (this.location != null) {
//       data['location'] = this.location!.toJson();
//     }
//     if (this.alternativeDeparturePoints != null) {
//       data['alternative_departure_points'] =
//           this.alternativeDeparturePoints!.map((v) => v.toJson()).toList();
//     }
//     if (this.tags != null) {
//       data['tags'] = this.tags!.map((v) => v.toJson()).toList();
//     }
//     data['providers'] = this.providers;

//     if (this.carRentals != null) {
//       data['car_rentals'] = this.carRentals!.map((v) => v.toJson()).toList();
//     }
//     data['new_ground'] = this.newGround;
//     data['routing_priority'] = this.routingPriority;
//     data['type'] = this.type;
//     return data;
//   }
// }

// class City {
//   String? id;
//   String? name;
//   String? code;
//   Null nearbyCountry;
//   String? slug;
//   Country? subdivision;
//   String? autonomousTerritory;
//   Country? country;
//   Country? continent;
//   Region? region;

//   City(
//       {this.id,
//       this.name,
//       this.code,
//       this.nearbyCountry,
//       this.slug,
//       this.subdivision,
//       this.autonomousTerritory,
//       this.country,
//       this.region,
//       this.continent});

//   City.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     code = json['code'];
//     nearbyCountry = json['nearby_country'];
//     slug = json['slug'];
//     subdivision = json['subdivision'] != null
//         ? new Country.fromJson(json['subdivision'])
//         : null;
//     autonomousTerritory = json['autonomous_territory'];
//     country =
//         json['country'] != null ? new Country.fromJson(json['country']) : null;
//     region =
//         json['region'] != null ? new Region.fromJson(json['region']) : null;
//     continent = json['continent'] != null
//         ? new Country.fromJson(json['continent'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['code'] = this.code;
//     data['nearby_country'] = this.nearbyCountry;
//     data['slug'] = this.slug;
//     if (this.subdivision != null) {
//       data['subdivision'] = this.subdivision!.toJson();
//     }
//     data['autonomous_territory'] = this.autonomousTerritory;
//     if (this.country != null) {
//       data['country'] = this.country!.toJson();
//     }
//     if (this.region != null) {
//       data['region'] = this.region!.toJson();
//     }
//     if (this.continent != null) {
//       data['continent'] = this.continent!.toJson();
//     }
//     return data;
//   }
// }

// class Country {
//   String? id;
//   String? name;
//   String? slug;
//   String? code;

//   Country({this.id, this.name, this.slug, this.code});

//   Country.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     slug = json['slug'];
//     code = json['code'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['slug'] = this.slug;
//     data['code'] = this.code;
//     return data;
//   }
// }

// class Continent {
//   String? id;
//   String? name;
//   String? slug;
//   String? code;

//   Continent({this.id, this.name, this.slug, this.code});

//   Continent.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     slug = json['slug'];
//     code = json['code'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['slug'] = this.slug;
//     data['code'] = this.code;
//     return data;
//   }
// }

// class Region {
//   String? id;
//   String? name;
//   String? slug;

//   Region({this.id, this.name, this.slug});

//   Region.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     slug = json['slug'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['slug'] = this.slug;
//     return data;
//   }
// }

// class Location {
//   double? lon;
//   double? lat;

//   Location({this.lon, this.lat});

//   Location.fromJson(Map<String, dynamic> json) {
//     lon = json['lon'];
//     lat = json['lat'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['lon'] = this.lon;
//     data['lat'] = this.lat;
//     return data;
//   }
// }

// class AlternativeDeparturePoints {
//   String? id;
//   double? distance;
//   double? duration;

//   AlternativeDeparturePoints({this.id, this.distance, this.duration});

//   AlternativeDeparturePoints.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     distance = double.parse(json['distance'].toString());
//     duration = double.parse(json['duration'].toString());
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['distance'] = this.distance;
//     data['duration'] = this.duration;
//     return data;
//   }
// }

// class Tags {
//   String? tag;
//   int? monthTo;
//   int? monthFrom;

//   Tags({this.tag, this.monthTo, this.monthFrom});

//   Tags.fromJson(Map<String, dynamic> json) {
//     tag = json['tag'];
//     monthTo = json['month_to'];
//     monthFrom = json['month_from'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['tag'] = this.tag;
//     data['month_to'] = this.monthTo;
//     data['month_from'] = this.monthFrom;
//     return data;
//   }
// }

// class CarRentals {
//   int? providerId;
//   List<String>? providersLocations;

//   CarRentals({this.providerId, this.providersLocations});

//   CarRentals.fromJson(Map<String, dynamic> json) {
//     providerId = json['provider_id'];
//     providersLocations = json['providers_locations'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['provider_id'] = this.providerId;
//     data['providers_locations'] = this.providersLocations;
//     return data;
//   }
// }
