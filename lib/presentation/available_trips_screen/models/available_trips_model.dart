// import 'dart:convert';

// flightDetails welcome6FromJson(String str) =>
//     flightDetails.fromJson(json.decode(str));

// String welcome6ToJson(flightDetails data) => json.encode(data.toJson());

// // ignore: camel_case_types
// class flightDetails {
//   flightDetails({
//     required this.status,
//     required this.content,
//   });

//   String status;
//   Content content;

//   factory flightDetails.fromJson(Map<String, dynamic> json) => flightDetails(
//         status: json["status"],
//         content: Content.fromJson(json["content"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "content": content.toJson(),
//       };
// }

// class Content {
//   Content({
//     required this.results,
//     required this.groupingOptions,
//   });

//   Results results;
//   GroupingOptions groupingOptions;

//   factory Content.fromJson(Map<String, dynamic> json) => Content(
//         results: Results.fromJson(json["results"]),
//         groupingOptions: GroupingOptions.fromJson(json["groupingOptions"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "results": results.toJson(),
//         "groupingOptions": groupingOptions.toJson(),
//       };
// }

// class GroupingOptions {
//   GroupingOptions({
//     required this.byRoute,
//     required this.byDate,
//   });

//   ByRoute byRoute;
//   ByDate byDate;

//   factory GroupingOptions.fromJson(Map<String, dynamic> json) =>
//       GroupingOptions(
//         byRoute: ByRoute.fromJson(json["byRoute"]),
//         byDate: ByDate.fromJson(json["byDate"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "byRoute": byRoute.toJson(),
//         "byDate": byDate.toJson(),
//       };
// }

// class ByDate {
//   ByDate({
//     required this.quotesInboundGroups,
//     required this.quotesOutboundGroups,
//   });

//   List<dynamic> quotesInboundGroups;
//   List<QuotesOutboundGroup> quotesOutboundGroups;

//   factory ByDate.fromJson(Map<String, dynamic> json) => ByDate(
//         quotesInboundGroups:
//             List<dynamic>.from(json["quotesInboundGroups"].map((x) => x)),
//         quotesOutboundGroups: List<QuotesOutboundGroup>.from(
//             json["quotesOutboundGroups"]
//                 .map((x) => QuotesOutboundGroup.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "quotesInboundGroups":
//             List<dynamic>.from(quotesInboundGroups.map((x) => x)),
//         "quotesOutboundGroups":
//             List<dynamic>.from(quotesOutboundGroups.map((x) => x.toJson())),
//       };
// }

// class QuotesOutboundGroup {
//   QuotesOutboundGroup({
//     required this.monthYearDate,
//     required this.quoteIds,
//   });

//   MonthYearDate monthYearDate;
//   List<String> quoteIds;

//   factory QuotesOutboundGroup.fromJson(Map<String, dynamic> json) =>
//       QuotesOutboundGroup(
//         monthYearDate: MonthYearDate.fromJson(json["monthYearDate"]),
//         quoteIds: List<String>.from(json["quoteIds"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "monthYearDate": monthYearDate.toJson(),
//         "quoteIds": List<dynamic>.from(quoteIds.map((x) => x)),
//       };
// }

// class MonthYearDate {
//   MonthYearDate({
//     required this.year,
//     required this.month,
//     required this.day,
//   });

//   int year;
//   int month;
//   int day;

//   factory MonthYearDate.fromJson(Map<String, dynamic> json) => MonthYearDate(
//         year: json["year"],
//         month: json["month"],
//         day: json["day"],
//       );

//   Map<String, dynamic> toJson() => {
//         "year": year,
//         "month": month,
//         "day": day,
//       };
// }

// class ByRoute {
//   ByRoute({
//     required this.quotesGroups,
//   });

//   List<QuotesGroup> quotesGroups;

//   factory ByRoute.fromJson(Map<String, dynamic> json) => ByRoute(
//         quotesGroups: List<QuotesGroup>.from(
//             json["quotesGroups"].map((x) => QuotesGroup.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "quotesGroups": List<dynamic>.from(quotesGroups.map((x) => x.toJson())),
//       };
// }

// class QuotesGroup {
//   QuotesGroup({
//     required this.originPlaceId,
//     required this.destinationPlaceId,
//     required this.quoteIds,
//   });

//   String originPlaceId;
//   String destinationPlaceId;
//   List<String> quoteIds;

//   factory QuotesGroup.fromJson(Map<String, dynamic> json) => QuotesGroup(
//         originPlaceId: json["originPlaceId"],
//         destinationPlaceId: json["destinationPlaceId"],
//         quoteIds: List<String>.from(json["quoteIds"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "originPlaceId": originPlaceId,
//         "destinationPlaceId": destinationPlaceId,
//         "quoteIds": List<dynamic>.from(quoteIds.map((x) => x)),
//       };
// }

// class Results {
//   Results({
//     required this.quotes,
//     required this.carriers,
//     required this.places,
//   });

//   Map<String, Quote> quotes;
//   Map<String, Carrier> carriers;
//   Map<String, Place> places;

//   factory Results.fromJson(Map<String, dynamic> json) => Results(
//         quotes: Map.from(json["quotes"])
//             .map((k, v) => MapEntry<String, Quote>(k, Quote.fromJson(v))),
//         carriers: Map.from(json["carriers"])
//             .map((k, v) => MapEntry<String, Carrier>(k, Carrier.fromJson(v))),
//         places: Map.from(json["places"])
//             .map((k, v) => MapEntry<String, Place>(k, Place.fromJson(v))),
//       );

