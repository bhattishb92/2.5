import 'package:mytravelapp/core/app_export.dart';

class FlightBookMultiCityController extends GetxController {
  List<String?> fromLocation = [null];
  List<String?> toLocation = [null];
  List<String?> fromIATA = [null];
  List<String?> toITAT = [null];
  List<String?> pessengerType = ["Traveller"];
  List<int> pessengerCount = [1];
  List<String?> fClass = ["Economy"];
  int tabIndex = 0;
  List<DateTime> selectedDate = [DateTime.now()];
  List<String> carbinClass = ["M"];
  int totalFlights = 1;

  updateClass(value, int index) {
    switch (value) {
      case 0:
        this.fClass[index] = "Economy";
        carbinClass[index] = "M";
        break;
      case 1:
        this.fClass[index] = "Premium Economy";
        carbinClass[index] = "W";
        break;
      case 2:
        this.fClass[index] = "Business";
        carbinClass[index] = "C";
        break;
      case 3:
        this.fClass[index] = "First Class";
        carbinClass[index] = "F";
        break;
      default:
    }
    this.update();
  }

  updatePes(value, int index) {
    this.pessengerCount[index] = value + 1;
    if (pessengerCount[index] > 1) {
      this.pessengerType[index] = "Travellers";
    } else {
      this.pessengerType[index] = "Traveller";
    }
    update();
  }

  addFlight() {
    this.totalFlights = this.totalFlights + 1;
    this.fromLocation.add(null);
    this.toLocation.add(null);
    this.fromIATA.add(null);
    this.toITAT.add(null);
    this.pessengerType.add("Traveller");
    this.fClass.add("Economy");
    this.selectedDate.add(DateTime.now());
    this.carbinClass.add("CABIN_CLASS_ECONOMY");
    this.pessengerCount.add(1);
    this.update();
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
