import 'package:mytravelapp/presentation/available_trips_screen/models/detail_place.dart';
import 'package:mytravelapp/presentation/available_trips_screen/models/marketing_carrier.dart';

class Segments {
  String? id;
  DetailPlace? origin;
  DetailPlace? destination;
  String? departure;
  String? arrival;
  int? durationInMinutes;
  String? flightNumber;
  MarketingCarrier? marketingCarrier;
  MarketingCarrier? operatingCarrier;

  Segments(
      {this.id,
      this.origin,
      this.destination,
      this.departure,
      this.arrival,
      this.durationInMinutes,
      this.flightNumber,
      this.marketingCarrier,
      this.operatingCarrier});

  Segments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    origin = json['origin'] != null
        ? new DetailPlace.fromJson(json['origin'])
        : null;
    destination = json['destination'] != null
        ? new DetailPlace.fromJson(json['destination'])
        : null;
    departure = json['departure'];
    arrival = json['arrival'];
    durationInMinutes = json['durationInMinutes'];
    flightNumber = json['flightNumber'];
    marketingCarrier = json['marketingCarrier'] != null
        ? new MarketingCarrier.fromJson(json['marketingCarrier'])
        : null;
    operatingCarrier = json['operatingCarrier'] != null
        ? new MarketingCarrier.fromJson(json['operatingCarrier'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.origin != null) {
      data['origin'] = this.origin!.toJson();
    }
    if (this.destination != null) {
      data['destination'] = this.destination!.toJson();
    }
    data['departure'] = this.departure;
    data['arrival'] = this.arrival;
    data['durationInMinutes'] = this.durationInMinutes;
    data['flightNumber'] = this.flightNumber;
    if (this.marketingCarrier != null) {
      data['marketingCarrier'] = this.marketingCarrier!.toJson();
    }
    if (this.operatingCarrier != null) {
      data['operatingCarrier'] = this.operatingCarrier!.toJson();
    }
    return data;
  }
}
