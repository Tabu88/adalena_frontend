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
                                  height: 150,
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
            height: 700,
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
                                        "Specialized Care for Adults with Developmental Disabilities",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 27,
                                          color: Color(Constants.primaryGreen())
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "ADALENA ADULT FAMILY HOME LLC specializes in providing care for adults with developmental disabilities. The facility is certified and equipped with the expertise and experience necessary to support these residents throughout all stages of life, ensuring personalized and comprehensive care.",
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
                                  maxRadius: 110,
                                  backgroundColor: Color(Constants.primaryGreen()),
                                  child: const CircleAvatar(
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
                      ],),
              ],
            ),
          )
              : Container(
            color: Color(Constants.primaryBlue()),
            height: 1780,
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
                                  "Specialized Care for Adults with Developmental Disabilities",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27,
                                      color: Color(Constants.primaryGreen())
                                  ),
                                ),
                              ),
                              Text(
                                "ADALENA ADULT FAMILY HOME LLC specializes in providing care for adults with developmental disabilities. The facility is certified and equipped with the expertise and experience necessary to support these residents throughout all stages of life, ensuring personalized and comprehensive care.",
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
                    height: 400,
                    // width: 350,
                    child: Image.asset("assets/images/background_1.png",fit: BoxFit.cover,),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Color(Constants.primaryBlue()),
                    height: 400,
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
