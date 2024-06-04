import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'constants.dart';


class WidgetHelper{

  static Widget dashboardImage(){
    return Stack(
        children:[
          // ImageWidget(),
          Container(
            height: 60,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
          Container(
            height: 150,
            width: 200,
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: Colors.redAccent
            ),
            child: Image.asset(
              "assets/images/old_guys",
              alignment: Alignment.center,
              fit: BoxFit.cover,
              // height: 150,width: 150,
            ),
          ),
        ]
    );
  }

  static Widget tileElement(String title, Function() navigation ){
    return Container (
      padding: EdgeInsets.symmetric(horizontal: 10,),
      decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
                color: Color(Constants.primaryWhite()),
                width: 1.2
            ),
          )
      ),
      child: TextButton(
        onPressed: navigation,
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(Constants.primaryWhite()),
              fontSize: 18
          ),
        ),
      ),
    );
  }

  static SnackbarController snackbar(String title, String message,
      [int? duration, double? marginTop]) =>
      Get.snackbar(
        title,
        message,
        animationDuration: const Duration(milliseconds: 500),
        overlayColor: Colors.black.withOpacity(.5),
        overlayBlur: 4,
        maxWidth: 450,
        titleText: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.close,
                  color: Colors.transparent,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF9F197E),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Get.closeAllSnackbars();
                    Get.back();
                  },
                  icon:  Icon(
                    Icons.close,
                    color: Color(Constants.primaryBlue()),
                  ),
                )
              ],
            ),
            Text(
              message,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff3F3532),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              color: Color(0xFF9F197E),
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    'ok'.tr,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        messageText: const SizedBox(),
        colorText: const Color(0xFF008744),
        backgroundColor: const Color(0xFFf7fbf9),
        duration: Duration(seconds: duration ?? 4),
        borderWidth: 1,
        borderColor:  Color(Constants.primaryBlue()).withOpacity(0.5),
        isDismissible: true,
        margin: EdgeInsets.only(top: marginTop ?? 5, left: 14, right: 14),
      );


}