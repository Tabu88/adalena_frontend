import 'package:adult_family_home/widgets/core_values_widget.dart';
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
          SliverToBoxAdapter(
            child: Container(
              color: Color(Constants.primaryBlue()),
              height: width > 1250 ? 700 : width > 1000 ? 850 : width > 800 ? 1100 : width < 580 ? 1250 :800,
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
                  width > 800
                      ? Row(
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
                              "At Adalena AFH, we embrace the principles of holistic health, which means caring for the whole person by addressing physical, mental, spiritual, and social needs. We understand that all these aspects affect overall health, and being unwell in one area impacts others. Our approach is rooted in healing the whole person, ensuring our employees consider each resident’s body, mind, spirit, culture, socioeconomic background, and environment when delivering care. We are a reliable adult family home, dedicated to offering quality holistic care to our residents. Our commitment extends to residents and their families, regardless of background. We promise to provide compassionate care and comfort, ensuring that all residents are respected, safe, and dignified. Adalena AFH provides a warm, home-like environment tailored to individual needs and cultural preferences. We specialize in individualized care, welcoming both private pay and Medicaid clients for independent, supervised, assisted, and total care. Located in Spanaway, Washington, our dedicated owners, Fiona and Edward, are wholeheartedly committed to the well-being of our residents, their families, and our staff.",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Color(Constants.primaryWhite())
                              ),
                              textAlign: TextAlign.center,
                              // maxLines: 5,
                              // overflow: TextOverflow.ellipsis,
                            ),
                          )
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                    ],
                  )
                      : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    child: Text(
                        "At Adalena AFH, we embrace the principles of holistic health, which means caring for the whole person by addressing physical, mental, spiritual, and social needs. We understand that all these aspects affect overall health, and being unwell in one area impacts others. Our approach is rooted in healing the whole person, ensuring our employees consider each resident’s body, mind, spirit, culture, socioeconomic background, and environment when delivering care. We are a reliable adult family home, dedicated to offering quality holistic care to our residents. Our commitment extends to residents and their families, regardless of background. We promise to provide compassionate care and comfort, ensuring that all residents are respected, safe, and dignified. Adalena AFH provides a warm, home-like environment tailored to individual needs and cultural preferences. We specialize in individualized care, welcoming both private pay and Medicaid clients for independent, supervised, assisted, and total care. Located in Spanaway, Washington, our dedicated owners, Fiona and Edward, are wholeheartedly committed to the well-being of our residents, their families, and our staff.",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(Constants.primaryWhite())
                      ),
                      textAlign: TextAlign.center,
                      // maxLines: 5,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Color(Constants.primaryWhite()),
              height: width > 800 ? 1900 : width < 580 ? 2300 : 2100,
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
                    title: "Respect",
                    employeeValues: "To honor the individuality and dignity of each resident, ensuring every person feels valued and respected. This respect extends to our employees, creating a supportive and appreciative work environment.",
                    residentValues: "Our residents honor and respect each other’s individuality and dignity, fostering a community where everyone feels valued. They also show respect to the staff, contributing to a harmonious and supportive environment.",
                    iconImage: "assets/images/handshake.png",
                  ),
                  const CoreValueWidget(
                    title: "Compassion",
                    employeeValues: "To approach our residents and their families with empathy and kindness, understanding the unique challenges they face. Our employees are encouraged to act with the same compassion, fostering a caring atmosphere.",
                    residentValues: "Our residents approach each other with empathy and kindness, understanding the unique challenges faced by fellow residents. They offer support and friendship, creating a caring and compassionate community.",
                    iconImage: "assets/images/hand_love.png",
                  ),
                  const CoreValueWidget(
                    title: "Excellence",
                    employeeValues: "Committed to maintaining high standards of care for our residents by continually learning and improving our services. Our employees are supported in their professional development to ensure they can deliver the best possible care.",
                    residentValues: "Our residents strive to maintain a high standard of living by actively participating in community activities and personal growth opportunities. Their dedication to self-improvement and community engagement enriches the overall atmosphere.",
                    iconImage: "assets/images/excellence.png",
                  ),
                  const CoreValueWidget(
                    title: "Family",
                    employeeValues: "To cultivate a tight-knit, family-oriented environment that feels warm and welcoming to our residents and their families. Our employees are part of this family, working together to create a home-like atmosphere.",
                    residentValues: "Our residents cultivate a family-oriented environment by building close-knit relationships and supporting one another. They welcome new residents warmly and contribute to a sense of belonging for everyone.",
                    iconImage: "assets/images/home.png",
                  ),
                  const CoreValueWidget(
                    title: "Integrity",
                    employeeValues: "To conduct all operations with transparency and honesty, building trust with our residents, their families, and our employees. This integrity ensures a reliable and trustworthy care experience for everyone involved.",
                    residentValues: "Our residents conduct themselves with honesty and transparency, building trust within the community. They are open in their interactions, fostering a reliable and trustworthy atmosphere.",
                    iconImage: "assets/images/shield.png",
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
                          "Provide holistic, compassionate care in a safe family like atmosphere to all our clients.",
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
                          "We envision a world where we revolutionize care by promoting a transformative and holistic approach. Through our innovative and compassionate services, we aim to set new standards of quality care and excellence, promoting better lives.",
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
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(Constants.primaryBlue()),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      width: double.infinity,
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
                              "Provide holistic, compassionate care in a safe family like atmosphere to all our clients.",
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
                const SizedBox(height: 13,),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(Constants.primaryWhite()),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Color(Constants.primaryBlue())
                          )
                      ),
                      width: double.infinity,
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
                              "We envision a world where we revolutionize care by promoting a transformative and holistic approach. Through our innovative and compassionate services, we aim to set new standards of quality care and excellence, promoting better lives.",
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
                const SizedBox(height: 25,),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: width > 820
                ? Column(
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
                      child: Image.asset("assets/images/founders.jpeg",fit: BoxFit.cover,),
                    ),
                    const SizedBox(width: 15,),
                    Container(
                      height: 400,
                      width: 400,
                      child: Text(
                        "At Adalena AFH, we believe in holistic health, which means caring for the whole person by addressing physical, mental, spiritual, and social needs. We understand that all these aspects affect overall health, and being unwell in one area impacts others. Our commitment is to provide compassionate and respectful care that considers each resident’s body, mind, spirit, culture, socioeconomic background, and environment.",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(Constants.primaryBlue()),
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 50,)
              ],
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
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
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                  child: Image.asset(
                    "assets/images/founders.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: 400,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                  child: Text(
                    "At Adalena AFH, we believe in holistic health, which means caring for the whole person by addressing physical, mental, spiritual, and social needs. We understand that all these aspects affect overall health, and being unwell in one area impacts others. Our commitment is to provide compassionate and respectful care that considers each resident’s body, mind, spirit, culture, socioeconomic background, and environment.",
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
          const SliverToBoxAdapter(
              child: ClipRRect(child: FooterWidget())
          ),
        ],
      ),
      drawer: const AdalenaDrawer(),
      endDrawer: const BookTourDrawer(),
    );
  }

}
