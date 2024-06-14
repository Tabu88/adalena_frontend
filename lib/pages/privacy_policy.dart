import 'package:adult_family_home/widgets/footer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../helpers/constants.dart';
import '../helpers/routes_enums.dart';
import '../routes.dart';
import 'drawers/adalena_drawer.dart';
import 'drawers/book_tour_drawer.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
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
      body:  CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Wrap(
                    alignment : WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    spacing: double.infinity,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Privacy Policy",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 64,
                              color: Color(Constants.primaryGreen())
                          ),
                        ),
                      ),
                      Text(
                        "Updated June 2024",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 40,),
                  Text(
                    "This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 32,),
                  Text(
                      "We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Free Privacy Policy Generator.",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 40,),
                  Text(
                      "Interpretation and Definitions",
                    style: TextStyle(
                        fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(Constants.primaryGreen())
                    ),
                  ),//interpretation and definitions
                  const SizedBox(height: 32,),
                  Text(
                    "Interpretation",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 28,
                      color: Color(Constants.primaryGreen())
                    ),
                  ),//interpretation
                  const SizedBox(height: 32,),
                  Text(
                    "The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(Constants.primaryBlue())
                    ),
                  ),
                  const SizedBox(height: 32,),
                  Text(
                    "Definitions",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),//definitions
                  const SizedBox(height: 32,),
                  Text(
                    "For the purposes of this Privacy Policy:",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(Constants.primaryBlue())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                  ),
                                alignment: PlaceholderAlignment.middle
                              ),
                              TextSpan(
                                text: "Account ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(Constants.primaryGreen()),
                                  fontSize: 20
                                )
                              ),
                              TextSpan(
                                text: "means a unique account created for You to access our Service or parts of our Service.",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(Constants.primaryBlue())
                                )
                              )
                            ]
                          )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                  ),
                                  alignment: PlaceholderAlignment.middle
                              ),
                              TextSpan(
                                text: "Affiliate ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(Constants.primaryGreen()),
                                  fontSize: 20
                                )
                              ),
                              TextSpan(
                                text: "means an entity that controls, is controlled by or is under common control with a party, where \"control\" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(Constants.primaryBlue())
                                )
                              )
                            ]
                          )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                  ),
                                  alignment: PlaceholderAlignment.middle
                              ),
                              TextSpan(
                                text: "Company ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(Constants.primaryGreen()),
                                  fontSize: 20
                                )
                              ),
                              TextSpan(
                                text: "(referred to as either \"the Company\", \"We\", \"Us\" or \"Our\" in this Agreement) refers to Adalena Adult Family Home, 1525 186th St Ct E, Spanaway, WA 98387, USA.",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(Constants.primaryBlue())
                                )
                              )
                            ]
                          )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                  ),
                                  alignment: PlaceholderAlignment.middle
                              ),
                              TextSpan(
                                text: "Cookies ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(Constants.primaryGreen()),
                                  fontSize: 20
                                )
                              ),
                              TextSpan(
                                text: "are small files that are placed on Your computer, mobile device or any other device by a website, containing the details of Your browsing history on that website among its many uses.",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(Constants.primaryBlue())
                                )
                              )
                            ]
                          )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                  ),
                                  alignment: PlaceholderAlignment.middle
                              ),
                              TextSpan(
                                text: "Country ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(Constants.primaryGreen()),
                                  fontSize: 20
                                )
                              ),
                              TextSpan(
                                text: "refers to: Washington, United States",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(Constants.primaryBlue())
                                )
                              )
                            ]
                          )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                  ),
                                  alignment: PlaceholderAlignment.middle
                              ),
                              TextSpan(
                                text: "Device ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(Constants.primaryGreen()),
                                  fontSize: 20
                                )
                              ),
                              TextSpan(
                                text: "means any device that can access the Service such as a computer, a cellphone or a digital tablet.",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(Constants.primaryBlue())
                                )
                              )
                            ]
                          )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                  ),
                                  alignment: PlaceholderAlignment.middle
                              ),
                              TextSpan(
                                text: "Personal Data ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(Constants.primaryGreen()),
                                  fontSize: 20
                                )
                              ),
                              TextSpan(
                                text: "is any information that relates to an identified or identifiable individual.",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(Constants.primaryBlue())
                                )
                              )
                            ]
                          )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                  ),
                                  alignment: PlaceholderAlignment.middle
                              ),
                              TextSpan(
                                text: "Service ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(Constants.primaryGreen()),
                                  fontSize: 20
                                )
                              ),
                              TextSpan(
                                text: "refers to the Website.",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(Constants.primaryBlue())
                                )
                              )
                            ]
                          )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                  ),
                                  alignment: PlaceholderAlignment.middle
                              ),
                              TextSpan(
                                text: "Service Provider ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(Constants.primaryGreen()),
                                  fontSize: 20
                                )
                              ),
                              TextSpan(
                                text: "means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(Constants.primaryBlue())
                                )
                              )
                            ]
                          )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                  ),
                                  alignment: PlaceholderAlignment.middle
                              ),
                              TextSpan(
                                text: "Usage Data ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(Constants.primaryGreen()),
                                  fontSize: 20
                                )
                              ),
                              TextSpan(
                                text: "refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(Constants.primaryBlue())
                                )
                              )
                            ]
                          )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                  ),
                                  alignment: PlaceholderAlignment.middle
                              ),
                              TextSpan(
                                text: "Website ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(Constants.primaryGreen()),
                                  fontSize: 20
                                )
                              ),
                              TextSpan(
                                text: "refers to Adalenaadultfamilyhome, accessible from https://master--adalenafamilyhome.netlify.app/",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(Constants.primaryBlue())
                                )
                              )
                            ]
                          )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                  ),
                                  alignment: PlaceholderAlignment.middle
                              ),
                              TextSpan(
                                text: "You ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(Constants.primaryGreen()),
                                  fontSize: 20
                                )
                              ),
                              TextSpan(
                                text: "means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(Constants.primaryBlue())
                                )
                              )
                            ]
                          )
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32,),
                  Text(
                    "Collecting and Using Your Personal Data",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 32,),
                  Text(
                    "Types of Data Collected",
                    style: TextStyle(
                      color: Color(Constants.primaryGreen()),
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Personal Data",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 32,),
                  Text(
                    "While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "Email Address",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryBlue()),
                                          fontSize: 20
                                      )
                                  ),
                                ]
                            )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "Usage Data",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryBlue()),
                                          fontSize: 20
                                      )
                                  ),
                                ]
                            )
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Personal Data",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Usage Data is collected automatically when using the Service.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Usage Data may include information such as Your Device's Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                      "When You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.",
                  style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "We may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                      "Tracking Technologies and Cookies",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "We use Cookies and similar tracking technologies to track the activity on Our Service and store certain information. Tracking technologies used are beacons, tags, and scripts to collect and track information and to improve and analyze Our Service. The technologies We use may include:",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "Cookies or Browser Cookies: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryGreen()),
                                          fontSize: 20
                                      )
                                  ),
                                  TextSpan(
                                      text: "A cookie is a small file placed on Your Device. You can instruct Your browser to refuse all Cookies or to indicate when a Cookie is being sent. However, if You do not accept Cookies, You may not be able to use some parts of our Service. Unless you have adjusted Your browser setting so that it will refuse Cookies, our Service may use Cookies.",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(Constants.primaryBlue())
                                      )
                                  )
                                ]
                            )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "Web Beacons: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryGreen()),
                                          fontSize: 20
                                      )
                                  ),
                                  TextSpan(
                                      text: "Certain sections of our Service and our emails may contain small electronic files known as web beacons (also referred to as clear gifs, pixel tags, and single-pixel gifs) that permit the Company, for example, to count users who have visited those pages or opened an email and for other related website statistics (for example, recording the popularity of a certain section and verifying system and server integrity).",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(Constants.primaryBlue())
                                      )
                                  )
                                ]
                            )
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                      "Cookies can be \"Persistent\" or \"Session\" Cookies. Persistent Cookies remain on Your personal computer or mobile device when You go offline, while Session Cookies are deleted as soon as You close Your web browser. Learn more about cookies on the Free Privacy Policy website article.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 12,),
                  Text(
                      "We use both Session and Persistent Cookies for the purposes set out below:",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const  EdgeInsets.only(left: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "Necessary / Essential Cookies",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryGreen()),
                                          fontSize: 20
                                      )
                                  ),
                                ]
                            )
                        ),
                        const SizedBox(height: 15,),
                        Text(
                          "Type: Session Cookies",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(Constants.primaryBlue())
                            ),
                            textAlign: TextAlign.start
                        ),
                        const SizedBox(height: 15,),
                        Text(
                            "Administered by: Us",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(Constants.primaryBlue())
                            ),
                            textAlign: TextAlign.start
                        ),
                        const SizedBox(height: 15,),
                        Text(
                            "Purpose: These Cookies are essential to provide You with services available through the Website and to enable You to use some of its features. They help to authenticate users and prevent fraudulent use of user accounts. Without these Cookies, the services that You have asked for cannot be provided, and We only use these Cookies to provide You with those services.",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(Constants.primaryBlue())
                            ),
                            textAlign: TextAlign.start
                        ),
                        const SizedBox(height: 20,),
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "Cookies Policy / Notice Acceptance Cookies",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryGreen()),
                                          fontSize: 20
                                      )
                                  ),
                                ]
                            )
                        ),
                        const SizedBox(height: 15,),
                        Text(
                            "Type: Persistent Cookies",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(Constants.primaryBlue())
                            ),
                            textAlign: TextAlign.start
                        ),
                        const SizedBox(height: 15,),
                        Text(
                            "Administered by: Us",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(Constants.primaryBlue())
                            ),
                            textAlign: TextAlign.start
                        ),
                        const SizedBox(height: 15,),
                        Text(
                            "Purpose: These Cookies identify if users have accepted the use of cookies on the Website.",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(Constants.primaryBlue())
                            ),
                            textAlign: TextAlign.start
                        ),
                        const SizedBox(height: 20,),
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "Functionality Cookies",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryGreen()),
                                          fontSize: 20
                                      )
                                  ),
                                ]
                            )
                        ),
                        const SizedBox(height: 15,),
                        Text(
                            "Type: Persistent Cookies",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(Constants.primaryBlue())
                            ),
                            textAlign: TextAlign.start
                        ),
                        const SizedBox(height: 15,),
                        Text(
                            "Administered by: Us",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(Constants.primaryBlue())
                            ),
                            textAlign: TextAlign.start
                        ),
                        const SizedBox(height: 15,),
                        Text(
                            "Purpose: These Cookies allow us to remember choices You make when You use the Website, such as remembering your login details or language preference. The purpose of these Cookies is to provide You with a more personal experience and to avoid You having to re-enter your preferences every time You use the Website.",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(Constants.primaryBlue())
                            ),
                            textAlign: TextAlign.start
                        ),
                        const SizedBox(height: 20,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                      "For more information about the cookies we use and your choices regarding cookies, please visit our Cookies Policy or the Cookies section of our Privacy Policy.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Use of Your Personal Data",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                      "The Company may use Personal Data for the following purposes:",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "To provide and maintain our Service: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryGreen()),
                                          fontSize: 20
                                      )
                                  ),
                                  TextSpan(
                                      text: " including to monitor the usage of our Service.",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(Constants.primaryBlue())
                                      )
                                  )
                                ]
                            )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "To manage Your Account: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryGreen()),
                                          fontSize: 20
                                      )
                                  ),
                                  TextSpan(
                                      text: "to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(Constants.primaryBlue())
                                      )
                                  )
                                ]
                            )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "For the performance of a contract: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryGreen()),
                                          fontSize: 20
                                      )
                                  ),
                                  TextSpan(
                                      text: "the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(Constants.primaryBlue())
                                      )
                                  )
                                ]
                            )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "To contact You: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryGreen()),
                                          fontSize: 20
                                      )
                                  ),
                                  TextSpan(
                                      text: "To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application's push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(Constants.primaryBlue())
                                      )
                                  )
                                ]
                            )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "To provide You ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryGreen()),
                                          fontSize: 20
                                      )
                                  ),
                                  TextSpan(
                                      text: "with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(Constants.primaryBlue())
                                      )
                                  )
                                ]
                            )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "To manage Your requests: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryGreen()),
                                          fontSize: 20
                                      )
                                  ),
                                  TextSpan(
                                      text: "To attend and manage Your requests to Us.",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(Constants.primaryBlue())
                                      )
                                  )
                                ]
                            )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "For business transfers: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryGreen()),
                                          fontSize: 20
                                      )
                                  ),
                                  TextSpan(
                                      text: "We may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred.",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(Constants.primaryBlue())
                                      )
                                  )
                                ]
                            )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "For other purposes: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryGreen()),
                                          fontSize: 20
                                      )
                                  ),
                                  TextSpan(
                                      text: "We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience.",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(Constants.primaryBlue())
                                      )
                                  )
                                ]
                            )
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                      "We may share Your personal information in the following situations:",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "With Service Providers: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryGreen()),
                                          fontSize: 20
                                      )
                                  ),
                                  TextSpan(
                                      text: "We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to contact You.",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(Constants.primaryBlue())
                                      )
                                  )
                                ]
                            )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "For business transfers: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryGreen()),
                                          fontSize: 20
                                      )
                                  ),
                                  TextSpan(
                                      text: "We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company.",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(Constants.primaryBlue())
                                      )
                                  )
                                ]
                            )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "With Affiliates: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryGreen()),
                                          fontSize: 20
                                      )
                                  ),
                                  TextSpan(
                                      text: "We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us.",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(Constants.primaryBlue())
                                      )
                                  )
                                ]
                            )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "With business partners: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryGreen()),
                                          fontSize: 20
                                      )
                                  ),
                                  TextSpan(
                                      text: "We may share Your information with Our business partners to offer You certain products, services or promotions.",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(Constants.primaryBlue())
                                      )
                                  )
                                ]
                            )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "With other users: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryGreen()),
                                          fontSize: 20
                                      )
                                  ),
                                  TextSpan(
                                      text: "when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside.",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(Constants.primaryBlue())
                                      )
                                  )
                                ]
                            )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "With Your consent: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryGreen()),
                                          fontSize: 20
                                      )
                                  ),
                                  TextSpan(
                                      text: "We may disclose Your personal information for any other purpose with Your consent.",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(Constants.primaryBlue())
                                      )
                                  )
                                ]
                            )
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Retention of Your Personal Data",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                      "The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Text(
                      "The Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Transfer of Your Personal Data",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Your information, including Personal Data, is processed at the Company's operating offices and in any other places where the parties involved in the processing are located. It means that this information may be transferred to — and maintained on — computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Your consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "The Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Delete Your Personal Data",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "You have the right to delete or request that We assist in deleting the Personal Data that We have collected about You.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Our Service may give You the ability to delete certain information about You from within the Service.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "You may update, amend, or delete Your information at any time by signing in to Your Account, if you have one, and visiting the account settings section that allows you to manage Your personal information. You may also contact Us to request access to, correct, or delete any personal information that You have provided to Us.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Text(
                      "Please note, however, that We may need to retain certain information when we have a legal obligation or lawful basis to do so.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Disclosure of Your Personal Data",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                      "Business Transactions",
                      style: TextStyle(
                          fontSize: 30,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "If the Company is involved in a merger, acquisition or asset sale, Your Personal Data may be transferred. We will provide notice before Your Personal Data is transferred and becomes subject to a different Privacy Policy.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Text(
                      "Law enforcement",
                      style: TextStyle(
                          fontSize: 30,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Under certain circumstances, the Company may be required to disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency).",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Text(
                      "Other legal requirements",
                      style: TextStyle(
                          fontSize: 30,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Text(
                      "The Company may disclose your Personal Data in the good faith belief that such action is necessary to:",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "Comply with a legal obligation",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryBlue()),
                                          fontSize: 20
                                      )
                                  ),
                                ]
                            )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "Protect and defend the rights or property of the Company",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryBlue()),
                                          fontSize: 20
                                      )
                                  ),
                                ]
                            )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "Prevent or investigate possible wrongdoing in connection with the Service",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryBlue()),
                                          fontSize: 20
                                      )
                                  ),
                                ]
                            )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "Protect the personal safety of Users of the Service or the public",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryBlue()),
                                          fontSize: 20
                                      )
                                  ),
                                ]
                            )
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "Protect against legal liability",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryBlue()),
                                          fontSize: 20
                                      )
                                  ),
                                ]
                            )
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                      "Security of Your Personal Data",
                      style: TextStyle(
                          fontSize: 30,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 20,),
                  Text(
                      "Children's Privacy",
                      style: TextStyle(
                          fontSize: 35,
                          color: Color(Constants.primaryGreen()),
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Our Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "If we need to rely on consent as a legal basis for processing Your information and Your country requires consent from a parent, We may require Your parent's consent before We collect and use that information.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 20,),
                  Text(
                      "Links to Other Websites",
                      style: TextStyle(
                          fontSize: 35,
                          color: Color(Constants.primaryGreen()),
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Our Service may contain links to other websites that are not operated by Us. If You click on a third party link, You will be directed to that third party's site. We strongly advise You to review the Privacy Policy of every site You visit.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 20,),
                  Text(
                      "Changes to this Privacy Policy",
                      style: TextStyle(
                          fontSize: 35,
                          color: Color(Constants.primaryGreen()),
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "We will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the \"Last updated\" date at the top of this Privacy Policy.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 20,),
                  Text(
                      "Contact Us",
                      style: TextStyle(
                          fontSize: 35,
                          color: Color(Constants.primaryGreen()),
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "If you have any questions about this Privacy Policy, You can contact us:",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(Constants.primaryBlue())
                      ),
                      textAlign: TextAlign.start
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.circle,size: 10,color: Color(Constants.primaryBlue()),),
                                      ),
                                      alignment: PlaceholderAlignment.middle
                                  ),
                                  TextSpan(
                                      text: "By email: adalenaafh@gmail.com",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryBlue()),
                                          fontSize: 20
                                      )
                                  ),
                                ]
                            )
                        ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: FooterWidget(),
          )
        ],
      ),
      drawer: const AdalenaDrawer(),
      endDrawer: const BookTourDrawer(),
    );
  }
}
