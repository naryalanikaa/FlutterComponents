import 'package:get/get.dart';

class Routers {
  static final route = [
    GetPage(
      name: '/splashView',
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: '/onboardView',
      page: () => const OnBoardMainScreen(),
    ),
    GetPage(
      name: '/startJourneyScreen',
      page: () => const StartJourneyScreen(),
    ),
    GetPage(
      name: '/otpVerificationView',
      page: () => const OtpVerificationScreen(),
    ),
  ];
}
