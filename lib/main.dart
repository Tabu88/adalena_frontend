import 'package:adult_family_home/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_utils/get_utils.dart';
import 'helpers/routes_enums.dart';


bool isdarkMode = Get.isDarkMode;

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Adalena Family Home',
      theme: ThemeData(
        fontFamily: 'CrimsonText'
      ),
      initialRoute: Routes.getValueForRoute(RoutesEnum.home),
      getPages: getPages,
      debugShowCheckedModeBanner: false,
    );
  }
}