//   Map<String, dynamic> toJson() => {
//         "quotes": Map.from(quotes)
//             .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//         "carriers": Map.from(carriers)
//             .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//         "places": Map.from(places)
//             .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//       };
// }

// class Carrier {
//   Carrier({
//     required this.name,
//     required this.imageUrl,
//     required this.iata,
//   });

//   String name;
//   String imageUrl;
//   String iata;

//   factory Carrier.fromJson(Map<String, dynamic> json) => Carrier(
//         name: json["name"],
//         imageUrl: json["imageUrl"],
//         iata: json["iata"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "imageUrl": imageUrl,
//         "iata": iata,
//       };
// }

// class Place {
//   Place({
//     required this.entityId,
//     required this.parentId,
//     required this.name,
//     required this.type,
//     required this.iata,
//     required this.coordinates,
//   });

//   String entityId;
//   String parentId;
//   String name;
//   String type;
//   String iata;
//   Coordinates coordinates;

//   factory Place.fromJson(Map<String, dynamic> json) => Place(
//         entityId: json["entityId"],
//         parentId: json["parentId"],
//         name: json["name"],
//         type: json["type"],
//         iata: json["iata"],
//         coordinates: Coordinates.fromJson(json["coordinates"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "entityId": entityId,
//         "parentId": parentId,
//         "name": name,
//         "type": type,
//         "iata": iata,
//         "coordinates": coordinates.toJson(),
//       };
// }

// class Coordinates {
//   Coordinates({
//     required this.latitude,
//     required this.longitude,
//   });

//   double latitude;
//   double longitude;

//   factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
//         latitude: json["latitude"].toDouble(),
//         longitude: json["longitude"].toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         "latitude": latitude,
//         "longitude": longitude,
//       };
// }

// class Quote {
//   Quote({
//     required this.minPrice,
//     required this.isDirect,
//     required this.outboundLeg,
//     required this.inboundLeg,
//   });

//   MinPrice minPrice;
//   bool isDirect;
//   BoundLeg outboundLeg;
//   BoundLeg inboundLeg;

//   factory Quote.fromJson(Map<String, dynamic> json) => Quote(
//         minPrice: MinPrice.fromJson(json["minPrice"]),
//         isDirect: json["isDirect"],
//         outboundLeg: BoundLeg.fromJson(json["outboundLeg"]),
//         inboundLeg: BoundLeg.fromJson(json["inboundLeg"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "minPrice": minPrice.toJson(),
//         "isDirect": isDirect,
//         "outboundLeg": outboundLeg.toJson(),
//         "inboundLeg": inboundLeg.toJson(),
//       };
// }

// class BoundLeg {
//   BoundLeg({
//     required this.originPlaceId,
//     required this.destinationPlaceId,
//     required this.departureDateTime,
//     required this.quoteCreationTimestamp,
//     required this.marketingCarrierId,
//   });

//   String originPlaceId;
//   String destinationPlaceId;
//   DepartureDateTime departureDateTime;
//   String quoteCreationTimestamp;
//   String marketingCarrierId;

//   factory BoundLeg.fromJson(Map<String, dynamic> json) => BoundLeg(
//         originPlaceId: json["originPlaceId"],
//         destinationPlaceId: json["destinationPlaceId"],
//         departureDateTime:
//             DepartureDateTime.fromJson(json["departureDateTime"]),
//         quoteCreationTimestamp: json["quoteCreationTimestamp"],
//         marketingCarrierId: json["marketingCarrierId"],
//       );

//   Map<String, dynamic> toJson() => {
//         "originPlaceId": originPlaceId,
//         "destinationPlaceId": destinationPlaceId,
//         "departureDateTime": departureDateTime.toJson(),
//         "quoteCreationTimestamp": quoteCreationTimestamp,
//         "marketingCarrierId": marketingCarrierId,
//       };
// }

// class DepartureDateTime {
//   DepartureDateTime({
//     required this.year,
//     required this.month,
//     required this.day,
//     required this.hour,
//     required this.minute,
//     required this.second,
//   });

//   int year;
//   int month;
//   int day;
//   int hour;
//   int minute;
//   int second;

//   factory DepartureDateTime.fromJson(Map<String, dynamic> json) =>
//       DepartureDateTime(
//         year: json["year"],
//         month: json["month"],
//         day: json["day"],
//         hour: json["hour"],
//         minute: json["minute"],
//         second: json["second"],
//       );

//   Map<String, dynamic> toJson() => {
//         "year": year,
//         "month": month,
//         "day": day,
//         "hour": hour,
//         "minute": minute,
//         "second": second,
//       };
// }

// class MinPrice {
//   MinPrice({
//     required this.amount,
//     required this.unit,
//     required this.updateStatus,
//   });

//   String amount;
//   String unit;
//   String updateStatus;

//   factory MinPrice.fromJson(Map<String, dynamic> json) => MinPrice(
//         amount: json["amount"],
//         unit: json["unit"],
//         updateStatus: json["updateStatus"],
//       );

//   Map<String, dynamic> toJson() => {
//         "amount": amount,
//         "unit": unit,
//         "updateStatus": updateStatus,
//       };
// }
