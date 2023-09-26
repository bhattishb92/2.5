class Place {
  int? id;
  String? name;
  String? displayCode;

  Place({this.id, this.name, this.displayCode});

  Place.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayCode = json['displayCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['displayCode'] = this.displayCode;
    return data;
  }
}
