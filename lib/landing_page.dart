

import 'package:adult_family_home/controller/adalena_controller.dart';
import 'package:adult_family_home/controller/web_navigation_controller.dart';
import 'package:adult_family_home/helpers/enums.dart';
import 'package:adult_family_home/helpers/widget_helper.dart';
import 'package:adult_family_home/pages/about.dart';
import 'package:adult_family_home/pages/drawers/adalena_drawer.dart';
import 'package:adult_family_home/pages/amenities.dart';
import 'package:adult_family_home/pages/blog.dart';
import 'package:adult_family_home/pages/drawers/book_tour_drawer.dart';
import 'package:adult_family_home/pages/contact.dart';
import 'package:adult_family_home/pages/home.dart';
import 'package:adult_family_home/widgets/footer_widget.dart';
import 'package:adult_family_home/widgets/next_widget.dart';

import 'package:adult_family_home/widgets/tour_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'helpers/constants.dart';

class LandingPage extends StatefulWidget {
   LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>  {
   final ScrollController _scrollController = ScrollController();
   final _adalenaController = Get.put(AdalenaController());
   final WebNavigationController webNavigationController = Get.put(WebNavigationController());

   double scrollIndex = 0;
   @override
  void initState() {
     _scrollController.addListener((){
        _scrollListener();
     });
    super.initState();
  }

   void _scrollListener() {
     // This function will be called whenever the scroll extent changes
     final scrollExtent = _scrollController.position.maxScrollExtent;
     // Do something with the scroll extent
     _adalenaController.scrollIndex.value = _scrollController.offset;
   }

   Clip _listenToClip( ){
     var clip;
     if(_adalenaController.scrollIndex.value >= 180){
       clip = Clip.hardEdge;
     } else {
       clip = Clip.none;
     }
     setState(() { });
     return clip;
   }

  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
     double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(Constants.primaryWhite()),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
        ),
        backgroundColor: Color(Constants.primaryWhite()),
        flexibleSpace: Align(
          alignment: Alignment.center,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text("Height: $height"),
                  // Text("Width: $width"),
                  Builder(
                    builder: (context) {
                      return OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            fixedSize: Size(width * 0.21, 150),
                            shape: RoundedRectangleBorder(
                              side:
                                  BorderSide(color: Color(Constants.primaryBlue())),
                              borderRadius: BorderRadius.zero,
                            ),
                            backgroundColor: Color(Constants.primaryWhite())),
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: Text(
                          "Book A Tour",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(Constants.primaryBlue()),
                              fontSize: 18),
                        ),
                      );
                    }
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(width * 0.21, 150),
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(color: Color(Constants.primaryBlue())),
                          borderRadius: BorderRadius.zero,
                        ),
                        backgroundColor: Color(Constants.primaryBlue())),
                    onPressed: () {
                      webNavigationController.adalenaPageType.value = AdalenaPageType.contactUs;
                    },
                    child: Text(
                      "Contact Us",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(Constants.primaryWhite()),
                          fontSize: 18),
                    ),
                  ),
                ],
              )),
        ),
        actions: const [SizedBox()],
      ),
      body: Obx(
              ()=> getCenterWidget(webNavigationController.adalenaPageType.value)
      ),
      drawer: const AdalenaDrawer(),
      endDrawer: const BookTourDrawer(),
    );
  }





  Widget getCenterWidget(AdalenaPageType value){
     switch(value){
       case AdalenaPageType.home:
         return HomeWidgets();
       case AdalenaPageType.aboutUs:
         return const AboutWidgets();
       case AdalenaPageType.amenities:
         return const AmenitiesWidgets();
       case AdalenaPageType.contactUs:
         return const ContactWidgets();
       case AdalenaPageType.blog:
         return const BlogWidgets();

       default:
         return HomeWidgets();
     }
  }

}
