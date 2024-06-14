import 'package:adult_family_home/pages/about.dart';
import 'package:adult_family_home/pages/amenities.dart';
import 'package:adult_family_home/pages/contact.dart';
import 'package:adult_family_home/pages/home.dart';
import 'package:adult_family_home/pages/not_found.dart';
import 'package:adult_family_home/pages/privacy_policy.dart';
import 'package:adult_family_home/pages/terms_and_conditions.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'helpers/routes_enums.dart';

class Routes {
  static Map<RoutesEnum, String> webRoutes = {
    RoutesEnum.home: "/home",
    RoutesEnum.amenities: "/amenities",
    RoutesEnum.aboutUs: "/about",
    RoutesEnum.contactUs: "/contact",
    RoutesEnum.notFoundPage: "/NotFoundPage",
    RoutesEnum.privacyPolicy: "/privacyPolicy",
    RoutesEnum.terms: "/terms",
  };

  static String getValueForRoute(RoutesEnum route) {
    return webRoutes[route] ?? "/NotFoundPage";
  }
}

final getPages = [
  GetPage(
    name: Routes.getValueForRoute(RoutesEnum.home),
    page: () =>  HomeWidgets(),
  ),
  GetPage(
    name: Routes.getValueForRoute(RoutesEnum.amenities),
    page: () =>  const AmenitiesWidgets(),
  ),
  GetPage(
    name: Routes.getValueForRoute(RoutesEnum.aboutUs),
    page: () =>  const AboutWidgets(),
  ),
  GetPage(
    name: Routes.getValueForRoute(RoutesEnum.contactUs),
    page: () =>  const ContactWidgets(),
  ),
  GetPage(
    name: Routes.getValueForRoute(RoutesEnum.notFoundPage),
    page: () =>  const NotFoundPage(),
  ),
  GetPage(
    name: Routes.getValueForRoute(RoutesEnum.privacyPolicy),
    page: () =>  const PrivacyPolicy(),
  ),
  GetPage(
    name: Routes.getValueForRoute(RoutesEnum.terms),
    page: () =>  const TermsConditions(),
  ),
];