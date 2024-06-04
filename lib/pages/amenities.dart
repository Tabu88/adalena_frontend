import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/web_navigation_controller.dart';
import '../helpers/constants.dart';
import '../helpers/enums.dart';
import '../helpers/widget_helper.dart';
import '../widgets/footer_widget.dart';

class AmenitiesWidgets extends StatefulWidget {
  const AmenitiesWidgets({super.key});

  @override
  State<AmenitiesWidgets> createState() => _AmenitiesWidgetsState();
}

class _AmenitiesWidgetsState extends State<AmenitiesWidgets> {
  final WebNavigationController webNavigationController = Get.put(WebNavigationController());


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return  CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: const SizedBox(),
          pinned: false,
          floating: false,
          primary: true,
          expandedHeight: 600,
          flexibleSpace: FlexibleSpaceBar(
              background:  Stack(
                  children: [
                    Container(
                        decoration: BoxDecoration(),
                        height: 600,
                        width: double.infinity,
                        child: Image.asset("assets/images/house_background.jpeg",fit: BoxFit.cover,)
                    ),
                    Container(
                      height: 600,
                      width: double.infinity,
                      color: Color(Constants.primaryBlue()).withOpacity(0.5),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 30),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Image.asset(
                                  "assets/images/Blue House bottom text.png",
                                  height: 100,
                                  width: 220,
                                ),),
                              const Expanded(flex: 2,child: SizedBox(),),
                              Expanded(flex: 6,child: width > 920 ? dashboardTiles() : const SizedBox()),
                            ],
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 30),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "ADALENA FAMILY HOME ",
                          style: TextStyle(
                              fontSize: 45,
                              // fontWeight: FontWeight.w600,
                              color: Color(Constants.primaryWhite())
                          ),
                        ),
                      ),
                    )
                  ]
              )
          ),
          actions: [const SizedBox()],
        ),
        SliverToBoxAdapter(
          child: width > 700
              ? Container(
            color: Color(Constants.primaryBlue()),
            height: 600,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Adalena Services",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                ),
                const SizedBox(height: 25,),
                Row(children: [
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(12),
                                child: CircleAvatar(

                                  minRadius: 80,
                                  maxRadius: 110,
                                  backgroundColor: Color(Constants.primaryGreen()),
                                  child: CircleAvatar(

                                    minRadius: 75,
                                    maxRadius: 105,
                                    backgroundImage: AssetImage("assets/images/background_1.png"),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "24/7 Care",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 27,
                                          color: Color(Constants.primaryGreen())
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Lorem ipsum dolor sit amet consectetur. Vitae sed aliquam accumsan bibendum. Tellus eget diam duis ultricies nunc. ",
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        color: Color(Constants.primaryWhite())
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(12),
                                child: CircleAvatar(
                                  minRadius: 80,
                                  maxRadius: 110,
                                  backgroundColor: Color(Constants.primaryGreen()),
                                  child: const CircleAvatar(
                                    maxRadius: 105,
                                    minRadius: 75,
                                    backgroundImage: AssetImage("assets/images/background_2.png"),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Fine Dining",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 27,
                                          color: Color(Constants.primaryGreen())
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Lorem ipsum dolor sit amet consectetur. Vitae sed aliquam accumsan bibendum. Tellus eget diam duis ultricies nunc. ",
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        color: Color(Constants.primaryWhite())
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(12),
                                child: CircleAvatar(
                                  minRadius: 80,
                                  maxRadius: 110,
                                  backgroundColor: Color(Constants.primaryGreen()),
                                  child: const CircleAvatar(
                                    minRadius: 75,
                                    maxRadius: 105,
                                    backgroundImage: AssetImage("assets/images/background_3.png"),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Fine Dining",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 27,
                                          color: Color(Constants.primaryGreen())
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Lorem ipsum dolor sit amet consectetur. Vitae sed aliquam accumsan bibendum. Tellus eget diam duis ultricies nunc. ",
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        color: Color(Constants.primaryWhite())
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
              ],
            ),
          )
              : Container(
            color: Color(Constants.primaryBlue()),
            height: 1300,
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Adalena Services",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                ),
                const SizedBox(height: 25,),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child:  Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: CircleAvatar(
                            minRadius: 80,
                            maxRadius: 110,
                            backgroundColor: Color(Constants.primaryGreen()),
                            child: CircleAvatar(
                              minRadius: 75,
                              maxRadius: 105,
                              backgroundImage: AssetImage("assets/images/background_1.png"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "24/7 Care",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27,
                                      color: Color(Constants.primaryGreen())
                                  ),
                                ),
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet consectetur. Vitae sed aliquam accumsan bibendum. Tellus eget diam duis ultricies nunc. ",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Color(Constants.primaryWhite())
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child:  Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: CircleAvatar(
                            minRadius: 80,
                            maxRadius: 110,
                            backgroundColor: Color(Constants.primaryGreen()),
                            child: CircleAvatar(
                              minRadius: 75,
                              maxRadius: 105,
                              backgroundImage: AssetImage("assets/images/background_2.png"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "24/7 Care",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27,
                                      color: Color(Constants.primaryGreen())
                                  ),
                                ),
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet consectetur. Vitae sed aliquam accumsan bibendum. Tellus eget diam duis ultricies nunc. ",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Color(Constants.primaryWhite())
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child:  Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: CircleAvatar(
                            minRadius: 80,
                            maxRadius: 110,
                            backgroundColor: Color(Constants.primaryGreen()),
                            child: CircleAvatar(
                              minRadius: 75,
                              maxRadius: 105,
                              backgroundImage: AssetImage("assets/images/background_3.png"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "24/7 Care",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27,
                                      color: Color(Constants.primaryGreen())
                                  ),
                                ),
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet consectetur. Vitae sed aliquam accumsan bibendum. Tellus eget diam duis ultricies nunc. ",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Color(Constants.primaryWhite())
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 15),
            color: Color(Constants.primaryWhite()),
            height: width > 700 ? 600: 900,
            width: double.infinity,
            child: width > 700
                ? Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 400,
                    // width: 350,
                    child: Image.asset("assets/images/background_1.png",fit: BoxFit.cover,),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 400,
                    // width: 350,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            )
                : Column(
              children: [
                const SizedBox(height: 30,),
                SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: Image.asset("assets/images/background_1.png",fit: BoxFit.cover,)),
                SizedBox(
                  height: 400,
                    width: double.infinity,
                    child: Container(
                      color: Colors.grey,
                    )),
              ],
            ),
          )
        ),
        const SliverToBoxAdapter(
            child: ClipRRect(child: FooterWidget())
        ),
      ],
    );
  }

  Widget dashboardTiles (){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        WidgetHelper.tileElement("Home", (){
          webNavigationController.adalenaPageType.value = AdalenaPageType.home;
        }),
        WidgetHelper.tileElement("Amenities", (){
          webNavigationController.adalenaPageType.value = AdalenaPageType.amenities;
        }),
        WidgetHelper.tileElement("Blog", (){
          webNavigationController.adalenaPageType.value = AdalenaPageType.blog;
        }),
        WidgetHelper.tileElement("Contact Us", (){
          webNavigationController.adalenaPageType.value = AdalenaPageType.contactUs;
        }),
        WidgetHelper.tileElement("About Us", (){
          webNavigationController.adalenaPageType.value = AdalenaPageType.aboutUs;
        }),

      ],
    );
  }
}
