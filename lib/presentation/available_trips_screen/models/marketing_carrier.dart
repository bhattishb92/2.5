class MarketingCarrier {
  int? id;
  String? name;
  String? alternateDi;
  int? allianceId;

  MarketingCarrier({this.id, this.name, this.alternateDi, this.allianceId});

  MarketingCarrier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alternateDi = json['alternate_di'];
    allianceId = json['allianceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['alternate_di'] = this.alternateDi;
    data['allianceId'] = this.allianceId;
    return data;
  }
}
