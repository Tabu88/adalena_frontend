import 'package:adult_family_home/controller/adalena_controller.dart';
import 'package:adult_family_home/widgets/form_label_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../controller/web_navigation_controller.dart';
import '../helpers/constants.dart';
import '../helpers/enums.dart';
import '../helpers/routes_enums.dart';
import '../helpers/widget_helper.dart';
import '../routes.dart';
import '../widgets/footer_widget.dart';
import 'drawers/adalena_drawer.dart';
import 'drawers/book_tour_drawer.dart';

class ContactWidgets extends StatefulWidget {
  const ContactWidgets({super.key});

  @override
  State<ContactWidgets> createState() => _ContactWidgetsState();
}

class _ContactWidgetsState extends State<ContactWidgets> {
  final WebNavigationController webNavigationController = Get.put(WebNavigationController());
  final _adalenaController = Get.put(AdalenaController());
  final _formKey = GlobalKey<FormState>();
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(47.087797, -122.408420);
  final Uri _url = Uri.parse('https://www.google.com/maps/place/47%C2%B005\'16.1%22N+122%C2%B024\'30.3%22W/@47.087797,-122.4109952,17z/data=!3m1!4b1!4m4!3m3!8m2!3d47.087797!4d-122.4084203?hl=en&entry=ttu');
  String? _selectedReason;
  String? _selectedMedia;
  String unclePhone = "+1(253) 785-1180";
  String auntPhone = "+1(206) 806-3698";
  String landLine = "+1(253) 455-7706";
  final Uri _instaUrl = Uri.parse('https://www.instagram.com/adalenaafh/');
  final Uri _fbUrl = Uri.parse('https://www.google.com/maps/place/47%C2%B005\'16.1%22N+122%C2%B024\'30.3%22W/@47.087797,-122.4109952,17z/data=!3m1!4b1!4m4!3m3!8m2!3d47.087797!4d-122.4084203?hl=en&entry=ttu');
  final Uri _linkedUrl = Uri.parse('https://www.google.com/maps/place/47%C2%B005\'16.1%22N+122%C2%B024\'30.3%22W/@47.087797,-122.4109952,17z/data=!3m1!4b1!4m4!3m3!8m2!3d47.087797!4d-122.4084203?hl=en&entry=ttu');


  _init(){
    // _adalenaController.resetController();
  }

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
  void initState() {
    Future.delayed(Duration.zero, _init);
    super.initState();
  }

  final List<String> reasons = [
    "Select Reason",
    "To book a tour",
    "Inquiries",
    "Placement",
  ];

  final List<String> media = [
    "Instagram",
    "Facebook",
    "Linked In",
    "Website",
    "Other"
  ];

