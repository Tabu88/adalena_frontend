import 'package:adult_family_home/widgets/tour_widget.dart';
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

class HomeWidgets extends StatefulWidget {
   HomeWidgets({super.key});

  @override
  State<HomeWidgets> createState() => _HomeWidgetsState();
}

class _HomeWidgetsState extends State<HomeWidgets> {
  final WebNavigationController webNavigationController = Get.put(WebNavigationController());
  bool isHovered = false;
  Color color = Colors.transparent;
  int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();

  void _scrollToIndex(int index) {
    setState(() {
      _currentIndex = index;
      _scrollController.animateTo(
        _currentIndex * 350, // Assumes each item has a height of 50.0
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
        slivers: <Widget>[
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
                                    width: 200,
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
            child: width < 400
                ? Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              alignment: Alignment.center,
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                  child: Text(
                    "“Our unique community and in-home health services offer  senior freedom , independence , spiritual and physical well  being  , and a life full of new experience.”",
                    style: TextStyle(
                      fontSize: width > 750 ? 25 : 19,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

            )
                : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              alignment: Alignment.center,
              child:  Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 3,
                    child:  Text(
                      "“Our unique community and in-home health services offer  senior freedom , independence , spiritual and physical well  being  , and a life full of new experience.”",
                      style: TextStyle(
                        fontSize: width > 750 ? 25 : 19,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: SizedBox(),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: width > 870
                  ? Container(
                alignment: Alignment.center,
                height: 500,
                width: double.infinity,
                color: Color(Constants.primaryBlue()),
                child: Container(
                    height: 500,
                    width: 870,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 20,
                          left: 0,
                          child: Image.asset(
                            "assets/images/old_exercising.png",
                            height: 450,
                            width: 550,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 100,
                          left: 440,
                          child: Container(
                              height: 300,
                              width: 400,
                              color: Color(Constants.primaryWhite()),
                              padding: const EdgeInsets.only(left: 30,top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "TRADITION",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(Constants.primaryBlue()),
                                        ),
                                      ),
                                      const SizedBox(width: 5,),
                                      Image.asset("assets/images/line.png",height: 20,width: 80,)
                                    ],
                                  ),
                                  Text(
                                    "The Adalena Experience",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Color(Constants.primaryGreen()),
                                        fontStyle: FontStyle.italic
                                    ),
                                  ),
                                  Text(
                                    "Being situated in regular residential neighborhoods, these homes blend seamlessly into the community. "
                                        "This traditional setting offers residents the familiarity of living in a standard home environment preserving the comfort of traditional living. "
                                        "The traditional approach of adult family homes promotes close-knit interactions among residents and caregivers. ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(Constants.primaryBlue())
                                    ),
                                  )
                                ],
                              )
                          ),
                        )
                      ],
                    )
                ),
              )
                  : width < 580
                  ? Container(
                alignment: Alignment.center,
                height: 500,
                width: double.infinity,
                color: Color(Constants.primaryBlue()),
                child: Container(
                  height: 500,
                  width: 500,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: 30,
                        child: Image.asset(
                          "assets/images/old_exercising.png",
                          height: 250,
                          width: 320,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        right:0,
                        child: Container(
                            height: 220,
                            width: 320,
                            color: Color(Constants.primaryWhite()),
                            padding: const EdgeInsets.only(left: 12,top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "TRADITION",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Color(Constants.primaryBlue()),
                                      ),
                                    ),
                                    const SizedBox(width: 5,),
                                    Image.asset("assets/images/line.png",height: 13,width: 50,)
                                  ],
                                ),
                                Text(
                                  "The Adalena Experience",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      color: Color(Constants.primaryGreen()),
                                      fontStyle: FontStyle.italic
                                  ),
                                ),
                                Text(
                                  "Being situated in regular residential neighborhoods, these homes blend seamlessly into the community. "
                                      "This traditional setting offers residents the familiarity of living in a standard home environment preserving the comfort of traditional living. "
                                      "The traditional approach of adult family homes promotes close-knit interactions among residents and caregivers. ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color:
                                      Color(Constants.primaryBlue())),
                                )
                              ],
                            )
                        ),
                      )
                    ],
                  ),
                ),
              )
                  : Container(
                alignment: Alignment.center,
                height: 500,
                width: double.infinity,
                color: Color(Constants.primaryBlue()),
                child: Container(
                  height: 400,
                  width: 570,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 50,
                        left: 0,
                        child: Image.asset(
                          "assets/images/old_exercising.png",
                          height: 300,
                          width: 370,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 100,
                        right:0 ,
                        child: Container(
                            height: 280,
                            width: 270,
                            color: Color(Constants.primaryWhite()),
                            padding: const EdgeInsets.only(left: 12,top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "TRADITION",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Color(Constants.primaryBlue()),
                                      ),
                                    ),
                                    const SizedBox(width: 5,),
                                    Image.asset("assets/images/line.png",height: 13,width: 50,)
                                  ],
                                ),
                                Text(
                                  "The Adalena Experience",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      color: Color(Constants.primaryGreen()),
                                      fontStyle: FontStyle.italic
                                  ),
                                ),
                                Text(
                                  "Being situated in regular residential neighborhoods, these homes blend seamlessly into the community. "
                                      "This traditional setting offers residents the familiarity of living in a standard home environment preserving the comfort of traditional living. "
                                      "The traditional approach of adult family homes promotes close-knit interactions among residents and caregivers. ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color:
                                      Color(Constants.primaryBlue())),
                                )
                              ],
                            )
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),
          SliverToBoxAdapter(
              child: width > 870
                  ? Container(
                alignment: Alignment.center,
                height: 500,
                width: double.infinity,
                color: Color(Constants.primaryWhite()),
                child: Container(
                  height: 500,
                  width: 870,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 30,
                        right: 0,
                        child: Image.asset(
                          "assets/images/old_fellas.png",
                          height: 450,
                          width: 550,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom:30,
                        child: Container(
                            height: 350,
                            width: 400,
                            color: Color(Constants.primaryBlue()),
                            padding: const EdgeInsets.only(left: 30,top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "COMMUNITY",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(Constants.primaryWhite()),
                                      ),
                                    ),
                                    const SizedBox(width: 5,),
                                    Image.asset("assets/images/line.png",height: 20,width: 80,)
                                  ],
                                ),
                                Text(
                                  "The Adalena Experience",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Color(Constants.primaryGreen()),
                                      fontStyle: FontStyle.italic
                                  ),
                                ),
                                Text(
                                  "ADALENA ADULT FAMILY HOME LLC is part of the SPANAWAY community, offering residents a chance to remain connected to a familiar locale. In ADALENA, the community atmosphere is akin to a family gathering, where residents and caregivers interact closely. The smaller number of residents at ADALENA means that the community is tight-knit, with each member receiving the attention they need",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(Constants.primaryWhite())
                                  ),
                                )
                              ],
                            )
                        ),
                      )
                    ],
                  ),
                ),
              )
                  : width < 580
                  ? Container(
                alignment: Alignment.center,
                height: 500,
                width: double.infinity,
                color: Color(Constants.primaryWhite()),
                child: Container(
                  height: 500,
                  width: 500,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        right: 20,
                        child: Image.asset(
                          "assets/images/old_fellas.png",
                          height: 250,
                          width: 350,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom:30,
                        child: Container(
                            height: 230,
                            width: 330,
                            color: Color(Constants.primaryBlue()),
                            padding: const EdgeInsets.only(
                                left: 20,
                                top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "COMMUNITY",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Color(Constants.primaryWhite()),
                                      ),
                                    ),
                                    const SizedBox(width: 5,),
                                    Image.asset("assets/images/line.png",height: 13,width: 50,)
                                  ],
                                ),
                                Text(
                                  "The Adalena Experience",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      color: Color(Constants.primaryGreen()),
                                      fontStyle: FontStyle.italic
                                  ),
                                ),
                                Text(
                                  "ADALENA ADULT FAMILY HOME LLC is part of the SPANAWAY community, offering residents a chance to remain connected to a familiar locale. In ADALENA, the community atmosphere is akin to a family gathering, where residents and caregivers interact closely. The smaller number of residents at ADALENA means that the community is tight-knit, with each member receiving the attention they need.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(Constants.primaryWhite())
                                  ),
                                )
                              ],
                            )
                        ),
                      )
                    ],
                  ),
                ),
              )
                  : Container(
                alignment: Alignment.center,
                height: 500,
                width: double.infinity,
                color: Color(Constants.primaryWhite()),
                child: Container(
                  height: 400,
                  width: 570,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 50,
                        right: 0,
                        child: Image.asset(
                          "assets/images/old_fellas.png",
                          height: 300,
                          width: 370,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom:30,
                        child: Container(
                            height: 280,
                            width: 270,
                            color: Color(Constants.primaryBlue()),
                            padding: const EdgeInsets.only(left: 30,top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "COMMUNITY",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Color(Constants.primaryWhite()),
                                      ),
                                    ),
                                    const SizedBox(width: 5,),
                                    Image.asset("assets/images/line.png",height: 13,width: 50,)
                                  ],
                                ),
                                Text(
                                  "The Adalena Experience",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      color: Color(Constants.primaryGreen()),
                                      fontStyle: FontStyle.italic
                                  ),
                                ),
                                Text(
                                  "ADALENA ADULT FAMILY HOME LLC is part of the SPANAWAY community, offering residents a chance to remain connected to a familiar locale. In ADALENA, the community atmosphere is akin to a family gathering, where residents and caregivers interact closely. The smaller number of residents at ADALENA means that the community is tight-knit, with each member receiving the attention they need",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(Constants.primaryWhite())
                                  ),
                                )
                              ],
                            )
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),
          SliverToBoxAdapter(
              child: width > 870
                  ? Container(
                alignment: Alignment.center,
                height: 500,
                width: double.infinity,
                color: Color(Constants.primaryBlue()),
                child: Container(
                  height: 500,
                  width: 880,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 30,
                        left: 0,
                        child: Image.asset(
                          "assets/images/background_4.png",
                          height: 450,
                          width: 550,
                        ),
                      ),
                      Positioned(
                        top: 120,
                        right: 0,
                        child: Container(
                            height: 350,
                            width: 400,
                            color: Color(Constants.primaryWhite()),
                            padding: const EdgeInsets.only(left: 30,top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "WELLNESS",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(Constants.primaryBlue()),
                                      ),
                                    ),
                                    const SizedBox(width: 5,),
                                    Image.asset("assets/images/line.png",height: 20,width: 80,)
                                  ],
                                ),
                                Text(
                                  "The Adalena Experience",
                                  style: TextStyle(
                                      fontSize: 24 ,
                                      fontWeight: FontWeight.w600,
                                      color: Color(Constants.primaryGreen()),
                                      fontStyle: FontStyle.italic
                                  ),
                                ),
                                Text(
                                  "Residents at ADALENA ADULT FAMILY HOME LLC experience the comfort and warmth of a home-like environment, which promotes a sense of security and well-being. With a higher caregiver-to-resident ratio, ADALENA ensures that each resident receives individualized attention and care. The increased attention from caregivers helps in promptly addressing any health issues or concerns that may arise.",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(Constants.primaryBlue())
                                  ),
                                )
                              ],
                            )
                        ),
                      )
                    ],
                  ),
                ),
              )
                  : width < 580
                  ? Container(
                alignment: Alignment.center,
                height: 500,
                width: double.infinity,
                color: Color(Constants.primaryBlue()),
                child: Container(
                  height: 500,
                  width: 500,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: 30,
                        child: Image.asset(
                          "assets/images/background_4.png",
                          height: 250,
                          width: 320,
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        right: 0,
                        child: Container(
                            height: 240,
                            width: 320,
                            color: Color(Constants.primaryWhite()),
                            padding: const EdgeInsets.only(left: 20,top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "WELLNESS",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Color(Constants.primaryBlue()),
                                      ),
                                    ),
                                    const SizedBox(width: 5,),
                                    Image.asset("assets/images/line.png",height: 13,width: 50,)
                                  ],
                                ),
                                Text(
                                  "The Adalena Experience",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      color: Color(Constants.primaryGreen()),
                                      fontStyle: FontStyle.italic
                                  ),
                                ),
                                Text(
                                  "Residents at ADALENA ADULT FAMILY HOME LLC experience the comfort and warmth of a home-like environment, which promotes a sense of security and well-being. With a higher caregiver-to-resident ratio, ADALENA ensures that each resident receives individualized attention and care. The increased attention from caregivers helps in promptly addressing any health issues or concerns that may arise.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(Constants.primaryBlue())
                                  ),
                                )
                              ],
                            )
                        ),
                      )
                    ],
                  ),
                ),
              )
                  : Container(
                alignment: Alignment.center,
                height: 500,
                width: double.infinity,
                color: Color(Constants.primaryBlue()),
                child: Container(
                  height: 400,
                  width: 570,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 50,
                        left: 0,
                        child: Image.asset(
                          "assets/images/background_4.png",
                          height: 300,
                          width: 370,
                        ),
                      ),
                      Positioned(
                        top: 100,
                        right: 0,
                        child: Container(
                            height: 280,
                            width: 270,
                            color: Color(Constants.primaryWhite()),
                            padding: const EdgeInsets.only(left: 30,top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "WELLNESS",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Color(Constants.primaryBlue()),
                                      ),
                                    ),
                                    const SizedBox(width: 5,),
                                    Image.asset("assets/images/line.png",height: 13,width: 50,)
                                  ],
                                ),
                                Text(
                                  "The Adalena Experience",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      color: Color(Constants.primaryGreen()),
                                      fontStyle: FontStyle.italic
                                  ),
                                ),
                                Text(
                                  "Residents at ADALENA ADULT FAMILY HOME LLC experience the comfort and warmth of a home-like environment, which promotes a sense of security and well-being. With a higher caregiver-to-resident ratio, ADALENA ensures that each resident receives individualized attention and care. The increased attention from caregivers helps in promptly addressing any health issues or concerns that may arise.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(Constants.primaryBlue())
                                  ),
                                )
                              ],
                            )
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),
          SliverToBoxAdapter(
            child: width > 920
                ? Container(
                height: 650,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Life at Adalena Family Home",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50,
                                      fontStyle: FontStyle.italic,
                                      color: Color(Constants.primaryGreen())
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15,),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  "We seek to provide an environment that addresses physical, mental, spiritual and social needs. Adalena AFH provides a warm, home-like environment tailored to individual needs and cultural preferences through a holistic approach.",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Color(Constants.primaryBlue())
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: (){
                              if(_currentIndex > 0){
                                _scrollToIndex(_currentIndex-1);
                              }
                            },
                            child: Container(
                              color:  Colors.transparent,
                              child: Icon(
                                Icons.keyboard_arrow_left,
                                size: 60,
                                color: Color(Constants.primaryBlue()),
                              ),
                            )),
                        Expanded(
                          child: SizedBox(
                            height: 400,
                            child: ListView.builder(
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              itemCount: _houseImages.length,
                              itemBuilder: (context, index){
                                var images = _houseImages[index];
                                return Container(
                                  child: InkWell(
                                    onTap:(){
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context){
                                            return Dialog(
                                              child: InteractiveViewer(
                                                child: Image.asset(images, fit: BoxFit.cover,),
                                              ),
                                            );
                                          });
                                    },
                                    onHover: (v) {
                                      if(v == true){
                                        color = Color(Constants.primaryBlue()).withOpacity(0.5);
                                      } else {
                                        color = Colors.transparent;
                                      }
                                    },
                                    child: Image.asset(
                                      images,
                                      height: 250,
                                      width: 350,
                                      // color: color,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: (){
                              if(_currentIndex < 7){
                                _scrollToIndex(_currentIndex+1);
                              }
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                size: 60,
                                color: Color(Constants.primaryBlue()),
                              ),
                            )),
                      ],
                    ),
                  ],
                )
            )
                : width < 580
                ? Container(
                height: 700,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      child: Text(
                        "Life at Adalena Family Home",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            fontStyle: FontStyle.italic,
                            color: Color(Constants.primaryGreen())
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "We seek to provide an environment that addresses physical, mental, spiritual and social needs. Adalena AFH provides a warm, home-like environment tailored to individual needs and cultural preferences through a holistic approach.",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(Constants.primaryBlue())
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: (){
                              if(_currentIndex > 0){
                                _scrollToIndex(_currentIndex-1);
                              }
                            },
                            child: Container(
                              color:  Colors.transparent,
                              child: Icon(
                                Icons.keyboard_arrow_left,
                                size: 60,
                                color: Color(Constants.primaryBlue()),
                              ),
                            )),
                        Expanded(
                          child: SizedBox(
                            height: 400,
                            child: ListView.builder(
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              itemCount: _houseImages.length,
                              itemBuilder: (context, index){
                                var images = _houseImages[index];
                                return Container(
                                  child: InkWell(
                                    onTap:(){
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context){
                                            return Dialog(
                                              child: InteractiveViewer(
                                                child: Image.asset(images, fit: BoxFit.cover,),
                                              ),
                                            );
                                          });
                                    },
                                    onHover: (v) {
                                      if(v == true){
                                        color = Color(Constants.primaryBlue()).withOpacity(0.5);
                                      } else {
                                        color = Colors.transparent;
                                      }
                                    },
                                    child: Image.asset(
                                      images,
                                      height: 250,
                                      width: 350,
                                      // color: color,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: (){
                              if(_currentIndex < 7){
                                _scrollToIndex(_currentIndex+1);
                              }
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                size: 60,
                                color: Color(Constants.primaryBlue()),
                              ),
                            )),
                      ],
                    ),
                  ],
                )
            )
                : Container(
                height: 900,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Life at Adalena Family Home",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50,
                                      fontStyle: FontStyle.italic,
                                      color: Color(Constants.primaryGreen())
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15,),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  "We seek to provide an environment that addresses physical, mental, spiritual and social needs.Adalena AFH provides a warm, home-like environment tailored to individual needs and cultural preferences through a holistic approach.",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Color(Constants.primaryBlue())
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: (){
                              if(_currentIndex > 0){
                                _scrollToIndex(_currentIndex-1);
                              }
                            },
                            child: Container(
                              color:  Colors.transparent,
                              child: Icon(
                                Icons.keyboard_arrow_left,
                                size: 60,
                                color: Color(Constants.primaryBlue()),
                              ),
                            )),
                        Expanded(
                          child: SizedBox(
                            height: 400,
                            child: ListView.builder(
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              itemCount: _houseImages.length,
                              itemBuilder: (context, index){
                                var images = _houseImages[index];
                                return Container(
                                  child: InkWell(
                                    onTap:(){
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context){
                                            return Dialog(
                                              child: InteractiveViewer(
                                                child: Image.asset(images, fit: BoxFit.cover,),
                                              ),
                                            );
                                          });
                                    },
                                    onHover: (v) {
                                      if(v == true){
                                        color = Color(Constants.primaryBlue()).withOpacity(0.5);
                                      } else {
                                        color = Colors.transparent;
                                      }
                                    },
                                    child: Image.asset(
                                      images,
                                      height: 250,
                                      width: 350,
                                      // color: color,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: (){
                              if(_currentIndex < 7){
                                _scrollToIndex(_currentIndex+1);
                              }
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                size: 60,
                                color: Color(Constants.primaryBlue()),
                              ),
                            )),
                      ],
                    ),
                  ],
                )
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              color: Color(Constants.primaryBlue()),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:  Container(
                  height: width > 1400 ? 850 : 2200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(Constants.primaryWhite()),
                  ),
                  child: Row(
                    children: [
                       Expanded(
                        flex: width < 400 ? 0 : 1,
                        child:  const SizedBox(),
                      ),
                      Expanded(
                        flex: 6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "You Are In Good Hands",
                              style: TextStyle(
                                  color: Color(Constants.primaryGreen()),
                                  fontSize: width > 580 ?50 : 40,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "We honor individuality and dignity, and maintain high standards of care to ensure a supportive and compassionate environment for all residents.",
                              style: TextStyle(
                                color: Color(Constants.primaryBlue()),
                                fontSize: width > 580 ? 18 : 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 15,),
                            Container(
                              width : 1100,
                              height: width > 1400 ? 650 : 2000,
                              alignment: Alignment.topCenter,
                              child: SingleChildScrollView(
                                child: width > 980
                                    ? GridView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: width > 1450 ? 3 : 2,
                                        mainAxisSpacing: 15,
                                        crossAxisSpacing: 5,
                                        mainAxisExtent: 300,
                                        childAspectRatio: 1.5
                                    ),
                                    itemCount: _services.length,
                                    itemBuilder: (context, index) {
                                      var icons = _serviceImages[index];
                                      var title = _services[index];
                                      var details = _servicesDetails[index];
                                      return Container(
                                        height: 340,
                                        width: 500,
                                        color: Color(Constants.primaryWhite()),
                                        child:  Stack(
                                          clipBehavior: Clip.hardEdge,
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 40,
                                              child: Container(
                                                width: 360,
                                                height: 230,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(15),
                                                    border: Border.all(
                                                      color: Color(Constants.primaryBlue()),
                                                    )
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 10.0, left: 8,right: 8),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const SizedBox(height: 8,),
                                                      Text(
                                                        title,
                                                        style: TextStyle(
                                                            fontSize: 24,
                                                            fontWeight: FontWeight.w600,
                                                            color: Color(Constants.primaryBlue())
                                                        ),
                                                      ),
                                                      const SizedBox(height: 5,),
                                                      Text(
                                                        details,
                                                        // overflow: TextOverflow.ellipsis,
                                                        // maxLines: 6,
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            color: Color(Constants.primaryBlue())
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 0,
                                              left: 15,
                                              child: Container(
                                                height: 60,
                                                width: 60,
                                                margin: EdgeInsets.only(left: 15),
                                                color: Color(Constants.primaryBlue()),
                                                child: Center(child: Image.asset(icons,height: 40, width: 40,)),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    })
                                    : SizedBox(
                                  height: 2000,
                                  width: double.infinity,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    primary: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: _services.length,
                                    itemBuilder: (context, index) {
                                      var icons = _serviceImages[index];
                                      var title = _services[index];
                                      var details = _servicesDetails[index];
                                      return Center(
                                        child: Container(
                                            height: 310,
                                            width: width < 580 ? 320 : 350,
                                            color: Color(
                                                Constants.primaryWhite()),
                                            child: Stack(
                                                clipBehavior: Clip.hardEdge,
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 40,
                                                    child: Container(
                                                      width: width < 580 ? 320 :350,
                                                      height: 250,
                                                      decoration:
                                                      BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              15),
                                                          border:
                                                          Border.all(
                                                            color: Color(
                                                                Constants
                                                                    .primaryBlue()),
                                                          )),
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(
                                                            top: 10.0,
                                                            left: 8,
                                                            right: 8),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                            Text(
                                                              title,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                  24,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                                  color: Color(
                                                                      Constants
                                                                          .primaryBlue())),
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              details,
                                                              overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                              maxLines: 8,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                  16,
                                                                  color: Color(
                                                                      Constants
                                                                          .primaryBlue())),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 0,
                                                    left: 15,
                                                    child: Container(
                                                      height: 60,
                                                      width: 60,
                                                      margin: EdgeInsets.only(
                                                          left: 15),
                                                      color: Color(Constants
                                                          .primaryBlue()),
                                                      child: Center(
                                                          child: Image.asset(
                                                            icons,
                                                            height: 40,
                                                            width: 40,
                                                          )),
                                                    ),
                                                  )
                                                ])),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                       Expanded(
                        flex: width < 400 ? 0 : 1,
                        child: const SizedBox(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              color: Color(Constants.primaryBlue()),
            ),
          ),
          const SliverToBoxAdapter(
            child: ClipRRect(
                child: TourWidget()
            ),
          ),
          const SliverToBoxAdapter(
              child: ClipRRect(child: FooterWidget())
          ),
        ],
      ),
      drawer: const AdalenaDrawer(),
      endDrawer: const BookTourDrawer(),
    );
  }

  List<String> _services = [
    "Medical Checkup",
    "Quality Food",
    "Health Facilites",
    "Health Consultation",
    "House Care",
    "Health Medicine"
  ];
  List<String> _servicesDetails = [
    "Regular blood pressure and weight checks are conducted at scheduled intervals to monitor residents' health. These checkups help track any irregularities or health issues that may arise. The recorded data ensures timely intervention and appropriate medical care.",
    "Residents receive three nutritious meals daily—breakfast, lunch, and dinner. The facility accommodates dietary restrictions and special doctor-prescribed diets to ensure each resident's nutritional needs are met. Additional food items like coffee, tea, and snacks between meals are also provided for added comfort and satisfaction.",
    "ADALENA ADULT FAMILY HOME LLC specializes in caring for adults with developmental disabilities, providing expert and certified care.An on-site Hoyer lift is available for residents who require assistance with mobility ",
    "ADALENA ADULT FAMILY HOME LLC provides short-term or respite care with flexible daily rates for stays under a month. The home employs bilingual staff who speak English and Swahili, facilitating better communication with residents",
    "Daily housekeeping services keep the facility clean and organized, including residents' rooms. All standard home utilities, such as electricity, water, and heating, are included in the base price. A diverse range of social and recreational activities is offered weekly to engage residents.  ",
    "The facility provides comprehensive medications management, ensuring residents take their medications on schedule. Caregivers track administration times and manage prescription refills to prevent any lapses. This service is crucial for maintaining the health and stability of residents."
  ];
  List<String> _houseImages = [
    "assets/images/image9.jpeg",
    "assets/images/image7.jpeg",
    "assets/images/image6.jpeg",
    "assets/images/image5.jpeg",
    "assets/images/image4.jpeg",
    "assets/images/image3.jpeg",
    "assets/images/image2.jpeg",
    "assets/images/image1.jpeg",
  ];
  List<String> _serviceImages = [
    "assets/images/caduceus.png",
    "assets/images/cutlery.png",
    "assets/images/heart_with_pulse.png",
    "assets/images/medical_heart.png",
    "assets/images/house_1.png",
    "assets/images/pill.png",
  ];

}
