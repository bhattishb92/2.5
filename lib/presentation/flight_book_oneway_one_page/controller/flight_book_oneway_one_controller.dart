import 'package:mytravelapp/core/app_export.dart';

class FlightBookOnewayOneController extends GetxController {
  String? fromLocation;
  String? toLocation;
  String? fromIATA;
  String? toITAT;
  String? pessengerType = "Traveller";
  int pessengerCount = 1;
  String? fClass = "Economy";
  int tabIndex = 0;
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now().add(Duration(days: 1));
  // String carbinClass = "CABIN_CLASS_ECONOMY";
  String carbinClass = "M";

  updateClass(value) {
    switch (value) {
      case 0:
        this.fClass = "Economy";
        // carbinClass = "CABIN_CLASS_ECONOMY";
        carbinClass = 'M';
        break;
      case 1:
        this.fClass = "Premium Economy";
        // carbinClass = "CABIN_CLASS_PREMIUM_ECONOMY";
        carbinClass = 'W';
        break;
      case 2:
        this.fClass = "Business";
        // carbinClass = "CABIN_CLASS_BUSINESS";
        carbinClass = 'C';
        break;
      case 3:
        this.fClass = "First Class";
        // carbinClass = "CABIN_CLASS_FIRST";
        carbinClass = 'F';
        break;
      default:
    }
    this.update();
  }

  updatePes(value) {
    this.pessengerCount = value + 1;
    if (pessengerCount > 1) {
      this.pessengerType = "Travellers";
    } else {
      this.pessengerType = "Traveller";
    }
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
