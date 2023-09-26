class FlightModel {
  String? id;
  String? flyFrom;
  String? flyTo;
  String? cityFrom;
  String? cityCodeFrom;
  String? cityTo;
  String? cityCodeTo;
  CountryModel? countryFrom;
  CountryModel? countryTo;
  String? localDeparture;
  String? utcDeparture;
  String? localArrival;
  String? utcArrival;
  double? quality;
  double? distance;
  DurationModel? duration;
  int? price;
  AvailabilityModel? availability;
  List<String>? airlines;
  List<RouteModel>? route;
  String? bookingToken;
  String? deepLink;
  bool? facilitatedBookingAvailable;
  int? pnrCount;
  bool? hasAirportChange;
  int? technicalStops;
  bool? throwAwayTicketing;
  bool? hiddenCityTicketing;
  bool? virtualInterlining;

  FlightModel({
    this.id,
    this.flyFrom,
    this.flyTo,
    this.cityFrom,
    this.cityCodeFrom,
    this.cityTo,
    this.cityCodeTo,
    this.countryFrom,
    this.countryTo,
    this.localDeparture,
    this.utcDeparture,
    this.localArrival,
    this.utcArrival,
    this.quality,
    this.distance,
    this.duration,
    this.price,
    this.availability,
    this.airlines,
    this.route,
    this.bookingToken,
    this.deepLink,
    this.facilitatedBookingAvailable,
    this.pnrCount,
    this.hasAirportChange,
    this.technicalStops,
    this.throwAwayTicketing,
    this.hiddenCityTicketing,
    this.virtualInterlining,
  });

  factory FlightModel.fromJson(Map<String, dynamic> json) {
    return FlightModel(
      id: json['id'] as String?,
      flyFrom: json['flyFrom'] as String?,
      flyTo: json['flyTo'] as String?,
      cityFrom: json['cityFrom'] as String?,
      cityCodeFrom: json['cityCodeFrom'] as String?,
      cityTo: json['cityTo'] as String?,
      cityCodeTo: json['cityCodeTo'] as String?,
      countryFrom: json['countryFrom'] != null
          ? CountryModel.fromJson(json['countryFrom'])
          : null,
      countryTo: json['countryTo'] != null
          ? CountryModel.fromJson(json['countryTo'])
          : null,
      localDeparture: json['local_departure'] as String?,
      utcDeparture: json['utc_departure'] as String?,
      localArrival: json['local_arrival'] as String?,
      utcArrival: json['utc_arrival'] as String?,
      quality: (json['quality'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      duration: json['duration'] != null
          ? DurationModel.fromJson(json['duration'] as Map<String, dynamic>)
          : null,
      price: json['price'] as int?,
      availability: json['availability'] != null
          ? AvailabilityModel.fromJson(
              json['availability'] as Map<String, dynamic>)
          : null,
      airlines: (json['airlines'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      route: (json['route'] as List<dynamic>?)
          ?.map((e) => RouteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookingToken: json['booking_token'] as String?,
      deepLink: json['deep_link'] as String?,
      facilitatedBookingAvailable:
          json['facilitated_booking_available'] as bool?,
      pnrCount: json['pnr_count'] as int?,
      hasAirportChange: json['has_airport_change'] as bool?,
      technicalStops: json['technical_stops'] as int?,
      throwAwayTicketing: json['throw_away_ticketing'] as bool?,
      hiddenCityTicketing: json['hidden_city_ticketing'] as bool?,
      virtualInterlining: json['virtual_interlining'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['flyFrom'] = flyFrom;
    data['flyTo'] = flyTo;
    data['cityFrom'] = cityFrom;
    data['cityCodeFrom'] = cityCodeFrom;
    data['cityTo'] = cityTo;
    data['cityCodeTo'] = cityCodeTo;
    data['countryFrom'] = countryFrom?.toJson();
    data['countryTo'] = countryTo?.toJson();
    data['localDeparture'] = localDeparture;
    data['utcDeparture'] = utcDeparture;
    data['localArrival'] = localArrival;
    data['utcArrival'] = utcArrival;
    data['quality'] = quality;
    data['distance'] = distance;
    data['duration'] = duration?.toJson();
    data['price'] = price;
    data['availability'] = availability?.toJson();
    data['airlines'] = airlines;
    data['route'] = route?.map((e) => e.toJson()).toList();
    data['bookingToken'] = bookingToken;
    data['deepLink'] = deepLink;
    data['facilitated_booking_available'] = facilitatedBookingAvailable;
    data['pnr_count'] = pnrCount;
    data['has_airport_change'] = hasAirportChange;
    data['technical_stops'] = technicalStops;
    data['throw_away_ticketing'] = throwAwayTicketing;
    data['hidden_city_ticketing'] = hiddenCityTicketing;
    data['virtual_interlining'] = virtualInterlining;
    return data;
  }
}

class DurationModel {
  int? departure;
  int? returnDuration;
  int? total;

  DurationModel({this.departure, this.returnDuration, this.total});

  DurationModel.fromJson(Map<String, dynamic> json) {
    departure = json['departure'];
    returnDuration = json['return'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['departure'] = this.departure;
    data['return'] = this.returnDuration;
    data['total'] = this.total;
    return data;
  }
}

class CountryModel {
  String? code;
  String? name;

  CountryModel({this.code, this.name});

  CountryModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    return data;
  }
}

class AvailabilityModel {
  int? seats;

  AvailabilityModel({this.seats});

  AvailabilityModel.fromJson(Map<String, dynamic> json) {
    seats = json['seats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seats'] = this.seats;
    return data;
  }
}

class RouteModel {
  String? id;
  String? combinationId;
  String? flyFrom;
  String? flyTo;
  String? cityFrom;
  String? cityCodeFrom;
  String? cityTo;
  String? cityCodeTo;
  String? localDeparture;
  String? utcDeparture;
  String? localArrival;
  String? utcArrival;
  String? airline;
  int? flightNo;
  String? operatingCarrier;
  String? operatingFlightNo;
  String? fareBasis;
  String? fareCategory;
  String? fareClasses;
  String? fareFamily;
  bool? bagsRecheckRequired;
  bool? viConnection;
  bool? guarantee;
  Null equipment;
  String? vehicleType;

  RouteModel(
      {this.id,
      this.combinationId,
      this.flyFrom,
      this.flyTo,
      this.cityFrom,
      this.cityCodeFrom,
      this.cityTo,
      this.cityCodeTo,
      this.localDeparture,
      this.utcDeparture,
      this.localArrival,
      this.utcArrival,
      this.airline,
      this.flightNo,
      this.operatingCarrier,
      this.operatingFlightNo,
      this.fareBasis,
      this.fareCategory,
      this.fareClasses,
      this.fareFamily,
      this.bagsRecheckRequired,
      this.viConnection,
      this.guarantee,
      this.equipment,
      this.vehicleType});

  RouteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    combinationId = json['combination_id'];
    flyFrom = json['flyFrom'];
    flyTo = json['flyTo'];
    cityFrom = json['cityFrom'];
    cityCodeFrom = json['cityCodeFrom'];
    cityTo = json['cityTo'];
    cityCodeTo = json['cityCodeTo'];
    localDeparture = json['local_departure'];
    utcDeparture = json['utc_departure'];
    localArrival = json['local_arrival'];
    utcArrival = json['utc_arrival'];
    airline = json['airline'];
    flightNo = json['flight_no'];
    operatingCarrier = json['operating_carrier'];
    operatingFlightNo = json['operating_flight_no'];
    fareBasis = json['fare_basis'];
    fareCategory = json['fare_category'];
    fareClasses = json['fare_classes'];
    fareFamily = json['fare_family'];
    bagsRecheckRequired = json['bags_recheck_required'];
    viConnection = json['vi_connection'];
    guarantee = json['guarantee'];
    equipment = json['equipment'];
    vehicleType = json['vehicle_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['combination_id'] = this.combinationId;
    data['flyFrom'] = this.flyFrom;
    data['flyTo'] = this.flyTo;
    data['cityFrom'] = this.cityFrom;
    data['cityCodeFrom'] = this.cityCodeFrom;
    data['cityTo'] = this.cityTo;
    data['cityCodeTo'] = this.cityCodeTo;
    data['local_departure'] = this.localDeparture;
    data['utc_departure'] = this.utcDeparture;
    data['local_arrival'] = this.localArrival;
    data['utc_arrival'] = this.utcArrival;
    data['airline'] = this.airline;
    data['flight_no'] = this.flightNo;
    data['operating_carrier'] = this.operatingCarrier;
    data['operating_flight_no'] = this.operatingFlightNo;
    data['fare_basis'] = this.fareBasis;
    data['fare_category'] = this.fareCategory;
    data['fare_classes'] = this.fareClasses;
    data['fare_family'] = this.fareFamily;
    data['bags_recheck_required'] = this.bagsRecheckRequired;
    data['vi_connection'] = this.viConnection;
    data['guarantee'] = this.guarantee;
    data['equipment'] = this.equipment;
    data['vehicle_type'] = this.vehicleType;
    return data;
  }
}
