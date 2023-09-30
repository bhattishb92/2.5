import 'package:mytravelapp/core/app_export.dart';

class FlightBookMultiCityController extends GetxController {
  List<String?> fromLocation = [null];
  List<String?> toLocation = [null];
  List<String?> fromIATA = [null];
  List<String?> toITAT = [null];
  List<String?> pessengerType = ["Traveller"];
  List<int> adultCount = [1];
  List<int> childCount = [0];
  List<int> infantCount = [0];
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

  // updatePes(value, int index) {
  //   this.adultCount[index] = value + 1;
  //   if (adultCount[index] > 1) {
  //     this.pessengerType[index] = "Travellers";
  //   } else {
  //     this.pessengerType[index] = "Traveller";
  //   }
  //   update();
  // }

  addFlight() {
    this.totalFlights = this.totalFlights + 1;
    this.fromLocation.add(null);
    this.toLocation.add(null);
    this.fromIATA.add(null);
    this.toITAT.add(null);
    this.pessengerType.add("Traveller");
    this.fClass.add("Economy");
    this.selectedDate.add(DateTime.now());
    this.carbinClass.add("M");
    this.adultCount.add(1);
    this.childCount.add(0);
    this.infantCount.add(0);
    this.update();
  }

  removeFlight(int index){
    this.totalFlights = this.totalFlights - 1;
    this.fromLocation.removeAt(index);
    this.toLocation.removeAt(index);
    this.fromIATA.removeAt(index);
    this.toITAT.removeAt(index);
    this.pessengerType.removeAt(index);
    this.fClass.removeAt(index);
    this.selectedDate.removeAt(index);
    this.carbinClass.removeAt(index);
    this.adultCount.removeAt(index);
    this.childCount.removeAt(index);
    this.infantCount.removeAt(index);
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