  _continue() async{
    if(_formKey.currentState!.validate()){
      await _adalenaController.contactAdalena().then((value){
        if((value is bool) == true) {
          WidgetHelper.snackbar("Success", "Contact request sent!");
        } else {
          WidgetHelper.snackbar("Failed", "An error occurred: ${_adalenaController.errorMessage.value}");
        }
      });

    } else {
      WidgetHelper.snackbar("Error", "Complete the form to continue");
    }
  }

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
                                    width: 220,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Contact Us",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Color(Constants.primaryGreen())
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Feel free to fill out the form or reach us through our email or contacts",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(Constants.primaryBlue())
                    ),
                  ),
                ),
                width > 700
                    ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 20),
                  child: SizedBox(
                    height: 1200,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FormLabelText(title: "Full Name"),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        isDense: true,
                                        filled: true,
                                        hintText: 'Enter Full Name',
                                        hintStyle: TextStyle(
                                            color:
                                            Color(Constants.primaryBlue())),
                                        fillColor:
                                        Color(Constants.primaryWhite()),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(8.0)),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              color:
                                              Color(Constants.primaryBlue())),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                                color: Color(
                                                    Constants.primaryGreen()))),
                                        errorBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                            borderSide:
                                            BorderSide(color: Colors.red)),
                                      ),
                                      onChanged: (v) {
                                        _adalenaController.contactName.value = v;
                                      },
                                      validator: (v) {
                                        if (v == null || v.isEmpty) {
                                          return 'Enter your name';
                                        } else {
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.name,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  FormLabelText(
                                    title: "Email Address",
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        isDense: true,
                                        filled: true,
                                        hintText: 'Enter Email Address',
                                        hintStyle: TextStyle(
                                            color:
                                            Color(Constants.primaryBlue())),
                                        fillColor:
                                        Color(Constants.primaryWhite()),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(8.0)),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              color:
                                              Color(Constants.primaryBlue())),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                                color: Color(
                                                    Constants.primaryGreen()))),
                                        errorBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                            borderSide:
                                            BorderSide(color: Colors.red)),
                                      ),
                                      onChanged: (v) {
                                        _adalenaController.contactEmail.value = v;
                                      },
                                      validator: (v) {
                                        if (v == null || v.isEmpty) {
                                          return 'Enter your email address';
                                        } else {
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  FormLabelText(
                                    title: "Phone Number",
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        isDense: true,
                                        filled: true,
                                        hintText: 'Enter Phone Number',
                                        hintStyle: TextStyle(
                                            color:
                                            Color(Constants.primaryBlue())),
                                        fillColor:
                                        Color(Constants.primaryWhite()),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(8.0)),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              color:
                                              Color(Constants.primaryBlue())),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                                color: Color(
                                                    Constants.primaryGreen()))),
                                        errorBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                            borderSide:
                                            BorderSide(color: Colors.red)),
                                      ),
                                      onChanged: (v) {
                                        _adalenaController.contactPhone.value = v;
                                      },
                                      validator: (v) {
                                        if (v == null|| v.isEmpty) {
                                          return 'Enter your phone number';
                                        } else {
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.phone,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  FormLabelText(
                                    title: "Reason for contacting us",
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: DropdownButtonFormField2<String>(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                                          hintText: "select reason",
                                          hintStyle: TextStyle(color: Color(Constants.primaryWhite())),
                                          filled: true,
                                          fillColor: Color(Constants.primaryWhite()),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                                color: Color(Constants.primaryBlue())
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(4),
                                            borderSide: BorderSide(
                                              color: Colors.red.shade400,

                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(4),
                                            borderSide: BorderSide(
                                              color: Color(Constants.primaryGreen()),
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                        items: reasons.map((String reason) {
                                          return DropdownMenuItem<String>(
                                            value: reason,
                                            child: Text(
                                              reason,
                                              style: TextStyle(
                                                  color: Color(Constants.primaryBlue())
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        dropdownStyleData: DropdownStyleData(
                                            decoration: BoxDecoration(
                                                color: Color(
                                                    Constants.primaryWhite()),
                                                borderRadius:
                                                BorderRadius.circular(8.0))),
                                        onChanged: (String? value) {
                                          _selectedReason = value!;
                                          _adalenaController.contactReason.value = value;
                                        },
                                        value: _selectedReason ,
                                        validator: (v) {
                                          if (v == null|| v.isEmpty) {
                                            return 'Select reason';
                                          } else {
                                            return null;
                                          }
                                        },
                                      )),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  FormLabelText(
                                      title: "How did you hear about us?"),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonFormField2<String>(
                                      items: media.map((String media) {
                                        return DropdownMenuItem<String>(
                                          value: media,
                                          child: Text(
                                            media,
                                            style: TextStyle(
                                                color: Color(
                                                    Constants.primaryBlue())),
                                          ),
                                        );
                                      }).toList(),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                                        hintText: "select media",
                                        hintStyle: TextStyle(color: Color(Constants.primaryWhite())),
                                        filled: true,
                                        fillColor: Color(Constants.primaryWhite()),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              color: Color(Constants.primaryBlue())
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(4),
                                          borderSide: BorderSide(
                                            color: Colors.red.shade400,

                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(4),
                                          borderSide: BorderSide(
                                            color: Color(Constants.primaryGreen()),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      dropdownStyleData: DropdownStyleData(
                                          decoration: BoxDecoration(
                                              color:
                                              Color(Constants.primaryWhite()),
                                              borderRadius:
                                              BorderRadius.circular(8.0))),
                                      onChanged: (String? value) {
                                        setState(() {
                                          _selectedMedia = value;
                                          _adalenaController.contactMedia.value =
                                          value!;
                                        });
                                      },
                                      value: _selectedMedia,
                                      validator: (v) {
                                        if (v == null || v.isEmpty) {
                                          return 'Select reason';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  FormLabelText(
                                    title: "Do you have a specific question for us?",
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        isDense: true,
                                        filled: true,
                                        hintText: 'How may we assist you?',
                                        hintStyle: TextStyle(
                                            color:
                                            Color(Constants.primaryBlue())),
                                        fillColor:
                                        Color(Constants.primaryWhite()),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(8.0)),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              color:
                                              Color(Constants.primaryBlue())),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                                color: Color(
                                                    Constants.primaryGreen()))),
                                        errorBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                            borderSide:
                                            BorderSide(color: Colors.red)),
                                      ),
                                      maxLines: 4,
                                      keyboardType: TextInputType.multiline,
                                      onChanged: (v) {
                                        _adalenaController.contactQuery.value = v;
                                      },
                                      validator: (v) {
                                        if (v == null|| v.isEmpty) {
                                          return 'Enter your query';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            fixedSize: const Size(250,70),
                                            backgroundColor:
                                            Color(Constants.primaryBlue())),
                                        onPressed: _continue,
                                        child: Text(
                                          "Contact Us Today",
                                          style: TextStyle(
                                            color: Color(Constants.primaryGreen()),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 400,
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                child: GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                      target: _center, zoom: 15.0),
                                  markers: {
                                    Marker(
                                        markerId: const MarkerId(
                                            "_adalenaLocation"),
                                        icon: BitmapDescriptor.defaultMarker,
                                        position: _center,
                                        infoWindow: InfoWindow(
                                            title:
                                            "9525 N Fort Washington Rd",
                                            snippet:
                                            "9525 N Fort Washington Rd, Fresno , CA 92730, USA ",
                                            onTap: _launchMap))
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8.0),
                                child: Wrap(
                                      direction: Axis.horizontal,
                                      crossAxisAlignment: WrapCrossAlignment.start,
                                      alignment: WrapAlignment.start,
                                      spacing: 5.0,
                                      runSpacing: 8.0,
                                      children: [
                                        Image.asset(
                                          "assets/images/phone_blue.png",
                                          height: 30,
                                          width: 30,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
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
                                        Text("/",style: TextStyle(color: Color(Constants.primaryBlue()), fontSize: 18),),
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
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/mail_blue.png",
                                      height: 30,
                                      width: 30,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        _copyText(context, "adalenaafh@gmail.com");
                                      },
                                      child:  Text(
                                        "adalenaafh@gmail.com",
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Color(Constants.primaryBlue()),
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: _launchInsta,
                                      child: Image.asset(
                                        "assets/images/insta_blue.png",
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    GestureDetector(
                                      onTap: _launchFacebook,
                                      child: Image.asset(
                                        "assets/images/facebook_blue.png",
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    GestureDetector(
                                      onTap: _launchLinkedIn,
                                      child: Image.asset(
                                        "assets/images/linked_in_blue.png",
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
                    : Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20),
                  child: SizedBox(
                    height: width < 500 ? 2000 : 1850,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 400,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                          child: GoogleMap(
                            initialCameraPosition:
                            CameraPosition(target: _center, zoom: 15.0),
                            markers: {
                              Marker(
                                  markerId:
                                  const MarkerId("_adalenaLocation"),
                                  icon: BitmapDescriptor.defaultMarker,
                                  position: _center,
                                  infoWindow: InfoWindow(
                                      title: "9525 N Fort Washington Rd",
                                      snippet:
                                      "9525 N Fort Washington Rd, Fresno , CA 92730, USA ",
                                      onTap: _launchMap))
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                          child: Wrap(
                                direction: Axis.horizontal,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                alignment: WrapAlignment.start,
                                spacing: 5.0,
                                runSpacing: 8.0,
                                children: [
                                  Image.asset(
                                    "assets/images/phone_blue.png",
                                    height: 30,
                                    width: 30,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
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
                                  Text("/",style: TextStyle(color: Color(Constants.primaryBlue()), fontSize: 18),),
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
                                  Text("/",style: TextStyle(color: Color(Constants.primaryBlue()), fontSize: 18),),
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
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/mail_blue.png",
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              TextButton(
                                onPressed: () {
                                  _copyText(context, "adalenaafh@gmail.com");
                                },
                                child:  Text(
                                  "adalenaafh@gmail.com",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color(Constants.primaryBlue()),
                                      fontStyle: FontStyle.italic),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: _launchInsta,
                                child: Image.asset(
                                  "assets/images/insta_blue.png",
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: _launchFacebook,
                                child: Image.asset(
                                  "assets/images/facebook_blue.png",
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: _launchLinkedIn,
                                child: Image.asset(
                                  "assets/images/linked_in_blue.png",
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FormLabelText(title: "Full Name"),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      filled: true,
                                      hintText: 'Enter Full Name',
                                      hintStyle: TextStyle(
                                          color:
                                          Color(Constants.primaryBlue())),
                                      fillColor:
                                      Color(Constants.primaryWhite()),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0)),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            color: Color(
                                                Constants.primaryBlue())),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              color: Color(
                                                  Constants.primaryGreen()))),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          borderSide:
                                          BorderSide(color: Colors.red)),
                                    ),
                                    onChanged: (v) {
                                      _adalenaController.contactName.value =
                                          v;
                                    },
                                    validator: (v) {
                                      if (v == null|| v.isEmpty) {
                                        return 'Enter your name';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                FormLabelText(
                                  title: "Email Address",
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      filled: true,
                                      hintText: 'Enter Email Address',
                                      hintStyle: TextStyle(
                                          color:
                                          Color(Constants.primaryBlue())),
                                      fillColor:
                                      Color(Constants.primaryWhite()),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0)),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            color: Color(
                                                Constants.primaryBlue())),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              color: Color(
                                                  Constants.primaryGreen()))),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          borderSide:
                                          BorderSide(color: Colors.red)),
                                    ),
                                    onChanged: (v) {
                                      _adalenaController.contactEmail.value =
                                          v;
                                    },
                                    validator: (v) {
                                      if (v == null|| v.isEmpty) {
                                        return 'Enter your email address';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                FormLabelText(
                                  title: "Phone Number",
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      filled: true,
                                      hintText: 'Enter Phone Number',
                                      hintStyle: TextStyle(
                                          color:
                                          Color(Constants.primaryBlue())),
                                      fillColor:
                                      Color(Constants.primaryWhite()),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0)),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            color: Color(
                                                Constants.primaryBlue())),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              color: Color(
                                                  Constants.primaryGreen()))),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          borderSide:
                                          BorderSide(color: Colors.red)),
                                    ),
                                    onChanged: (v) {
                                      _adalenaController.contactPhone.value =
                                          v;
                                    },
                                    validator: (v) {
                                      if (v == null|| v.isEmpty) {
                                        return 'Enter your phone number';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                FormLabelText(
                                  title: "Reason for contacting us",
                                ),
                                Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: DropdownButtonFormField2<String>(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                                        hintText: "select reason",
                                        hintStyle: TextStyle(color: Color(Constants.primaryWhite())),
                                        filled: true,
                                        fillColor: Color(Constants.primaryWhite()),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              color: Color(Constants.primaryBlue())
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(4),
                                          borderSide: BorderSide(
                                            color: Colors.red.shade400,

                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(4),
                                          borderSide: BorderSide(
                                            color: Color(Constants.primaryGreen()),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      items: reasons.map((String reason) {
                                        return DropdownMenuItem<String>(
                                          value: reason,
                                          child: Text(
                                            reason,
                                            style: TextStyle(
                                                color: Color(Constants.primaryBlue())),
                                          ),
                                        );
                                      }).toList(),
                                      dropdownStyleData: DropdownStyleData(
                                          decoration: BoxDecoration(
                                              color: Color(
                                                  Constants.primaryWhite()),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  8.0))),
                                      onChanged: (String? value) {
                                        setState(() {
                                          _selectedReason = value!;
                                          _adalenaController.contactReason.value = value!;
                                        });
                                      },
                                      value: _selectedReason,
                                      validator: (v) {
                                        if (v == null|| v.isEmpty) {
                                          return 'Select reason';
                                        } else {
                                          return null;
                                        }
                                      },
                                    )),
                                const SizedBox(
                                  height: 32,
                                ),
                                FormLabelText(
                                    title: "How did you hear about us?"),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: DropdownButtonFormField2<String>(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                                      hintText: "select media",
                                      hintStyle: TextStyle(color: Color(Constants.primaryWhite())),
                                      filled: true,
                                      fillColor: Color(Constants.primaryWhite()),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Color(Constants.primaryBlue())
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                          color: Colors.red.shade400,

                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                          color: Color(Constants.primaryGreen()),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    items: media.map((String media) {
                                      return DropdownMenuItem<String>(
                                        value: media,
                                        child: Text(
                                          media,
                                          style: TextStyle(
                                              color: Color(
                                                  Constants.primaryBlue())),
                                        ),
                                      );
                                    }).toList(),
                                    dropdownStyleData: DropdownStyleData(
                                        decoration: BoxDecoration(
                                            color: Color(
                                                Constants.primaryWhite()),
                                            borderRadius:
                                            BorderRadius.circular(8.0))),
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedMedia = value;
                                        _adalenaController.contactMedia.value = value!;
                                      });
                                    },
                                    value: _selectedMedia,
                                    validator: (v) {
                                      if (v == null || v.isEmpty) {
                                        return 'Select media';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                FormLabelText(
                                  title: "Do you have a specific question for us?",
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      filled: true,
                                      hintText: 'How may we assist you?',
                                      hintStyle: TextStyle(
                                          color:
                                          Color(Constants.primaryBlue())),
                                      fillColor:
                                      Color(Constants.primaryWhite()),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0)),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            color: Color(
                                                Constants.primaryBlue())),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              color: Color(
                                                  Constants.primaryGreen()))),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          borderSide:
                                          BorderSide(color: Colors.red)),
                                    ),
                                    onChanged: (v) {
                                      _adalenaController.contactQuery.value =
                                          v;
                                    },
                                    validator: (v) {
                                      if (v == null|| v.isEmpty) {
                                        return 'Enter your query';
                                      } else {
                                        return null;
                                      }
                                    },
                                    maxLines: 4,
                                  ),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(250,70),
                                          backgroundColor:
                                          Color(Constants.primaryBlue())),
                                      onPressed: _continue,
                                      child: Text(
                                        "Contact Us Today",
                                        style: TextStyle(
                                          color:
                                          Color(Constants.primaryGreen()),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
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

  Future<void> _launchMap() async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw Exception('Could not launch $_url');
    }
  }


}
