import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../helpers/constants.dart';
import '../helpers/routes_enums.dart';
import '../routes.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 76,
          ),
          const Text(
            "This one is us",
            style:  TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Sorry we could'nt find the page you are looking for",
            style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 65,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: 1.0,
                        color: Color(Constants.primaryGreen()),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'go-to-previous-page'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(Constants.primaryBlue()),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 63,
              ),
              Expanded(
                child: SizedBox(
                  height: 44,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(
                            Routes.getValueForRoute(RoutesEnum.home));
                      },
                      child: const Text(
                        "Back to home",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      )),
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            "assets/images/404.svg",
          )
        ],
      ),
    );
  }
}
