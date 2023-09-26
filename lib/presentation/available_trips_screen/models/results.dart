import 'package:mytravelapp/presentation/available_trips_screen/models/legs.dart';
import 'package:mytravelapp/presentation/available_trips_screen/models/pricing_options.dart';

class Results {
  String? id;
  List<Legs>? legs;
  List<PricingOptions>? pricingOptions;
  String? deeplink;

  Results({this.id, this.legs, this.pricingOptions, this.deeplink});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['legs'] != null) {
      legs = <Legs>[];
      json['legs'].forEach((v) {
        legs!.add(new Legs.fromJson(v));
      });
    }
    if (json['pricing_options'] != null) {
      pricingOptions = <PricingOptions>[];
      json['pricing_options'].forEach((v) {
        pricingOptions!.add(new PricingOptions.fromJson(v));
      });
    }
    deeplink = json['deeplink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.legs != null) {
      data['legs'] = this.legs!.map((v) => v.toJson()).toList();
    }
    if (this.pricingOptions != null) {
      data['pricing_options'] =
          this.pricingOptions!.map((v) => v.toJson()).toList();
    }
    data['deeplink'] = this.deeplink;
    return data;
  }
}
