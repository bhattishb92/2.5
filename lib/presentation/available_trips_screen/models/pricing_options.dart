class PricingOptions {
  List<Agents>? agents;
  Price? price;
  String? url;

  PricingOptions({this.agents, this.price, this.url});

  PricingOptions.fromJson(Map<String, dynamic> json) {
    if (json['agents'] != null) {
      agents = <Agents>[];
      json['agents'].forEach((v) {
        agents!.add(new Agents.fromJson(v));
      });
    }
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.agents != null) {
      data['agents'] = this.agents!.map((v) => v.toJson()).toList();
    }
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    data['url'] = this.url;
    return data;
  }
}

class Agents {
  String? id;
  String? name;
  bool? isCarrier;
  String? updateStatus;
  bool? optimisedForMobile;
  bool? liveUpdateAllowed;
  String? ratingStatus;
  double? rating;
  int? feedbackCount;
  RatingBreakdown? ratingBreakdown;

  Agents(
      {this.id,
      this.name,
      this.isCarrier,
      this.updateStatus,
      this.optimisedForMobile,
      this.liveUpdateAllowed,
      this.ratingStatus,
      this.rating,
      this.feedbackCount,
      this.ratingBreakdown});

  Agents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isCarrier = json['is_carrier'];
    updateStatus = json['update_status'];
    optimisedForMobile = json['optimised_for_mobile'];
    liveUpdateAllowed = json['live_update_allowed'];
    ratingStatus = json['rating_status'];
    rating = json['rating'] != null ? json['rating'].toDouble() : null;
    feedbackCount = json['feedback_count'];
    ratingBreakdown = json['rating_breakdown'] != null
        ? new RatingBreakdown.fromJson(json['rating_breakdown'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['is_carrier'] = this.isCarrier;
    data['update_status'] = this.updateStatus;
    data['optimised_for_mobile'] = this.optimisedForMobile;
    data['live_update_allowed'] = this.liveUpdateAllowed;
    data['rating_status'] = this.ratingStatus;
    data['rating'] = this.rating;
    data['feedback_count'] = this.feedbackCount;
    if (this.ratingBreakdown != null) {
      data['rating_breakdown'] = this.ratingBreakdown!.toJson();
    }
    return data;
  }
}

class RatingBreakdown {
  double? reliablePrices;
  double? clearExtraFees;
  double? customerService;
  double? easeOfBooking;
  double? other;

  RatingBreakdown(
      {this.reliablePrices,
      this.clearExtraFees,
      this.customerService,
      this.easeOfBooking,
      this.other});

  RatingBreakdown.fromJson(Map<String, dynamic> json) {
    reliablePrices = json['reliable_prices'] != null
        ? json['reliable_prices'].toDouble()
        : null;
    clearExtraFees = json['clear_extra_fees'] != null
        ? json['clear_extra_fees'].toDouble()
        : null;
    customerService = json['customer_service'] != null
        ? json['customer_service'].toDouble()
        : null;
    easeOfBooking = json['ease_of_booking'] != null
        ? json['ease_of_booking'].toDouble()
        : null;
    other = json['other'] != null ? json['other'].toDouble() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reliable_prices'] = this.reliablePrices;
    data['clear_extra_fees'] = this.clearExtraFees;
    data['customer_service'] = this.customerService;
    data['ease_of_booking'] = this.easeOfBooking;
    data['other'] = this.other;
    return data;
  }
}

class Price {
  double? amount;
  String? updateStatus;
  String? lastUpdated;
  int? quoteAge;

  Price({this.amount, this.updateStatus, this.lastUpdated, this.quoteAge});

  Price.fromJson(Map<String, dynamic> json) {
    amount = json['amount'] != null ? json['amount'].toDouble() : null;
    updateStatus = json['update_status'];
    lastUpdated = json['last_updated'];
    quoteAge = json['quote_age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['update_status'] = this.updateStatus;
    data['last_updated'] = this.lastUpdated;
    data['quote_age'] = this.quoteAge;
    return data;
  }
}
