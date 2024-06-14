import 'package:adult_family_home/controller/web_navigation_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';
import '../helpers/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../helpers/enums.dart';
import '../helpers/routes_enums.dart';
import '../routes.dart';

class TourWidget extends StatefulWidget {
  const TourWidget({super.key});

  @override
  State<TourWidget> createState() => _TourWidgetState();
}

class _TourWidgetState extends State<TourWidget> {
  final WebNavigationController _webNavigationController = Get.find<WebNavigationController>();
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(47.087797, -122.408420);
  final Uri _url = Uri.parse('https://www.google.com/maps/place/47%C2%B005\'16.1%22N+122%C2%B024\'30.3%22W/@47.087797,-122.4109952,17z/data=!3m1!4b1!4m4!3m3!8m2!3d47.087797!4d-122.4084203?hl=en&entry=ttu');
  String unclePhone = "+1(253) 785-1180";
  String auntPhone = "+1(206) 806-3698";
  String landLine = "+1(253) 455-7706";
  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }


  @override
  Widget build(BuildContext context) {
    double width  = MediaQuery.of(context).size.width;
    return Container(
      color: Color(Constants.primaryWhite()),
      height: width > 1300 ? 900 : width > 830 ? 950 : 1300,
      width: double.infinity,
      child: width > 1300
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
                    Get.toNamed(
                      Routes.getValueForRoute(RoutesEnum.contactUs),
                    );
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
                      height: 400,
                      width: double.infinity,
                      color: Color(Constants.primaryBlue()),
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child:  Row(
                        children: [
                          const Expanded(
                            flex: 6,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 4,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Adalena Family Home was designed with family-like senior living in mind.Located in the Spanaway neighbourhood ,we are just a short drive from Spanaway, Franciscan and Greater Lakes Community Hospitals , giving residents and their families peace of mind , knowing hospital care is close by if needed. We are also in close proximity to Spanaway Lake Boat House , Naches Trail Preserve, Mission Hills Community Park, Spanaway park and Cross park providing residents with easy access to natural settings for leisurely walks , picnics and outdoor activities that promote physical and mental well-being. Additionally, upscale and casual restaurants , as well as shopping are conveniently within walking distance. ",
                                style: TextStyle(
                                  color: Color(Constants.primaryWhite()),
                                  fontSize: 20,
                                ),
                                // overflow: TextOverflow.ellipsis,
                                // maxLines: 9,
                              ),
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
                                  title: Text.rich(
                                    TextSpan(
                                      children: <InlineSpan> [
                                        TextSpan(
                                          text: '186',
                                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,fontStyle: FontStyle.italic,color: Color(Constants.primaryBlue())),
                                        ),
                                        WidgetSpan(
                                          child: Transform.translate(
                                            offset: const Offset(0, -8),
                                            child: Text(
                                              'th',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                  color: Color(Constants.primaryBlue())
                                              ),
                                            ),
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' St Ct E, 14',
                                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,fontStyle: FontStyle.italic,color: Color(Constants.primaryBlue())),
                                        ),
                                        WidgetSpan(
                                          child: Transform.translate(
                                            offset: const Offset(0, -8),
                                            child: Text(
                                              'th',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                  color: Color(Constants.primaryBlue())
                                              ),
                                            ),
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' Avenue',
                                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,fontStyle: FontStyle.italic,color: Color(Constants.primaryBlue())),
                                        ),
                                      ],
                                    ),
                                  )
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
                                  title: Wrap(
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
                                              color: Color(Constants.primaryBlue()),
                                              fontSize: 20
                                          ),
                                        ),
                                      ),
                                      Text("/"),
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
                                              color: Color(Constants.primaryBlue()),
                                              fontSize: 20
                                          ),
                                        ),
                                      ),
                                      const Text("/"),
                                      TextButton(
                                        onPressed: () async {
                                          if (kIsWeb)  {
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
                                              color: Color(Constants.primaryBlue()),
                                              fontSize: 20
                                          ),
                                        ),
                                      ),
                                    ],
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
          : width > 830
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
                    Get.toNamed(
                      Routes.getValueForRoute(RoutesEnum.contactUs),
                    );
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
                      height: 300,
                      width: double.infinity,
                      color: Color(Constants.primaryWhite()),
                    ),
                    Container(
                      height: 400,
                      width: double.infinity,
                      color: Color(Constants.primaryBlue()),
                      padding: const EdgeInsets.only(top: 130),
                      child:  SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Adalena Family Home was designed with family-like senior living in mind.Located in the Spanaway neighbourhood ,we are just a short drive from Spanaway, Franciscan and Greater Lakes Community Hospitals , giving residents and their families peace of mind , knowing hospital care is close by if needed. We are also in close proximity to Spanaway Lake Boat House , Naches Trail Preserve, Mission Hills Community Park, Spanaway park and Cross park providing residents with easy access to natural settings for leisurely walks , picnics and outdoor activities that promote physical and mental well-being. Additionally, upscale and casual restaurants , as well as shopping are conveniently within walking distance. ",
                            style: TextStyle(
                              color: Color(Constants.primaryWhite()),
                              fontSize: 20,
                            ),
                            // overflow: TextOverflow.ellipsis,
                            // maxLines: 9,
                          ),
                        ),
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
                                title: Text.rich(
                                  TextSpan(
                                    children: <InlineSpan> [
                                      TextSpan(
                                        text: '186',
                                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,fontStyle: FontStyle.italic,color: Color(Constants.primaryBlue())),
                                      ),
                                      WidgetSpan(
                                        child: Transform.translate(
                                          offset: const Offset(0, -8),
                                          child: Text(
                                            'th',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                                color: Color(Constants.primaryBlue())
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' St Ct E, 14',
                                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,fontStyle: FontStyle.italic,color: Color(Constants.primaryBlue())),
                                      ),
                                      WidgetSpan(
                                        child: Transform.translate(
                                          offset: const Offset(0, -8),
                                          child: Text(
                                            'th',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                                color: Color(Constants.primaryBlue())
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' Avenue',
                                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,fontStyle: FontStyle.italic,color: Color(Constants.primaryBlue())),
                                      ),
                                    ],
                                  ),
                                )
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
                                title: Wrap(
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
                                            color: Color(Constants.primaryBlue()),
                                            fontSize: 20
                                        ),
                                      ),
                                    ),
                                    const Text("/"),
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
                                            color: Color(Constants.primaryBlue()),
                                            fontSize: 20
                                        ),
                                      ),
                                    ),
                                    const Text("/"),
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
                                            color: Color(Constants.primaryBlue()),
                                            fontSize: 20
                                        ),
                                      ),
                                    ),
                                  ],
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
                onPressed: () {
                  Get.toNamed(
                    Routes.getValueForRoute(RoutesEnum.contactUs),
                  );
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
                    padding: const EdgeInsets.only(top: 150),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            height: 400,
                            width: double.infinity,
                            color: Color(Constants.primaryWhite()),
                          ),
                          Container(
                            height: 400,
                            width: double.infinity,
                            color: Color(Constants.primaryBlue()),
                            child:  Padding(
                              padding: const EdgeInsets.only(top: 70.0, left: 10, right: 10),
                              child: Text(
                                "Adalena Family Home was designed with family-like senior living in mind.Located in the Spanaway neighbourhood ,we are just a short drive from Spanaway, Franciscan and Greater Lakes Community Hospitals , giving residents and their families peace of mind , knowing hospital care is close by if needed. We are also in close proximity to Spanaway Lake Boat House , Naches Trail Preserve, Mission Hills Community Park, Spanaway park and Cross park providing residents with easy access to natural settings for leisurely walks , picnics and outdoor activities that promote physical and mental well-being. Additionally, upscale and casual restaurants , as well as shopping are conveniently within walking distance. ",
                                style: TextStyle(
                                  color: Color(Constants.primaryWhite()),
                                  fontSize: width <500 ? 15 :18,
                                ),
                                // overflow: TextOverflow.ellipsis,

                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child:  Container(
                      height: 580,
                      width: double.infinity,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 250,
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
                                    title:  Text.rich(
                                       TextSpan(
                                        children: <InlineSpan> [
                                          TextSpan(
                                            text: '186',
                                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,fontStyle: FontStyle.italic,color: Color(Constants.primaryBlue())),
                                          ),
                                          WidgetSpan(
                                            child: Transform.translate(
                                              offset: const Offset(0, -8),
                                              child: Text(
                                                'th',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                    color: Color(Constants.primaryBlue())
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' St Ct E, 14',
                                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,fontStyle: FontStyle.italic,color: Color(Constants.primaryBlue())),
                                          ),
                                          WidgetSpan(
                                            child: Transform.translate(
                                              offset: const Offset(0, -8),
                                              child: Text(
                                                'th',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                    color: Color(Constants.primaryBlue())
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' Avenue',
                                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,fontStyle: FontStyle.italic,color: Color(Constants.primaryBlue())),
                                          ),
                                        ],
                                      ),
                                    )
                                    // Text(
                                    //   ", St.Matthews Rd",
                                    //   style: TextStyle(
                                    //       fontStyle: FontStyle.italic,
                                    //       fontWeight: FontWeight.w600,
                                    //       color: Color(Constants.primaryBlue()),
                                    //       fontSize: 20
                                    //   ),
                                    // ),
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
                                    title: Wrap(
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
                                                color: Color(Constants.primaryBlue()),
                                                fontSize: 20
                                            ),
                                          ),
                                        ),
                                        const Text("/"),
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
                                                color: Color(Constants.primaryBlue()),
                                                fontSize: 20
                                            ),
                                          ),
                                        ),
                                        const Text("/"),
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
                                                color: Color(Constants.primaryBlue()),
                                                fontSize: 20
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10,),
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
