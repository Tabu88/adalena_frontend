import 'package:adult_family_home/controller/web_navigation_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../helpers/constants.dart';
import '../helpers/enums.dart';
import '../helpers/routes_enums.dart';
import '../routes.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  final WebNavigationController webNavigationController = Get.put(WebNavigationController());
  String unclePhone = "+1(253) 785-1180";
  String auntPhone = "+1(206) 806-3698";
  String landLine = "+1(253) 455-7706";
  final Uri _instaUrl = Uri.parse('https://www.instagram.com/adalenaafh/');
  final Uri _fbUrl = Uri.parse('https://www.google.com/maps/place/47%C2%B005\'16.1%22N+122%C2%B024\'30.3%22W/@47.087797,-122.4109952,17z/data=!3m1!4b1!4m4!3m3!8m2!3d47.087797!4d-122.4084203?hl=en&entry=ttu');
  final Uri _linkedUrl = Uri.parse('https://www.google.com/maps/place/47%C2%B005\'16.1%22N+122%C2%B024\'30.3%22W/@47.087797,-122.4109952,17z/data=!3m1!4b1!4m4!3m3!8m2!3d47.087797!4d-122.4084203?hl=en&entry=ttu');


  void _copyText(BuildContext context, String textToCopy) {
    Clipboard.setData(ClipboardData(text: textToCopy));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('Copied to clipboard!'),
        width: 250,
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        duration: Duration(seconds: 3),
      ),
    );
  }

  Future<void> _launchInsta() async {
    if (await canLaunchUrl(_instaUrl)) {
      await launchUrl(_instaUrl);
    } else {
      throw Exception('Could not launch $_instaUrl');
    }
  }

  Future<void> _launchFacebook() async {
    if (await canLaunchUrl(_fbUrl)) {
      await launchUrl(_fbUrl);
    } else {
      throw Exception('Could not launch $_fbUrl');
    }
  }

  Future<void> _launchLinkedIn() async {
    if (await canLaunchUrl(_linkedUrl)) {
      await launchUrl(_linkedUrl);
    } else {
      throw Exception('Could not launch $_linkedUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
      height: width > 700 ? 500 : width < 600 ? 840 : 400,
      width: double.infinity,
      color: Color(Constants.primaryBlue()),
      child: width > 700
          ? Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/Blue House bottom text.png",
                height: 180,
                width: 300,
              ),
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Icon(Icons.copyright,color: Colors.white,size: 20,),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    "${DateTime.now().year} Adalena",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 8,),
          const Divider(
            color: Color(0xFF76c352),
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: _launchInsta,
                          child: Image.asset("assets/images/insta.png",height: 50,width: 50,)),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                          onTap: _launchFacebook,
                          child: Image.asset("assets/images/facebook.png",height: 40,width: 40,)),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                          onTap: _launchLinkedIn,
                          child: Image.asset("assets/images/linkedin.png",height: 50,width: 50,)),
                    ],
                  ),
                  const SizedBox(height: 40,),
                  Row(
                    children: [
                      Image.asset("assets/images/phone.png",height: 30,width: 30,),
                      const SizedBox(width: 15,),
                      Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        alignment: WrapAlignment.start,
                        spacing: 5.0,
                        runSpacing: 8.0,
                        children: [
                          TextButton(
                            onPressed: () async {
                              if (kIsWeb) {
                                // Check if the platform is web
                                if (await canLaunch("tel:$unclePhone")) {
                              await launch("tel:$unclePhone");
                              } else {
                              throw 'Could not launch tel:$unclePhone';
                              }
                              } else {
                              // For non-web platforms (assume mobile)
                              if (await canLaunch("tel:$unclePhone")) {
                              await launch("tel:$unclePhone");
                              } else {
                              throw 'Could not launch tel:$unclePhone';
                              }
                              }
                            },
                            child: Text(
                              "253-785-1180",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600,
                                  color: Color(Constants.primaryWhite()),
                                  fontSize: 20
                              ),
                            ),
                          ),
                          Text("/",style: TextStyle(color: Color(Constants.primaryWhite()), fontSize: 18),),
                          TextButton(
                            onPressed: () async {
                              if (kIsWeb) {
                                // Check if the platform is web
                                if (await canLaunch("tel:$landLine")) {
                              await launch("tel:$landLine");
                              } else {
                              throw 'Could not launch tel:$landLine';
                              }
                              } else {
                              // For non-web platforms (assume mobile)
                              if (await canLaunch("tel:$landLine")) {
                              await launch("tel:$landLine");
                              } else {
                              throw 'Could not launch tel:$landLine';
                              }
                              }
                            },
                            child: Text(
                              "253-455-7706",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600,
                                  color: Color(Constants.primaryWhite()),
                                  fontSize: 20
                              ),
                            ),
                          ),
                          Text("/",style: TextStyle(color: Color(Constants.primaryWhite()), fontSize: 18),),
                          TextButton(
                            onPressed: () async {
                              if (kIsWeb) {
                                // Check if the platform is web
                                if (await canLaunch("tel:$auntPhone")) {
                              await launch("tel:$auntPhone");
                              } else {
                              throw 'Could not launch tel:$auntPhone';
                              }
                              } else {
                              // For non-web platforms (assume mobile)
                              if (await canLaunch("tel:$auntPhone")) {
                              await launch("tel:$auntPhone");
                              } else {
                              throw 'Could not launch tel:$auntPhone';
                              }
                              }
                            },
                            child: Text(
                              "206-806-3698",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600,
                                  color: Color(Constants.primaryWhite()),
                                  fontSize: 20
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Image.asset("assets/images/mail.png",height: 30,width: 30,),
                      const SizedBox(width: 15,),
                      TextButton(
                        onPressed: (){
                          _copyText(context, "adalenaafh@gmail.com");
                        },
                        child: const Text(
                          "adalenaafh@gmail.com",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontStyle: FontStyle.italic
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: (){
                      Get.toNamed(
                        Routes.getValueForRoute(RoutesEnum.aboutUs),
                      );
                    },
                    child: const Text(
                      "About Adalena",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: (){
                      Get.toNamed(
                        Routes.getValueForRoute(RoutesEnum.contactUs),
                      );
                    },
                    child: const Text(
                      "Contact Us",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xFF76C352),
                    radius: 30,
                    child: Image.asset(
                      "assets/images/disabled.png",
                      height: 40,
                      width: 40,
                    ),
                  )
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Column(
                  //      children: [
                  //        CircleAvatar(
                  //          backgroundColor: const Color(0xFF76C352),
                  //          radius: 30,
                  //          child: Image.asset("assets/images/house.png",height: 40,width: 40,),
                  //        ),
                  //        const Text(
                  //          "EQUAL HOUSING \n OPPORTUNITY",
                  //          style: TextStyle(
                  //            color: Color(0xFF76C352),
                  //            fontWeight: FontWeight.w600,
                  //            fontSize: 10
                  //          ),
                  //        )
                  //      ],
                  //    ),
                  //     const SizedBox(
                  //       width: 10,
                  //     ),
                  //     CircleAvatar(
                  //       backgroundColor: Color(0xFF76C352),
                  //       radius: 30,
                  //       child: Image.asset(
                  //         "assets/images/disabled.png",
                  //         height: 40,
                  //         width: 40,
                  //       ),
                  //     )
                  //   ],
                  // )
                ],
              )
            ],
          ),
          const SizedBox(height: 30,),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: (){
                    Get.toNamed(
                      Routes.getValueForRoute(RoutesEnum.privacyPolicy),
                    );
                  },
                  child: Text(
                      "PRIVACY POLICY",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 17
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                TextButton(
                  onPressed: (){
                    Get.toNamed(
                      Routes.getValueForRoute(RoutesEnum.terms),
                    );
                  },
                  child: Text(
                      "TERMS AND CONDITIONS",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 17
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )
          : width < 600
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          children : [
            Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                  child: Image.asset(
                    "assets/images/Blue House bottom text.png",
                    height: 100,
                    width: 200,
                  ),
                ),
            const SizedBox(height: 8,),
            const Divider(
              color: Color(0xFF76c352),
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: _launchInsta,
                    child: Image.asset("assets/images/insta.png",height: 50,width: 50,)),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: _launchFacebook,
                    child: Image.asset("assets/images/facebook.png",height: 40,width: 40,)),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: _launchLinkedIn,
                    child: Image.asset("assets/images/linkedin.png",height: 50,width: 50,)),
              ],
            ),
            const SizedBox(height: 12,),
            Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Wrap(
                              direction: Axis.horizontal,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              alignment: WrapAlignment.start,
                              spacing: 5.0,
                              runSpacing: 8.0,
                              children: [
                                Image.asset("assets/images/phone.png",height: 30,width: 30,),
                                const SizedBox(width: 10,),
                                TextButton(
                                  onPressed: () async {
                                    if (kIsWeb) {
                                      // Check if the platform is web
                                      if (await canLaunch("tel:$unclePhone")) {
                                    await launch("tel:$unclePhone");
                                    } else {
                                    throw 'Could not launch tel:$unclePhone';
                                    }
                                    } else {
                                    // For non-web platforms (assume mobile)
                                    if (await canLaunch("tel:$unclePhone")) {
                                    await launch("tel:$unclePhone");
                                    } else {
                                    throw 'Could not launch tel:$unclePhone';
                                    }
                                    }
                                  },
                                  child: Text(
                                    "253-785-1180",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w600,
                                        color: Color(Constants.primaryWhite()),
                                        fontSize: 20
                                    ),
                                  ),
                                ),
                                Text("/",style: TextStyle(color: Color(Constants.primaryWhite()), fontSize: 18),),
                                TextButton(
                                  onPressed: () async {
                                    if (kIsWeb) {
                                      // Check if the platform is web
                                      if (await canLaunch("tel:$landLine")) {
                                    await launch("tel:$landLine");
                                    } else {
                                    throw 'Could not launch tel:$landLine';
                                    }
                                    } else {
                                    // For non-web platforms (assume mobile)
                                    if (await canLaunch("tel:$landLine")) {
                                    await launch("tel:$landLine");
                                    } else {
                                    throw 'Could not launch tel:$landLine';
                                    }
                                    }
                                  },
                                  child: Text(
                                    "253-455-7706",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w600,
                                        color: Color(Constants.primaryWhite()),
                                        fontSize: 20
                                    ),
                                  ),
                                ),
                                Text("/",style: TextStyle(color: Color(Constants.primaryWhite()), fontSize: 18),),
                                TextButton(
                                  onPressed: () async {
                                    if (kIsWeb) {
                                      // Check if the platform is web
                                      if (await canLaunch("tel:$auntPhone")) {
                                    await launch("tel:$auntPhone");
                                    } else {
                                    throw 'Could not launch tel:$auntPhone';
                                    }
                                    } else {
                                    // For non-web platforms (assume mobile)
                                    if (await canLaunch("tel:$auntPhone")) {
                                    await launch("tel:$auntPhone");
                                    } else {
                                    throw 'Could not launch tel:$auntPhone';
                                    }
                                    }
                                  },
                                  child: Text(
                                    "206-806-3698",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w600,
                                        color: Color(Constants.primaryWhite()),
                                        fontSize: 20
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      ),
                      const SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/mail.png",height: 30,width: 30,),
                            const SizedBox(width: 10,),
                            TextButton(
                              onPressed: (){
                                _copyText(context, "adalenaafh@gmail.com");
                              },
                              child: const Text(
                                "adalenaafh@gmail.com",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (){
                      Get.toNamed(
                        Routes.getValueForRoute(RoutesEnum.aboutUs),
                      );
                    },
                    child: const Text(
                      "About Adalena",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: (){
                      Get.toNamed(
                        Routes.getValueForRoute(RoutesEnum.contactUs),
                      );
                    },
                    child: const Text(
                      "Contact Us",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xFF76C352),
                    radius: 30,
                    child: Image.asset(
                      "assets/images/disabled.png",
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 30,),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child:  Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Padding(
                          padding:  EdgeInsets.only(top: 3.0),
                          child: Icon(Icons.copyright,color: Colors.white,size: 14,),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          "${DateTime.now().year} Adalena",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    )
                  ),
                  TextButton(
                    onPressed: (){
                      Get.toNamed(
                        Routes.getValueForRoute(RoutesEnum.privacyPolicy),
                      );
                    },
                    child: const Text(
                      "PRIVACY POLICY",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 15
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextButton(
                    onPressed: (){
                      Get.toNamed(
                        Routes.getValueForRoute(RoutesEnum.terms),
                      );
                    },
                    child: const Text(
                      "TERMS AND CONDITIONS",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 15
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]
      )
          : Column(
        children : [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/Blue House bottom text.png",
                height: 100,
                width: 200,
              ),
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Icon(Icons.copyright,color: Colors.white,size: 14,),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    "${DateTime.now().year} Adalena",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 8,),
          const Divider(
            color: Color(0xFF76c352),
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: _launchInsta,
                          child: Image.asset("assets/images/insta.png",height: 25,width: 25,)),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: _launchFacebook,
                          child: Image.asset("assets/images/facebook.png",height: 25,width: 25,)),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: _launchLinkedIn,
                          child: Image.asset("assets/images/linkedin.png",height: 25,width: 25,)),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/images/phone.png",height: 20,width: 20,),
                      const SizedBox(width: 10,),
                      Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        alignment: WrapAlignment.start,
                        spacing: 5.0,
                        runSpacing: 8.0,
                        children: [
                          TextButton(
                            onPressed: () async {
                              if (kIsWeb) {
                                // Check if the platform is web
                                if (await canLaunch("tel:$unclePhone")) {
                              await launch("tel:$unclePhone");
                              } else {
                              throw 'Could not launch tel:$unclePhone';
                              }
                              } else {
                              // For non-web platforms (assume mobile)
                              if (await canLaunch("tel:$unclePhone")) {
                              await launch("tel:$unclePhone");
                              } else {
                              throw 'Could not launch tel:$unclePhone';
                              }
                              }
                            },
                            child: Text(
                              "253-785-1180",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600,
                                  color: Color(Constants.primaryWhite()),
                                  fontSize: 18
                              ),
                            ),
                          ),
                          Text("/",style: TextStyle(color: Color(Constants.primaryWhite()), fontSize: 18),),
                          TextButton(
                            onPressed: () async {
                              if (kIsWeb) {
                                // Check if the platform is web
                                if (await canLaunch("tel:$landLine")) {
                              await launch("tel:$landLine");
                              } else {
                              throw 'Could not launch tel:$landLine';
                              }
                              } else {
                              // For non-web platforms (assume mobile)
                              if (await canLaunch("tel:$landLine")) {
                              await launch("tel:$landLine");
                              } else {
                              throw 'Could not launch tel:$landLine';
                              }
                              }
                            },
                            child: Text(
                              "253-455-7706",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600,
                                  color: Color(Constants.primaryWhite()),
                                  fontSize: 18
                              ),
                            ),
                          ),
                          Text("/",style: TextStyle(color: Color(Constants.primaryWhite()), fontSize: 18),),
                          TextButton(
                            onPressed: () async {
                              if (kIsWeb) {
                                // Check if the platform is web
                                if (await canLaunch("tel:$auntPhone")) {
                              await launch("tel:$auntPhone");
                              } else {
                              throw 'Could not launch tel:$auntPhone';
                              }
                              } else {
                              // For non-web platforms (assume mobile)
                              if (await canLaunch("tel:$auntPhone")) {
                         await launch("tel:$auntPhone");
                              } else {
                              throw 'Could not launch tel:$auntPhone';
                              }
                              }
                            },
                            child: Text(
                              "206-806-3698",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600,
                                  color: Color(Constants.primaryWhite()),
                                  fontSize: 18
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      Image.asset("assets/images/mail.png",height: 20,width: 20,),
                      const SizedBox(width: 10,),
                      TextButton(
                        onPressed: (){
                          _copyText(context, "adalenaafh@gmail.com");
                        },
                        child: const Text(
                          "adalenaafh@gmail.com",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontStyle: FontStyle.italic
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: (){
                      Get.toNamed(
                        Routes.getValueForRoute(RoutesEnum.aboutUs),
                      );
                    },
                    child: const Text(
                      "About Adalena",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: (){
                      Get.toNamed(
                        Routes.getValueForRoute(RoutesEnum.contactUs),
                      );
                    },
                    child: const Text(
                      "Contact Us",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xFF76C352),
                    radius: 20,
                    child: Image.asset(
                      "assets/images/disabled.png",
                      height: 20,
                      width: 20,
                    ),
                  )
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     // Column(
                  //     //   children: [
                  //     //     CircleAvatar(
                  //     //       backgroundColor: const Color(0xFF76C352),
                  //     //       radius: 20,
                  //     //       child: Image.asset("assets/images/house.png",height: 20,width: 20,),
                  //     //     ),
                  //     //     const Text(
                  //     //       "EQUAL HOUSING \n OPPORTUNITY",
                  //     //       style: TextStyle(
                  //     //           color: Color(0xFF76C352),
                  //     //           fontWeight: FontWeight.w600,
                  //     //           fontSize: 10
                  //     //       ),
                  //     //     )
                  //     //   ],
                  //     // ),
                  //     const SizedBox(
                  //       width: 10,
                  //     ),
                  //
                  //   ],
                  // )
                ],
              )
            ],
          ),
          const SizedBox(height: 30,),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: (){
                    Get.toNamed(
                      Routes.getValueForRoute(RoutesEnum.privacyPolicy),
                    );
                  },
                  child: const  Text(
                    "PRIVACY POLICY",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 15
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                TextButton(
                  onPressed: (){
                    Get.toNamed(
                      Routes.getValueForRoute(RoutesEnum.terms),
                    );
                  },
                  child: const Text(
                    "TERMS AND CONDITIONS",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 15
                    ),
                  ),
                ),
              ],
            ),
          )
        ]
      ),
    );
  }
}
