class DetailPlace {
  String? flightPlaceId;
  Parent? parent;
  String? name;
  String? type;

  DetailPlace({this.flightPlaceId, this.parent, this.name, this.type});

  DetailPlace.fromJson(Map<String, dynamic> json) {
    flightPlaceId = json['flightPlaceId'];
    parent =
        json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flightPlaceId'] = this.flightPlaceId;
    if (this.parent != null) {
      data['parent'] = this.parent!.toJson();
    }
    data['name'] = this.name;
    data['type'] = this.type;
    return data;
  }
}

class Parent {
  String? flightPlaceId;
  String? name;
  String? type;

  Parent({this.flightPlaceId, this.name, this.type});

  Parent.fromJson(Map<String, dynamic> json) {
    flightPlaceId = json['flightPlaceId'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flightPlaceId'] = this.flightPlaceId;
    data['name'] = this.name;
    data['type'] = this.type;
    return data;
  }
}
