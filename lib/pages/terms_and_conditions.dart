import 'package:adult_family_home/widgets/footer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../helpers/constants.dart';
import '../helpers/routes_enums.dart';
import '../routes.dart';
import 'drawers/adalena_drawer.dart';
import 'drawers/book_tour_drawer.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({super.key});

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    alignment : WrapAlignment.spaceBetween,
                    spacing: double.infinity,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Terms and Conditions",
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
                    "Please read these terms and conditions carefully before using Our Service.",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(Constants.primaryBlue())
                    ),
                  ),//small text
                  const SizedBox(height: 20,),
                  Text(
                    "Interpretation and Definitions",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),//small headline
                  const SizedBox(height: 20,),
                  Text(
                    "Interpretation",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),//title
                  const SizedBox(height: 15,),
                  Text(
                    "The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Definitions",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "For the purposes of these Terms and Conditions:",
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
                                      text: "Terms and Conditions ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryGreen()),
                                          fontSize: 20
                                      )
                                  ),
                                  TextSpan(
                                      text: "(also referred as \"Terms\") mean these Terms and Conditions that form the entire agreement between You and the Company regarding the use of the Service. This Terms and Conditions agreement has been created with the help of the Free Terms and Conditions Generator.",
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
                                      text: "Third-party Social Media Service ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(Constants.primaryGreen()),
                                          fontSize: 20
                                      )
                                  ),
                                  TextSpan(
                                      text: "means any services or content (including data, information, products or services) provided by a third-party that may be displayed, included or made available by the Service.",
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
                                      text: "refers to Adalena Adult Family Home, accessible from https://master--adalenafamilyhome.netlify.app/.",
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
                  const SizedBox(height: 20,),
                  Text(
                    "Acknowledgment",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "These are the Terms and Conditions governing the use of this Service and the agreement that operates between You and the Company. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Your access to and use of the Service is conditioned on Your acceptance of and compliance with these Terms and Conditions. These Terms and Conditions apply to all visitors, users and others who access or use the Service.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "By accessing or using the Service You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access the Service.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "You represent that you are over the age of 18. The Company does not permit those under 18 to use the Service.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Your access to and use of the Service is also conditioned on Your acceptance of and compliance with the Privacy Policy of the Company. Our Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your personal information when You use the Application or the Website and tells You about Your privacy rights and how the law protects You. Please read Our Privacy Policy carefully before using Our Service.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Links to Other Websites",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Our Service may contain links to third-party web sites or services that are not owned or controlled by the Company.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "The Company has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that the Company shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with the use of or reliance on any such content, goods or services available on or through any such web sites or services.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "We strongly advise You to read the terms and conditions and privacy policies of any third-party web sites or services that You visit.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Termination",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "We may terminate or suspend Your access immediately, without prior notice or liability, for any reason whatsoever, including without limitation if You breach these Terms and Conditions.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Upon termination, Your right to use the Service will cease immediately.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Limitation of Liability",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Not withstanding any damages that You might incur, the entire liability of the Company and any of its suppliers under any provision of this Terms and Your exclusive remedy for all of the foregoing shall be limited to the amount actually paid by You through the Service or 100 USD if You haven't purchased anything through the Service.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "To the maximum extent permitted by applicable law, in no event shall the Company or its suppliers be liable for any special, incidental, indirect, or consequential damages whatsoever (including, but not limited to, damages for loss of profits, loss of data or other information, for business interruption, for personal injury, loss of privacy arising out of or in any way related to the use of or inability to use the Service, third-party software and/or third-party hardware used with the Service, or otherwise in connection with any provision of this Terms), even if the Company or any supplier has been advised of the possibility of such damages and even if the remedy fails of its essential purpose.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Some states do not allow the exclusion of implied warranties or limitation of liability for incidental or consequential damages, which means that some of the above limitations may not apply. In these states, each party's liability will be limited to the greatest extent permitted by law.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "\"AS IS\" and \"AS AVAILABLE\" Disclaimer",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "The Service is provided to You \"AS IS\" and \"AS AVAILABLE\" and with all faults and defects without warranty of any kind. To the maximum extent permitted under applicable law, the Company, on its own behalf and on behalf of its Affiliates and its and their respective licensors and service providers, expressly disclaims all warranties, whether express, implied, statutory or otherwise, with respect to the Service, including all implied warranties of merchantability, fitness for a particular purpose, title and non-infringement, and warranties that may arise out of course of dealing, course of performance, usage or trade practice. Without limitation to the foregoing, the Company provides no warranty or undertaking, and makes no representation of any kind that the Service will meet Your requirements, achieve any intended results, be compatible or work with any other software, applications, systems or services, operate without interruption, meet any performance or reliability standards or be error free or that any errors or defects can or will be corrected.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Without limiting the foregoing, neither the Company nor any of the company's provider makes any representation or warranty of any kind, express or implied: (i) as to the operation or availability of the Service, or the information, content, and materials or products included thereon; (ii) that the Service will be uninterrupted or error-free; (iii) as to the accuracy, reliability, or currency of any information or content provided through the Service; or (iv) that the Service, its servers, the content, or e-mails sent from or on behalf of the Company are free of viruses, scripts, trojan horses, worms, malware, timebombs or other harmful components.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Some jurisdictions do not allow the exclusion of certain types of warranties or limitations on applicable statutory rights of a consumer, so some or all of the above exclusions and limitations may not apply to You. But in such a case the exclusions and limitations set forth in this section shall be applied to the greatest extent enforceable under applicable law.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Governing Law",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "The laws of the Country, excluding its conflicts of law rules, shall govern this Terms and Your use of the Service. Your use of the Application may also be subject to other local, state, national, or international laws",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Disputes Resolution",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "If You have any concern or dispute about the Service, You agree to first try to resolve the dispute informally by contacting the Company.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "For European Union (EU) Users",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "If You are a European Union consumer, you will benefit from any mandatory provisions of the law of the country in which You are resident.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "United States Legal Compliance",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "You represent and warrant that (i) You are not located in a country that is subject to the United States government embargo, or that has been designated by the United States government as a \"terrorist supporting\" country, and (ii) You are not listed on any United States government list of prohibited or restricted parties.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Severability and Waiver",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Severability",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(Constants.primaryBlue())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "If any provision of these Terms is held to be unenforceable or invalid, such provision will be changed and interpreted to accomplish the objectives of such provision to the greatest extent possible under applicable law and the remaining provisions will continue in full force and effect.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Waiver",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(Constants.primaryBlue())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Except as provided herein, the failure to exercise a right or to require performance of an obligation under these Terms shall not affect a party's ability to exercise such right or require such performance at any time thereafter nor shall the waiver of a breach constitute a waiver of any subsequent breach.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Translation Interpretation",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "These Terms and Conditions may have been translated if We have made them available to You on our Service. You agree that the original English text shall prevail in the case of a dispute.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Changes to These Terms and Conditions",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "We reserve the right, at Our sole discretion, to modify or replace these Terms at any time. If a revision is material We will make reasonable efforts to provide at least 30 days' notice prior to any new terms taking effect. What constitutes a material change will be determined at Our sole discretion.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "By continuing to access or use Our Service after those revisions become effective, You agree to be bound by the revised terms. If You do not agree to the new terms, in whole or in part, please stop using the website and the Service.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Contact Us",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                  const SizedBox(height: 15,),
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
