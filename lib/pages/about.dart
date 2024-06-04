import 'package:adult_family_home/widgets/core_values_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/web_navigation_controller.dart';
import '../helpers/constants.dart';
import '../helpers/enums.dart';
import '../helpers/widget_helper.dart';
import '../widgets/footer_widget.dart';

class AboutWidgets extends StatefulWidget {
  const AboutWidgets({super.key});

  @override
  State<AboutWidgets> createState() => _AboutWidgetsState();
}

class _AboutWidgetsState extends State<AboutWidgets> {
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
          child: Container(
            height: 650,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Meet the Team",
                    style: TextStyle(
                      fontSize: 50,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Color(Constants.primaryGreen())
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 500,
                      width: double.infinity * 0.78,
                      child: Image.asset("assets/images/group_of_nurses.jpg",fit: BoxFit.fitWidth,)
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Color(Constants.primaryBlue()),
            height: 300,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(12),
                  child: Text(
                    "About Us",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 42,
                      fontStyle: FontStyle.italic,
                      color: Color(Constants.primaryGreen())
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                          child: Text(
                            "Lorem ipsum dolor sit amet consectetur. Elementum ac pulvinar viverra vivamus. Neque quam tempor aenean sed bibendum consectetur sed mollis hendrerit. Dui nulla adipiscing adipiscing rhoncus neque nisl. Integer sit eu sapien luctus.",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Color(Constants.primaryWhite())
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Color(Constants.primaryWhite()),
            height: width > 700 ? 900 : width > 550 ? 1100 : 1450,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: Text(
                    "Core Values",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: Color(Constants.primaryGreen()),
                      fontStyle: FontStyle.italic
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                const CoreValueWidget(
                    title: "Practice Well Being",
                    employeeValues: "Lorem ipsum dolor sit amet consectetur. Donec lectus pretium dignissim porttitor vulputate ut. Nunc in gravida eleifend scelerisque sed id nulla. Tincid.",
                    residentValues: "Lorem ipsum dolor sit amet consectetur. Donec lectus pretium dignissim porttitor vulputate ut. Nunc in gravida eleifend scelerisque sed id nulla. Tincid.",
                    iconImage: "assets/images/hand_love.png",
                  ),
                const CoreValueWidget(
                    title: "Strike a balance",
                    employeeValues: "Lorem ipsum dolor sit amet consectetur. Donec lectus pretium dignissim porttitor vulputate ut. Nunc in gravida eleifend scelerisque sed id nulla. Tincid.",
                    residentValues: "Lorem ipsum dolor sit amet consectetur. Donec lectus pretium dignissim porttitor vulputate ut. Nunc in gravida eleifend scelerisque sed id nulla. Tincid.",
                    iconImage: "assets/images/balance.png",
                  ),
                const CoreValueWidget(
                    title: "Break the Mold",
                    employeeValues: "Lorem ipsum dolor sit amet consectetur. Donec lectus pretium dignissim porttitor vulputate ut. Nunc in gravida eleifend scelerisque sed id nulla. Tincid.",
                    residentValues: "Lorem ipsum dolor sit amet consectetur. Donec lectus pretium dignissim porttitor vulputate ut. Nunc in gravida eleifend scelerisque sed id nulla. Tincid.",
                    iconImage: "assets/images/bulb.png",
                  ),

              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: width > 700
              ? Column(
            children: [
              Container(
                height: 180,
                width: 700,
                decoration: BoxDecoration(
                    color: Color(Constants.primaryBlue()),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                      child: Text(
                        "Mission",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Color(Constants.primaryGreen())
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                      child: Text(
                        "Lorem ipsum dolor sit amet consectetur. Ut sed morbi etiam amet tempus et venenatis. Sed tellus id amet nisl sit sit odio. Feugiat tellus sit lorem pretium pellentesque mattis. Ut est eget turpis et mauris parturient.",
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            color: Color(Constants.primaryWhite())
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                height: 180,
                width: 700,
                decoration: BoxDecoration(
                  color: Color(Constants.primaryWhite()),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(Constants.primaryBlue())
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 9),
                      child: Text(
                        "Vision",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          color: Color(Constants.primaryGreen())
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                      child: Text(
                        "Lorem ipsum dolor sit amet consectetur. Ut sed morbi etiam amet tempus et venenatis. Sed tellus id amet nisl sit sit odio. Feugiat tellus sit lorem pretium pellentesque mattis. Ut est eget turpis et mauris parturient.",
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          color: Color(Constants.primaryBlue())
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 32,)
            ],
          )
              : Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(Constants.primaryBlue()),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                          child: Text(
                            "Mission",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 23,
                                color: Color(Constants.primaryGreen())
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                          child: Text(
                            "Lorem ipsum dolor sit amet consectetur. Ut sed morbi etiam amet tempus et venenatis. Sed tellus id amet nisl sit sit odio. Feugiat tellus sit lorem pretium pellentesque mattis. Ut est eget turpis et mauris parturient.",
                            style: TextStyle(
                                fontSize: 19,
                                fontStyle: FontStyle.italic,
                                color: Color(Constants.primaryWhite())
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 13,),
              Padding(
                padding: EdgeInsets.all(10),
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(Constants.primaryWhite()),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Color(Constants.primaryBlue())
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 9),
                          child: Text(
                            "Vision",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 23,
                                color: Color(Constants.primaryGreen())
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                          child: Text(
                            "Lorem ipsum dolor sit amet consectetur. Ut sed morbi etiam amet tempus et venenatis. Sed tellus id amet nisl sit sit odio. Feugiat tellus sit lorem pretium pellentesque mattis. Ut est eget turpis et mauris parturient.",
                            style: TextStyle(
                                fontSize: 19,
                                fontStyle: FontStyle.italic,
                                color: Color(Constants.primaryBlue())
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25,),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: width > 700
              ?Container(
            color: Color(Constants.primaryWhite()),
            height: 500,
            width: 700,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Meet Our Founders",
                    style: TextStyle(
                      color: Color(Constants.primaryGreen()),
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 400,
                      width: 400,
                      child: Image.asset("assets/images/adalena_exp.png",fit: BoxFit.cover,),
                    ),
                    const SizedBox(width: 15,),
                    Container(
                      height: 300,
                      width: 300,
                      child: Text(
                        "Lorem ipsum dolor sit amet consectetur. Magna leo enim sit massa mi nunc mauris. Commodo quam in ut pulvinar ullamcorper amet massa fusce tincidunt. Iaculis cras cursus duis duis. Dis nibh cras amet dignissim.",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue()),
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
              :Container(
            color: Color(Constants.primaryWhite()),
            height: 500,
            width: 900,
            child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Meet Our Founders",
                          style: TextStyle(
                              color: Color(Constants.primaryGreen()),
                              fontWeight: FontWeight.bold,
                              fontSize: 45,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      Container(
                        height: 400,
                        width: double.infinity,
                        child: Image.asset(
                          "assets/images/adalena_exp.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 150,
                        width: double.infinity,
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Magna leo enim sit massa mi nunc mauris. Commodo quam in ut pulvinar ullamcorper amet massa fusce tincidunt. Iaculis cras cursus duis duis. Dis nibh cras amet dignissim.",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(Constants.primaryBlue()),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      // const SizedBox(height: 25,),
                    ],
                  ),
                ),
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
