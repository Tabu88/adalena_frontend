import 'dart:io';

import 'package:flutter/material.dart';

import '../helpers/constants.dart';

class CoreValueWidget extends StatelessWidget {
  final String title;
  final String employeeValues;
  final String residentValues;
  final String iconImage;
  final bool isExpanded;
  const CoreValueWidget({
    super.key,
    required this.title,
    required this.employeeValues,
    required this.residentValues,
    required this.iconImage,
    this.isExpanded = false
  });



  @override
  Widget build(BuildContext context) {
    double width  = MediaQuery.of(context).size.width;
    return width > 800
        ? SizedBox(
      height: 360,
      width: 850,
      child: Stack(
        children: [
          Positioned(
              left: 70,
              top: 15,
              bottom: 15,
              child: Container(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(Constants.primaryBlue())
                          )
                      ),
                      height: 350,
                      width: 250,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Color(Constants.primaryBlue())
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Color(Constants.primaryBlue()),
                      height: 400,
                      width: 450,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "For Employees",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Color(Constants.primaryGreen())
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              employeeValues,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: Color(Constants.primaryWhite())
                              ),
                              // overflow: TextOverflow.ellipsis,
                              // maxLines: 4,
                            ),
                          ),
                          Divider(
                            color: Color(Constants.primaryGreen()),
                          ),
                          Padding(
                            padding:const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "For Residents",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Color(Constants.primaryGreen())
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              residentValues,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: Color(Constants.primaryWhite())
                              ),
                              // overflow: TextOverflow.ellipsis,
                              // maxLines: 4,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
          ),
          Positioned(
            left: 0,
            top: 60,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Color(Constants.primaryBlue()),
              child: Image.asset(iconImage,height: 60,width: 60,),
            ),
          )
        ],
      ),
    )
        : ExpansionTile(
          initiallyExpanded: true,
          backgroundColor: Color(Constants.primaryWhite()),
          collapsedBackgroundColor: Color(Constants.primaryBlue()),
          iconColor: Color(Constants.primaryWhite()),
          expandedAlignment: Alignment.center,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Color(Constants.primaryBlue()),
                child: Image.asset(iconImage,height: 50,width: 50,),
              ),
              const SizedBox(width: 10,),
              Text(
                title,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Color(Constants.primaryGreen())
                ),
              ),
            ],
          ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "For Residents",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(Constants.primaryBlue())
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  residentValues,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(Constants.primaryBlue())
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "For Employees",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(Constants.primaryBlue())
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  employeeValues,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(Constants.primaryBlue())
                  ),
                ),
              ),
            ],
          );

  }

}
