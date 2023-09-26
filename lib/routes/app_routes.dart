import 'package:mytravelapp/presentation/available_trips_screen/controller/available_trips_controller.dart';
import 'package:mytravelapp/presentation/home_screen/controller/home_controller.dart';
import 'package:mytravelapp/presentation/profile_screen/controller/profile_controller.dart';
import 'package:mytravelapp/presentation/reset_password_screen/reset_password_screen.dart';
import 'package:mytravelapp/presentation/sign_screen/controller/sign_controller.dart';
import 'package:mytravelapp/presentation/sign_screen/sign_screen.dart';
import 'package:mytravelapp/presentation/sign_up_screen/controller/sign_up_controller.dart';
import 'package:mytravelapp/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:mytravelapp/presentation/home_screen/home_screen.dart';
import 'package:mytravelapp/presentation/profile_screen/profile_screen.dart';
import 'package:mytravelapp/presentation/flight_book_oneway_tab_container_screen/flight_book_oneway_tab_container_screen.dart';
import 'package:get/get.dart';
import '../presentation/available_trips_screen/available_trips_screen.dart';

class AppRoutes {
  static const String splashScreenOneScreen = '/splash_screen_one_screen';
  static const String splashScreen = '/splash_screen';
  static const String onboardingSevenScreen = '/onboarding_seven_screen';
  static const String onboardingNineScreen = '/onboarding_nine_screen';
  static const String signScreen = '/sign_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String editProfileScreen = '/edit_profile_screen';
  static const String homeScreen = '/home_screen';
  static const String upcomingTripsOneScreen = '/upcoming_trips_one_screen';
  static const String flightBookOnewayOnePage = '/flight_book_oneway_one_page';
  static const String boardingPassScreen = '/boarding_pass_screen';
  static const String searchFieldOneScreen = '/search_field_one_screen';
  static const String profileScreen = '/profile_screen';
  static const String profileSettingsScreen = '/profile_settings_screen';
  static const String upcomingTripsScreen = '/upcoming_trips_screen';
  static const String flightBookOnewayPage = '/flight_book_oneway_page';
  static const String flight_book = '/flight_book';
  static const String availableTripsScreen = '/available_trips_screen';
  static const String resetPasswordScreen = '/reset_password_screen';
  static List<GetPage> pages = [
    GetPage(
      name: signScreen,
      transition: Transition.fade,
      page: () => SignScreen(),
      bindings: [
        BindingsBuilder(() {
          Get.lazyPut<SignController>(() => SignController());
        }),
      ],
    ),
    GetPage(
      name: signUpScreen,
      transition: Transition.cupertinoDialog,
      page: () => SignUpScreen(),
      bindings: [
        BindingsBuilder(() {
          Get.lazyPut<SignUpController>(() => SignUpController());
        }),
      ],
    ),
    GetPage(
      name: homeScreen,
      transition: Transition.cupertino,
      page: () => HomeScreen(),
      bindings: [
        BindingsBuilder(() {
          Get.lazyPut<HomeController>(() => HomeController());
        }),
      ],
    ),
    GetPage(
      name: profileScreen,
      page: () => ProfileScreen(),
      bindings: [
        BindingsBuilder(() {
          Get.lazyPut<ProfileController>(() => ProfileController());
        }),
      ],
    ),
    GetPage(
      name: flight_book,
      page: () => FlightBookOnewayTabContainerScreen(),
      bindings: [],
    ),
    GetPage(
      name: availableTripsScreen,
      page: () => AvailableTripsScreen(),
      bindings: [
        BindingsBuilder(() {
          Get.lazyPut<AvailableTripsController>(
              () => AvailableTripsController());
        }),
      ],
    ),
    GetPage(name: resetPasswordScreen, page: () => ResetPassword())
  ];
}
