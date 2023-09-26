import 'package:mytravelapp/presentation/available_trips_screen/models/marketing.dart';

class Carriers {
  List<Marketing>? marketing;
  String? operationType;

  Carriers({this.marketing, this.operationType});

  Carriers.fromJson(Map<String, dynamic> json) {
    if (json['marketing'] != null) {
      marketing = <Marketing>[];
      json['marketing'].forEach((v) {
        marketing!.add(new Marketing.fromJson(v));
      });
    }
    operationType = json['operationType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.marketing != null) {
      data['marketing'] = this.marketing!.map((v) => v.toJson()).toList();
    }
    data['operationType'] = this.operationType;
    return data;
  }
}
