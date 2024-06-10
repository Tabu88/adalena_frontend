import 'package:adult_family_home/controller/web_navigation_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';
import '../helpers/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../helpers/enums.dart';

class TourWidget extends StatefulWidget {
  const TourWidget({super.key});

  @override
  State<TourWidget> createState() => _TourWidgetState();
}

class _TourWidgetState extends State<TourWidget> {
  final WebNavigationController _webNavigationController = Get.find<WebNavigationController>();
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-23.5557714, -46.6395571);
  final Uri _url = Uri.parse('https://www.google.com/maps/place/9525+N+Fort+Washington+Rd,+Fresno,+CA+93730/@36.87469,-119.774369,16z/data=!4m6!3m5!1s0x809442890fadf959:0x35fb332a30c2b5!8m2!3d36.87469!4d-119.7743688!16s%2Fg%2F11c3q3y2f9?hl=en-US&entry=ttu');

  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }


  @override
  Widget build(BuildContext context) {
    double width  = MediaQuery.of(context).size.width;
    return Container(
      color: Color(Constants.primaryWhite()),
      height: width > 700 ? 750 : 1040,
      width: double.infinity,
      child: width > 700
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
            child: Text(
              "Visit Us for a Tour",
              style: TextStyle(
                color: Color(Constants.primaryGreen()),
                fontStyle: FontStyle.italic,
                fontSize: 48,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(Constants.primaryBlue()),
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                    )
                  ),
                    child: ListTile(
                        title: Text(
                          "Request for a tour",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(Constants.primaryWhite())
                          ),
                        ),
                        trailing: Image.asset(
                          "assets/images/calendar.png"
                          ,height: 40,
                          width: 40,),
                      ),

                ),
              ),
              const SizedBox(width: 40,),
              SizedBox(
                height: 70,
                width: 300,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    elevation: 3.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero
                      )
                  ),
                  onPressed: (){
                    _webNavigationController.adalenaPageType.value = AdalenaPageType.contactUs;
                  },
                  child: ListTile(
                    title: Text(
                      "Contact Us Today",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(Constants.primaryBlue())
                      ),
                    ),
                    trailing: Image.asset(
                        "assets/images/green_phone.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      color: Color(Constants.primaryWhite()),
                    ),
                    Container(
                      height: 250,
                      width: double.infinity,
                      color: Color(Constants.primaryBlue()),
                      child:  Row(
                        children: [
                          const Expanded(
                            flex: 6,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              "Fairwinds – Woodward Park was designed and built with resort-style senior living in mind. Located in the prestigious northeast Fresno neighborhood, we enjoy a view of the Sierra Nevada mountain range. Upscale and casual restaurants and shopping is conveniently located within walking distance. We are just a short drive from Kaiser Permanente, Saint Agnes, and Clovis Community Hospitals, giving residents and their families peace of mind, knowing hospital care is close by if needed.",
                              style: TextStyle(
                                color: Color(Constants.primaryWhite()),
                                fontSize: 18,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 9,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 400,
                  width: double.infinity,
                  child:Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 6,
                        child: GoogleMap(
                          scrollGesturesEnabled: false,
                          initialCameraPosition: CameraPosition(
                            target: _center,
                            zoom: 15.0,
                          ),
                          markers: {
                            Marker(
                              markerId: const MarkerId("_adalenaLocation"),
                              icon: BitmapDescriptor.defaultMarker,
                              position: _center,
                              infoWindow:  InfoWindow(
                                  title:  "9525 N Fort Washington Rd",
                                snippet: "9525 N Fort Washington Rd, Fresno, CA 92730, USA ",
                                onTap:  _launchMap,
                              )
                            )
                          },
                        )
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            Text(
                                "Adalena Family Home",
                                style: TextStyle(
                                  color: Color(Constants.primaryBlue()),
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            const SizedBox(height: 8),
                            Padding(
                                padding: EdgeInsets.all(8.0),
                              child:  ListTile(
                                  leading: Image.asset(
                                      "assets/images/location_pin.png",
                                    height: 40,
                                    width: 40,
                                  ),
                                  title: Text(
                                    "Bethesda Street, St.Matthews Rd",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w600,
                                      color: Color(Constants.primaryBlue()),
                                      fontSize: 20
                                    ),
                                  ),
                                ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                                padding: EdgeInsets.all(8.0),
                              child: ListTile(
                                  leading: Image.asset(
                                      "assets/images/phone_blue.png",
                                    height: 40,
                                    width: 40,
                                  ),
                                  title: Text(
                                    "425-775-4440",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w600,
                                      color: Color(Constants.primaryBlue()),
                                      fontSize: 20
                                    ),
                                  ),
                                ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
            child: Text(
              "Visit Us for a Tour",
              style: TextStyle(
                  color: Color(Constants.primaryGreen()),
                  fontStyle: FontStyle.italic,
                  fontSize: 40,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 70,
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(Constants.primaryBlue()),
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                  )
              ),
              child: ListTile(
                title: Text(
                  "Request for a tour",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(Constants.primaryWhite())
                  ),
                ),
                trailing: Image.asset(
                  "assets/images/calendar.png"
                  ,height: 40,
                  width: 40,),
              ),

            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 70,
            width: 300,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                  )
              ),
              onPressed: (){
                _webNavigationController.adalenaPageType.value = AdalenaPageType.contactUs;
              },
              child: ListTile(
                title: Text(
                  "Contact Us Today",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(Constants.primaryBlue())
                  ),
                ),
                trailing: Image.asset(
                  "assets/images/green_phone.png",
                  height: 40,
                  width: 40,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 400,
                        width: double.infinity,
                        color: Color(Constants.primaryWhite()),
                      ),
                      Container(
                        height: 250,
                        width: double.infinity,
                        color: Color(Constants.primaryBlue()),
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                          child: Text(
                            "Fairwinds – Woodward Park was designed and built with resort-style senior living in mind. Located in the prestigious northeast Fresno neighborhood, we enjoy a view of the Sierra Nevada mountain range. Upscale and casual restaurants and shopping is conveniently located within walking distance. We are just a short drive from Kaiser Permanente, Saint Agnes, and Clovis Community Hospitals, giving residents and their families peace of mind, knowing hospital care is close by if needed.",
                            style: TextStyle(
                              color: Color(Constants.primaryWhite()),
                              fontSize: width <580 ? 15 :18,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 9,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 550,
                  width: double.infinity,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 240,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              "Adalena Family Home",
                              style: TextStyle(
                                color: Color(Constants.primaryBlue()),
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child:  ListTile(
                                leading: Image.asset(
                                  "assets/images/location_pin.png",
                                  height: 40,
                                  width: 40,
                                ),
                                title: Text(
                                  "Bethesda Street, St.Matthews Rd",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w600,
                                      color: Color(Constants.primaryBlue()),
                                      fontSize: 20
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: Image.asset(
                                  "assets/images/phone_blue.png",
                                  height: 40,
                                  width: 40,
                                ),
                                title: Text(
                                  "206-806-3698",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w600,
                                      color: Color(Constants.primaryBlue()),
                                      fontSize: 20
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),
                      SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: GoogleMap(
                            scrollGesturesEnabled: false,
                            initialCameraPosition: CameraPosition(
                              target: _center,
                              zoom: 15.0,
                            ),
                            markers: {
                              Marker(
                                  markerId: const MarkerId("_adalenaLocation"),
                                  icon: BitmapDescriptor.defaultMarker,
                                  position: _center,
                                  infoWindow: InfoWindow(
                                    title: "9525 N Fort Washington Rd",
                                    snippet:
                                        "9525 N Fort Washington Rd, Fresno, CA 92730, USA ",
                                    onTap: _launchMap,
                                  ))
                            },
                          ),
                        ),
                      ],
                  ),
                ),
              )
            ]
          )
        ]
      ),
    );
  }

  Future<void> _launchMap() async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw Exception('Could not launch $_url');
      }
  }

}
