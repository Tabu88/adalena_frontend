import 'package:adult_family_home/helpers/enums.dart';
import 'package:adult_family_home/widgets/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/web_navigation_controller.dart';
import '../../helpers/constants.dart';

class AdalenaDrawer extends StatefulWidget {
  const AdalenaDrawer({super.key});

  @override
  State<AdalenaDrawer> createState() => _AdalenaDrawerState();
}

class _AdalenaDrawerState extends State<AdalenaDrawer> {
  final WebNavigationController webNavigationController = Get.put(WebNavigationController());


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(Constants.primaryBlue()),
      width: 400,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            duration: const Duration(seconds: 3),
            curve: Curves.fastOutSlowIn,
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/Blue House bottom text.png",
                // height: 150,
                // width: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
          DrawerTile(
            title: "Home",
            navigation:() {
              webNavigationController.adalenaPageType.value =
                  AdalenaPageType.home;
              Get.back();
            },
          ),
          const Divider(
            color: Colors.white,
          ),
          DrawerTile(
            title: "Amenities",
            navigation: () {
              webNavigationController.adalenaPageType.value = AdalenaPageType.amenities;
              Get.back();
            },
          ),
          const Divider(
            color: Colors.white,
          ),
          DrawerTile(
            title: "Blog",
            navigation: () {
              webNavigationController.adalenaPageType.value = AdalenaPageType.blog;
              Get.back();
            },
          ),
          const Divider(
            color: Colors.white,
          ),
          DrawerTile(
            title: "Contact Us",
            navigation: () {
              webNavigationController.adalenaPageType.value = AdalenaPageType.contactUs;
              Get.back();
            },
          ),
          const Divider(
            color: Colors.white,
          ),
          DrawerTile(
            title: "About Us",
            navigation: () {
              webNavigationController.adalenaPageType.value = AdalenaPageType.aboutUs;
              Get.back();
            },
          ),
          const Divider(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
