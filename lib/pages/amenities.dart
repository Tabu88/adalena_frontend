import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/web_navigation_controller.dart';
import '../helpers/constants.dart';
import '../helpers/enums.dart';
import '../helpers/routes_enums.dart';
import '../helpers/widget_helper.dart';
import '../routes.dart';
import '../widgets/footer_widget.dart';
import 'drawers/adalena_drawer.dart';
import 'drawers/book_tour_drawer.dart';

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
    return  Scaffold(
      backgroundColor: Color(Constants.primaryWhite()),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon:  Icon(Icons.menu, size: 35,color: Color(Constants.primaryBlue()),),
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Builder(
                      builder: (context) {
                        return OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              fixedSize: width < 580 ? Size(width * 0.26, 50) :Size(width * 0.22, 100),
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
                            "Book Tour",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(Constants.primaryBlue()),
                                fontSize: width < 580 ? 15 :18
                            ),
                          ),
                        );
                      }
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: width < 580 ? Size(width * 0.26, 50) :Size(width * 0.22, 100),
                        shape: RoundedRectangleBorder(
                          side:
                          BorderSide(color: Color(Constants.primaryBlue())),
                          borderRadius: BorderRadius.zero,
                        ),
                        backgroundColor: Color(Constants.primaryBlue())),
                    onPressed: () {
                      Get.toNamed(
                        Routes.getValueForRoute(RoutesEnum.contactUs),
                      );
                    },
                    child: Text(
                      "Contact Us",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(Constants.primaryWhite()),
                          fontSize: width < 580 ? 15 :18
                      ),
                    ),
                  ),
                ],
              )),
        ),
        actions: const [SizedBox()],
      ),
      body: CustomScrollView(
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
                          decoration: const BoxDecoration(),
                          height: 600,
                          width: double.infinity,
                          child: Image.asset("assets/images/Adalena_house_backgrnd.jpeg",fit: BoxFit.cover,)
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
                                    height: 150,
                                    width: 220,
                                  ),),
                                const Expanded(flex: 2,child: SizedBox(),),
                                Expanded(flex: 6,child: width > 920 ? WidgetHelper.dashboardTiles() : const SizedBox()),
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
            child: width > 870
                ? Container(
              color: Color(Constants.primaryBlue()),
              height: width < 1200 ? 950 :800,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Perfectly curated for your wellfare",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Color(Constants.primaryGreen())
                      ),
                    ),
                  ),
                  const SizedBox(height: 25,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: CircleAvatar(
                              minRadius: 80,
                              maxRadius: 130,
                              backgroundColor: Color(Constants.primaryGreen()),
                              child: CircleAvatar(
                                minRadius: 75,
                                maxRadius: 125,
                                backgroundImage: AssetImage("assets/images/adalena_exp5.png"),
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
                                    "Specialized Care for Adults",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 27,
                                        color: Color(Constants.primaryGreen())
                                    ),
                                  ),
                                ),
                                Text(
                                  "ADALENA ADULT FAMILY HOME specializes in providing care for adults with developmental disabilities, dementia and mental illness. The facility is certified and equipped with the expertise and experience necessary to support these residents throughout all stages of life, ensuring personalized and comprehensive care.",
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
                              maxRadius: 130,
                              backgroundColor: Color(Constants.primaryGreen()),
                              child: const CircleAvatar(
                                maxRadius: 125,
                                minRadius: 75,
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
                                    "Medications Management",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 27,
                                        color: Color(Constants.primaryGreen())
                                    ),
                                  ),
                                ),
                                Text(
                                  "The facility offers comprehensive medications management services. Caregivers diligently track medication administration schedules and manage prescription refills. This service is crucial for maintaining the health and stability of residents, ensuring they receive their medications on time and as prescribed. ",
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
                              maxRadius: 130,
                              backgroundColor: Color(Constants.primaryGreen()),
                              child: const CircleAvatar(
                                minRadius: 75,
                                maxRadius: 125,
                                backgroundImage: AssetImage("assets/images/food.jpg"),
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
                                    "Nutritious Meals and Comprehensive Dietary Accommodations",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 27,
                                        color: Color(Constants.primaryGreen())
                                    ),
                                  ),
                                ),
                                Text(
                                  "Residents are provided with three nutritious meals daily—breakfast, lunch, and dinner. The facility accommodates any dietary restrictions or special doctor-prescribed diets to meet individual nutritional needs. Additionally, residents have access to coffee, tea, and snacks between meals, ensuring they are well-nourished and comfortable throughout the day.",
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
                  ],),
                ],
              ),
            )
                : Container(
              color: Color(Constants.primaryBlue()),
              height:  width > 580 ? 1690 : width < 500 ? 2100 : 1840,
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Perfectly curated for your wellfare",
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
                              backgroundImage: AssetImage("assets/images/adalena_exp5.png"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Specialized Care for Adults ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27,
                                      color: Color(Constants.primaryGreen())
                                  ),
                                ),
                              ),
                              Text(
                                "ADALENA ADULT FAMILY HOME specializes in providing care for adults with developmental disabilities, dementia and mental illness. The facility is certified and equipped with the expertise and experience necessary to support these residents throughout all stages of life, ensuring personalized and comprehensive care.",
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
                                  "Medications Management",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27,
                                      color: Color(Constants.primaryGreen())
                                  ),
                                ),
                              ),
                              Text(
                                "The facility offers comprehensive medications management services. Caregivers diligently track medication administration schedules and manage prescription refills. This service is crucial for maintaining the health and stability of residents, ensuring they receive their medications on time and as prescribed. ",
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
                              backgroundImage: AssetImage("assets/images/food.jpg"),
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
                                  "Nutritious Meals and Comprehensive Dietary Accommodations",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27,
                                      color: Color(Constants.primaryGreen())
                                  ),
                                ),
                              ),
                              Text(
                                "Residents are provided with three nutritious meals daily—breakfast, lunch, and dinner. The facility accommodates any dietary restrictions or special doctor-prescribed diets to meet individual nutritional needs. Additionally, residents have access to coffee, tea, and snacks between meals, ensuring they are well-nourished and comfortable throughout the day.",
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
                        height: 600,
                        // width: 350,
                        child: Image.asset("assets/images/background_1.png",fit: BoxFit.cover,),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Color(Constants.primaryBlue()),
                        height: 600,
                        // width: 350,
                        child: SingleChildScrollView(
                          child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                                  child: Text(
                                    "Amenities",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 32
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 500,
                                  width: double.infinity,
                                  child: ListView.builder(
                                      itemCount: amenities.length,
                                      itemBuilder: (context, index){
                                        var amenity = amenities[index];
                                        var amenityDetails = amenitiesDetails[index];
                                        var iconImage = amenityIcons[index];

                                        return ListTile(
                                          leading: Image.asset(
                                            iconImage,
                                            height: 50,
                                            width: 50,
                                            fit: BoxFit.fitHeight,
                                          ),
                                          title: Text(
                                            amenity,
                                            style:  TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(Constants.primaryGreen()),
                                            ),
                                          ),
                                          subtitle: Text(
                                            amenityDetails,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ]
                          ),
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
                    Container(
                      color: Color(Constants.primaryBlue()),
                      height: 400,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                                child: Text(
                                  "Amenities",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 32
                                  ),
                                ),
                              ),
                              Container(
                                height: 300,
                                width: double.infinity,
                                child: ListView.builder(
                                    itemCount: amenities.length,
                                    itemBuilder: (context, index){
                                      var amenity = amenities[index];
                                      var amenityDetails = amenitiesDetails[index];
                                      var iconImage = amenityIcons[index];

                                      return ListTile(
                                        leading: Image.asset(
                                          iconImage,
                                          height: 50,
                                          width: 50,
                                          fit: BoxFit.fitHeight,
                                        ),
                                        title: Text(
                                          amenity,
                                          style:  TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(Constants.primaryGreen()),
                                          ),
                                        ),
                                        subtitle: Text(
                                          amenityDetails,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ]
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
          const SliverToBoxAdapter(
              child: ClipRRect(child: FooterWidget())
          ),
        ],
      ),
      drawer: const AdalenaDrawer(),
      endDrawer: const BookTourDrawer(),
    );;
  }

  List<String> amenities = [
    "Regular Medical Checks",
    "Housekeeping and Laundry",
    "Activities",
    "Outdoor seating",
    "Transportation",
  ];

  List<String> amenityIcons = [
    "assets/images/medical.png",
    "assets/images/laundry.png",
    "assets/images/activity.png",
    "assets/images/chair.png",
    "assets/images/transport.png"
  ];

  List<String> amenitiesDetails = [
    "Regular blood pressure and weight checks are done at scheduled intervals, and recorded to track irregularities.",
    "Laundry is provided for your flat linens on a set schedule or sooner if needed. Your personal laundry is also washed and folded regularly by care staff.",
    "A range of social and recreational activities are offered every week to keep residents occupied, entertained and engaged. Feel free to ask what types of activities are scheduled for this week.",
    "We offer a unique and delightful blend of nature, enhanced dining, and vibrant social interaction, creating a refreshing and memorable experience.",
    "Local transportation for certain scheduled outings, as well as doctor visits is provided at no additional cost"
  ];
}
