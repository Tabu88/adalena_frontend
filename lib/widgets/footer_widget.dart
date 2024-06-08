import 'package:adult_family_home/controller/web_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/services.dart';
import '../helpers/constants.dart';
import '../helpers/enums.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  final WebNavigationController webNavigationController = Get.find<WebNavigationController>();

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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
      height: width > 700 ?500 : 380,
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
                      Image.asset("assets/images/insta.png",height: 50,width: 50,),
                      const SizedBox(
                        width: 15,
                      ),
                      Image.asset("assets/images/facebook.png",height: 40,width: 40,),
                      const SizedBox(
                        width: 15,
                      ),
                      Image.asset("assets/images/linkedin.png",height: 50,width: 50,),
                    ],
                  ),
                  const SizedBox(height: 40,),
                  Row(
                    children: [
                      Image.asset("assets/images/phone.png",height: 30,width: 30,),
                      const SizedBox(width: 15,),
                      TextButton(
                        onPressed: (){
                          _copyText(context, "206-806-3698");
                        },
                        child: const Text(
                          "206-806-3698",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontStyle: FontStyle.italic
                          ),
                        ),
                      )
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
                      webNavigationController.adalenaPageType.value = AdalenaPageType.aboutUs;
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
                      webNavigationController.adalenaPageType.value = AdalenaPageType.contactUs;
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                       children: [
                         CircleAvatar(
                           backgroundColor: const Color(0xFF76C352),
                           radius: 30,
                           child: Image.asset("assets/images/house.png",height: 40,width: 40,),
                         ),
                         const Text(
                           "EQUAL HOUSING \n OPPORTUNITY",
                           style: TextStyle(
                             color: Color(0xFF76C352),
                             fontWeight: FontWeight.w600,
                             fontSize: 10
                           ),
                         )
                       ],
                     ),
                      const SizedBox(
                        width: 10,
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
                    ],
                  )
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
                  onPressed: (){},
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
                  onPressed: (){},
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
                      Image.asset("assets/images/insta.png",height: 20,width: 20,),
                      const SizedBox(
                        width: 15,
                      ),
                      Image.asset("assets/images/facebook.png",height: 20,width: 20,),
                      const SizedBox(
                        width: 15,
                      ),
                      Image.asset("assets/images/linkedin.png",height: 20,width: 20,),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    children: [
                      Image.asset("assets/images/phone.png",height: 20,width: 20,),
                      const SizedBox(width: 10,),
                      TextButton(
                        onPressed: (){
                          _copyText(context, "206-806-3698");
                        },
                        child: const Text(
                          "206-806-3698",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontStyle: FontStyle.italic
                          ),
                        ),
                      )
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
                              fontSize: 15,
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
                      webNavigationController.adalenaPageType.value = AdalenaPageType.aboutUs;
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
                      webNavigationController.adalenaPageType.value = AdalenaPageType.contactUs;
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: const Color(0xFF76C352),
                            radius: 20,
                            child: Image.asset("assets/images/house.png",height: 20,width: 20,),
                          ),
                          const Text(
                            "EQUAL HOUSING \n OPPORTUNITY",
                            style: TextStyle(
                                color: Color(0xFF76C352),
                                fontWeight: FontWeight.w600,
                                fontSize: 10
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10,
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
                    ],
                  )
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
                  onPressed: (){},
                  child: Text(
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
                  onPressed: (){},
                  child: Text(
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
