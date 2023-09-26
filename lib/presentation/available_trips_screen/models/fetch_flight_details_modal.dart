class AvailResult {
  String? sessionToken;
  String? status;
  String? action;
  Map<String, dynamic>? itineraries;
  Map<String, dynamic>? legs;
  Map<String, dynamic>? places;
  Map<String, dynamic>? segments;
  Map<String, dynamic>? carries;

  AvailResult({this.sessionToken, this.status, this.action, this.itineraries});

  AvailResult.fromJson(Map<String, dynamic> json) {
    sessionToken = json['sessionToken'] as String?;
    status = json['status'] as String?;
    action = json['action'] as String?;
    itineraries =
        json['content']["results"]["itineraries"] as Map<String, dynamic>?;
    places = json['content']["results"]["places"] as Map<String, dynamic>?;
    legs = json['content']["results"]["legs"] as Map<String, dynamic>?;
    segments = json['content']["results"]["segments"] as Map<String, dynamic>?;
    carries = json['content']["results"]["carriers"] as Map<String, dynamic>?;
  }
}

class ItinerariesKey {
  List<PricingOptions>? pricingOptions;
  List<String>? legIds;
  dynamic sustainabilityData;

  ItinerariesKey({
    this.pricingOptions,
    this.legIds,
    this.sustainabilityData,
  });

  ItinerariesKey.fromJson(Map<String, dynamic> json) {
    pricingOptions = (json['pricingOptions'] as List?)
        ?.map((dynamic e) => PricingOptions.fromJson(e as Map<String, dynamic>))
        .toList();
    legIds =
        (json['legIds'] as List?)?.map((dynamic e) => e as String).toList();
    sustainabilityData = json['sustainabilityData'];
  }
}

class PricingOptions {
  Price? price;
  List<String>? agentIds;
  List<Items>? items;
  String? transferType;
  String? id;

  PricingOptions({
    this.price,
    this.agentIds,
    this.items,
    this.transferType,
    this.id,
  });

  PricingOptions.fromJson(Map<String, dynamic> json) {
    price = (json['price'] as Map<String, dynamic>?) != null
        ? Price.fromJson(json['price'] as Map<String, dynamic>)
        : null;
    agentIds =
        (json['agentIds'] as List?)?.map((dynamic e) => e as String).toList();
    items = (json['items'] as List?)
        ?.map((dynamic e) => Items.fromJson(e as Map<String, dynamic>))
        .toList();
    transferType = json['transferType'] as String?;
    id = json['id'] as String?;
  }
}

class Price {
  String? amount;
  String? unit;
  String? updateStatus;

  Price({
    this.amount,
    this.unit,
    this.updateStatus,
  });

  Price.fromJson(Map<String, dynamic> json) {
    amount = json['amount'] as String?;
    unit = json['unit'] as String?;
    updateStatus = json['updateStatus'] as String?;
  }
}

class Items {
  Price? price;
  String? agentId;
  String? deepLink;
  List<Fares>? fares;

  Items({
    this.price,
    this.agentId,
    this.deepLink,
    this.fares,
  });

  Items.fromJson(Map<String, dynamic> json) {
    price = (json['price'] as Map<String, dynamic>?) != null
        ? Price.fromJson(json['price'] as Map<String, dynamic>)
        : null;
    agentId = json['agentId'] as String?;
    deepLink = json['deepLink'] as String?;
    fares = (json['fares'] as List?)
        ?.map((dynamic e) => Fares.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

class Fares {
  String? segmentId;
  String? bookingCode;
  String? fareBasisCode;

  Fares({
    this.segmentId,
    this.bookingCode,
    this.fareBasisCode,
  });

  Fares.fromJson(Map<String, dynamic> json) {
    segmentId = json['segmentId'] as String?;
    bookingCode = json['bookingCode'] as String?;
    fareBasisCode = json['fareBasisCode'] as String?;
  }
}

class DepartureDateTime {
  DepartureDateTime({
    required this.year,
    required this.month,
    required this.day,
    required this.hour,
    required this.minute,
    required this.second,
  });
  late final int year;
  late final int month;
  late final int day;
  late final int hour;
  late final int minute;
  late final int second;

  DepartureDateTime.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    day = json['day'];
    hour = json['hour'];
    minute = json['minute'];
    second = json['second'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['year'] = year;
    _data['month'] = month;
    _data['day'] = day;
    _data['hour'] = hour;
    _data['minute'] = minute;
    _data['second'] = second;
    return _data;
  }
}

class Places {
  Places({
    required this.placeDetails,
  });
  late final placeDetails;

  Places.fromJson(Map<String, dynamic> json) {
    placeDetails = placeDetails.fromJson(json['placeDetails']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['placeDetails'] = placeDetails.toJson();

    return _data;
  }
}

// ignore: camel_case_types
class placeDetails {
  placeDetails({
    required this.entityId,
    required this.parentId,
    required this.name,
    required this.type,
    required this.iata,
    this.coordinates,
  });
  late final String entityId;
  late final String parentId;
  late final String name;
  late final String type;
  late final String iata;
  late final Null coordinates;

  placeDetails.fromJson(Map<String, dynamic> json) {
    entityId = json['entityId'];
    parentId = json['parentId'];
    name = json['name'];
    type = json['type'];
    iata = json['iata'];
    coordinates = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['entityId'] = entityId;
    _data['parentId'] = parentId;
    _data['name'] = name;
    _data['type'] = type;
    _data['iata'] = iata;
    _data['coordinates'] = coordinates;
    return _data;
  }
}

// ignore: camel_case_types
class carrierDetails {
  carrierDetails({
    required this.name,
    required this.allianceId,
    required this.imageUrl,
    required this.iata,
  });
  late final String name;
  late final String allianceId;
  late final String imageUrl;
  late final String iata;

  carrierDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    allianceId = json['allianceId'];
    imageUrl = json['imageUrl'];
    iata = json['iata'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['allianceId'] = allianceId;
    _data['imageUrl'] = imageUrl;
    _data['iata'] = iata;
    return _data;
  }
}
