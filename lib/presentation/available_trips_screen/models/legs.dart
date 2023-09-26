import 'package:mytravelapp/presentation/available_trips_screen/models/carriers.dart';
import 'package:mytravelapp/presentation/available_trips_screen/models/place.dart';
import 'package:mytravelapp/presentation/available_trips_screen/models/segments.dart';

class Legs {
  String? id;
  Place? origin;
  Place? destination;
  int? durationInMinutes;
  int? stopCount;
  bool? isSmallestStops;
  String? departure;
  String? arrival;
  int? timeDeltaInDays;
  Carriers? carriers;
  List<Segments>? segments;

  Legs(
      {this.id,
      this.origin,
      this.destination,
      this.durationInMinutes,
      this.stopCount,
      this.isSmallestStops,
      this.departure,
      this.arrival,
      this.timeDeltaInDays,
      this.carriers,
      this.segments});

  Legs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    origin = json['origin'] != null ? new Place.fromJson(json['origin']) : null;
    destination = json['destination'] != null
        ? new Place.fromJson(json['destination'])
        : null;
    durationInMinutes = json['durationInMinutes'];
    stopCount = json['stopCount'];
    isSmallestStops = json['isSmallestStops'];
    departure = json['departure'];
    arrival = json['arrival'];
    timeDeltaInDays = json['timeDeltaInDays'];
    carriers = json['carriers'] != null
        ? new Carriers.fromJson(json['carriers'])
        : null;
    if (json['segments'] != null) {
      segments = <Segments>[];
      json['segments'].forEach((v) {
        segments!.add(new Segments.fromJson(v));
      });
    }
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
    data['durationInMinutes'] = this.durationInMinutes;
    data['stopCount'] = this.stopCount;
    data['isSmallestStops'] = this.isSmallestStops;
    data['departure'] = this.departure;
    data['arrival'] = this.arrival;
    data['timeDeltaInDays'] = this.timeDeltaInDays;
    if (this.carriers != null) {
      data['carriers'] = this.carriers!.toJson();
    }
    if (this.segments != null) {
      data['segments'] = this.segments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
