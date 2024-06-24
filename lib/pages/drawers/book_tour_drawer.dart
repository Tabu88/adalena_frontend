import 'package:adult_family_home/controller/adalena_controller.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../controller/web_navigation_controller.dart';
import '../../helpers/constants.dart';
import '../../helpers/routes_enums.dart';
import '../../helpers/widget_helper.dart';
import '../../routes.dart';
import '../email_formatter.dart';

class BookTourDrawer extends StatefulWidget {
  const BookTourDrawer({super.key});

  @override
  State<BookTourDrawer> createState() => _BookTourDrawerState();
}

class _BookTourDrawerState extends State<BookTourDrawer> {
  final WebNavigationController webNavigationController = Get.put(WebNavigationController());
  final AdalenaController _adalenaController = Get.put(AdalenaController());
  PageController _pageController = PageController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
   bool isSelected = false;
  DateTime? _tourDate;
  final _formKey = GlobalKey<FormState>();
   int _currentStep = 0;
   bool _firstList = true;
   bool isLoading = false;
   late double widthVal ;
  String? _errorMessage;
  int _selectedIndex = -1; // Initially, no button is selected

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

   void _init(){
     _adalenaController.resetController();
   }

   @override
  void initState() {
    Future.delayed(Duration.zero, _init);
    super.initState();
  }

  int? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 3;
    }
    // Regular expression for validating an email address
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 2;
    }
    return 1;
  }

  // void _onEmailChanged() {
  //   final email = _emailController.text;
  //   if (_validateEmail(email) == null) {
  //     setState(() {
  //       _errorMessage = null;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
     _adalenaController.validateError.value = "";
     double width = MediaQuery.of(context).size.width;
     widthVal = width;
    return  Drawer(
      backgroundColor: Color(Constants.primaryWhite()),
      width: double.infinity,
      child:  SingleChildScrollView(
        child: SizedBox(
          height: 1000,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back, size: 40, color: Color(Constants.primaryBlue()),)
                  ),
                  SizedBox(height: 50,width: 50,)
                ],
              ),
              SizedBox(
                height: 900,
                width: double.infinity,
                child: PageView(
                  controller: _pageController,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Type of Tour",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: Color(Constants.primaryGreen())
                              ),),
                          ),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "What kind of tour are you requesting?",
                              style: TextStyle(
                                  fontSize: widthVal < 500 ? 14 :20,
                                  color: Color(Constants.primaryBlue())
                              ),
                            ),
                          ),
                          const SizedBox(height: 25,),
                          _buildButton(0, "In-Person Tour", (){
                            _onButtonPressed(0);
                            _adalenaController.bookTour.value = "In Person Tour";
                          }),
                          const SizedBox(height: 10,),
                          _buildButton(1, "Virtual Tour", (){
                            _onButtonPressed(1);
                            _adalenaController.bookTour.value = "Virtual Tour";
                          }),
                          Obx(()=>
                              SizedBox(height: 40,child: Text("${_adalenaController.validateError.value}",style: TextStyle(color: Colors.red),),)),
                          const SizedBox(height: 20,),
                          Wrap(
                              direction: Axis.horizontal,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              alignment: WrapAlignment.start,
                              spacing: 5.0,
                              runSpacing: 8.0,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(Constants.primaryBlue()),
                                        fixedSize: const Size(100, 45),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    onPressed: () {
                                      if (_adalenaController.bookTour.value.isEmpty) {
                                        _adalenaController.validateError.value = "Select type of tour";
                                      } else {
                                        setState(() {
                                        _pageController.nextPage(
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.easeIn,
                                        );
                                          _selectedIndex = -1;
                                        });
                                      }
                                    },
                                    child: const Text(
                                            "Next",
                                            style: TextStyle(color: Colors.white),
                                          )
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        fixedSize: const Size(100, 45),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    onPressed: () {
                                      _pageController.previousPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeIn,
                                      );
                                    },
                                    child: Text(
                                      "Back",
                                      style: TextStyle(
                                          color: Color(Constants.primaryBlue())),
                                    ))
                              ],
                            )
                          ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Person Of Interest",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: Color(Constants.primaryGreen())
                              ),),
                          ),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Could you tell me who is interested in moving to Adalena?",
                              style: TextStyle(
                                  fontSize: widthVal < 500 ? 14 :20,
                                  color: Color(Constants.primaryBlue())
                              ),
                            ),
                          ),
                          const SizedBox(height: 25,),
                          _buildButton(0, "Myself", (){
                            _onButtonPressed(0);
                            _adalenaController.bookPersonOfInterest.value = "Myself";
                          }),
                          const SizedBox(height: 10,),
                          _buildButton(1, "Parent", (){
                            _onButtonPressed(1);
                            _adalenaController.bookPersonOfInterest.value = "Parent";
                          }),
                          const SizedBox(height: 10,),
                          _buildButton(2, "Spouse", (){
                            _onButtonPressed(2);
                            _adalenaController.bookPersonOfInterest.value = "Spouse";
                          }),
                          const SizedBox(height: 10,),
                          _buildButton(3, "Family Member", (){
                            _onButtonPressed(3);
                            _adalenaController.bookPersonOfInterest.value = "Family Member";
                          }),
                          const SizedBox(height: 10,),
                          _buildButton(4, "Friend", (){
                            _onButtonPressed(4);
                            _adalenaController.bookPersonOfInterest.value = "Friend";
                          }),
                          const SizedBox(height: 10,),
                          _buildButton(5, "Other", (){
                            _onButtonPressed(5);
                            _adalenaController.bookPersonOfInterest.value = "Other";
                          }),
                          Obx(()=>
                              SizedBox(height: 40,child: Text("${_adalenaController.validateError.value}",style: TextStyle(color: Colors.red),),)),
                          const SizedBox(height: 20,),
                          Wrap(
                              direction: Axis.horizontal,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              alignment: WrapAlignment.start,
                              spacing: 5.0,
                              runSpacing: 8.0,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(Constants.primaryBlue()),
                                        fixedSize: const Size(100, 45),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    onPressed: () {
                                      if (_adalenaController.bookPersonOfInterest.value.isEmpty) {
                                        _adalenaController.validateError.value = "Select person of interest";
                                      } else {
                                        setState(() {
                                          _pageController.nextPage(
                                            duration: const Duration(milliseconds: 300),
                                            curve: Curves.easeIn,
                                          );
                                          _selectedIndex = -1;
                                        });
                                      }
                                    },
                                    child: isLoading
                                        ? const CircularProgressIndicator(
                                            backgroundColor: Colors.white,
                                          )
                                        : const Text(
                                            "Next",
                                            style: TextStyle(color: Colors.white),
                                          )),
                                const SizedBox(
                                  width: 12,
                                ),
                                OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        fixedSize: const Size(100, 45),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    onPressed: () {
                                      _pageController.previousPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeIn,
                                      );
                                    },
                                    child: Text(
                                      "Back",
                                      style: TextStyle(
                                          color: Color(Constants.primaryBlue())),
                                    ))
                              ],
                            )
                          ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Timeline",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: Color(Constants.primaryGreen())
                              ),),
                          ),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "What is your timeline for potentially making a move?",
                              style: TextStyle(
                                  fontSize: widthVal < 500 ? 14 :20,
                                  color: Color(Constants.primaryBlue())
                              ),
                            ),
                          ),
                          const SizedBox(height: 25,),
                          _buildButton(0, "Immediately", (){
                            _onButtonPressed(0);
                            _adalenaController.bookTimeline.value = "Immediately";
                          }),
                          const SizedBox(height: 10,),
                          _buildButton(1, "1-3 Months", (){
                            _onButtonPressed(1);
                            _adalenaController.bookTimeline.value = "1-3 Months";
                          }),
                          const SizedBox(height: 10,),
                          _buildButton(2, "3 Months+", (){
                            _onButtonPressed(2);
                            _adalenaController.bookTimeline.value = "3 Months+";
                          }),
                          const SizedBox(height: 10,),
                          _buildButton(3, "Just Researching", (){
                            _onButtonPressed(3);
                            _adalenaController.bookTimeline.value = "Just Researching";
                          }),
                          Obx(()=>
                              SizedBox(height: 40,child: Text("${_adalenaController.validateError.value}",style: TextStyle(color: Colors.red),),)),
                          const SizedBox(height: 20,),
                          Wrap(
                              direction: Axis.horizontal,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              alignment: WrapAlignment.start,
                              spacing: 5.0,
                              runSpacing: 8.0,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(Constants.primaryBlue()),
                                        fixedSize: const Size(100, 45),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    onPressed: () {
                                      if (_adalenaController.bookTimeline.value.isEmpty) {
                                        _adalenaController.validateError.value = "Select timeline of your stay";
                                      } else {
                                        setState(() {
                                          _pageController.nextPage(
                                            duration: const Duration(milliseconds: 300),
                                            curve: Curves.easeIn,
                                          );
                                          _selectedIndex = -1;
                                        });
                                      }
                                    },
                                    child: isLoading
                                        ? const CircularProgressIndicator(
                                            backgroundColor: Colors.white,
                                          )
                                        : const Text(
                                            "Next",
                                            style: TextStyle(color: Colors.white),
                                          )),
                                const SizedBox(
                                  width: 12,
                                ),
                                OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        fixedSize: const Size(100, 45),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    onPressed: () {
                                      _pageController.previousPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeIn,
                                      );
                                    },
                                    child: Text(
                                      "Back",
                                      style: TextStyle(
                                          color: Color(Constants.primaryBlue())),
                                    ))
                              ],
                            )
                          ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Significant Feature",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: Color(Constants.primaryGreen())
                              ),),
                          ),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "What is most important to you when choosing a senior living community?",
                              style: TextStyle(
                                  fontSize: widthVal < 500 ? 14 :20,
                                  color: Color(Constants.primaryBlue())
                              ),
                            ),
                          ),
                          const SizedBox(height: 25,),
                          _buildButton(0, "Activities", () {
                            _onButtonPressed(0);
                            _adalenaController.bookFeature.value = "Activities";
                          }),
                          const SizedBox(height: 10,),
                          _buildButton(1, "Layout", () {
                            _onButtonPressed(1);
                            _adalenaController.bookFeature.value = "Layout";
                          }),
                          Obx(()=>
                              SizedBox(height: 40,child: Text("${_adalenaController.validateError.value}",style: TextStyle(color: Colors.red),),)),
                          const SizedBox(height: 20,),
                          Wrap(
                              direction: Axis.horizontal,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              alignment: WrapAlignment.start,
                              spacing: 5.0,
                              runSpacing: 8.0,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(Constants.primaryBlue()),
                                        fixedSize: const Size(100, 45),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    onPressed: () {
                                      if (_adalenaController.bookFeature.value.isEmpty) {
                                        _adalenaController.validateError.value = "Select feature of your stay";
                                      } else {
                                        setState(() {
                                          _pageController.nextPage(
                                            duration: const Duration(milliseconds: 300),
                                            curve: Curves.easeIn,
                                          );
                                          _selectedIndex = -1;
                                        });
                                      }
                                    },
                                    child:  const Text(
                                            "Next",
                                            style: TextStyle(color: Colors.white),
                                          )),
                                const SizedBox(
                                  width: 12,
                                ),
                                OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        fixedSize: const Size(100, 45),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    onPressed: () {
                                      _pageController.previousPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeIn,
                                      );
                                    },
                                    child: Text(
                                      "Back",
                                      style: TextStyle(
                                          color: Color(Constants.primaryBlue())),
                                    ))
                              ],
                            )
                          ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Date & Time",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: Color(Constants.primaryGreen())
                              ),),
                          ),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "When would you like to schedule your visit?",
                              style: TextStyle(
                                  fontSize: widthVal < 500 ? 14 :20,
                                  color: Color(Constants.primaryBlue())
                              ),
                            ),
                          ),
                          const SizedBox(height: 25,),
                          SizedBox(
                            width: 400,
                            height: 60,
                            child: DateTimePicker(
                              initialEntryMode:
                              DatePickerEntryMode.calendar,
                              //style: TextStyle(color: Color(Constants.textWhite())),
                              decoration:
                              InputDecoration(
                                  contentPadding:
                                  const EdgeInsets.symmetric(
                                      vertical: 15.0,
                                      horizontal: 10.0),
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors
                                              .grey),
                                      borderRadius:
                                      BorderRadius.circular(
                                          10)),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                        4),
                                    borderSide:
                                    BorderSide(
                                      color: Colors
                                          .red
                                          .shade400,
                                      // width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                        4),
                                    borderSide:
                                    BorderSide(
                                      color: Colors
                                          .blue
                                          .shade300,
                                      width: 1,
                                    ),
                                  ),
                                  hintText: 'set-date'.tr,
                                  hintStyle: TextStyle(
                                      color: Colors.grey),
                                  suffixIcon:  Icon(Icons.calendar_month,color:Color(Constants.primaryBlue()),),
                                  filled: true,
                                  isDense: true),
                              type: DateTimePickerType.dateTime,
                              initialValue: '',
                              firstDate: DateTime.now(),
                              // One year ago
                              lastDate: DateTime(2100),
                              dateLabelText: 'Date',
                              onChanged: (val) {
                                setState(() {
                                  _tourDate =
                                      DateTime.parse(
                                          val);
                                  _adalenaController
                                      .bookDateTime
                                      .value = DateFormat(
                                      'yyyy-MM-dd')
                                      .format(_tourDate!);
                                });
                              },
                              validator: (date) {
                                if (date == null ||
                                    date.isEmpty) {
                                  return "choose-from-date"
                                      .tr;
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Obx(()=>
                              SizedBox(height: 40,child: Text("${_adalenaController.validateError.value}",style: TextStyle(color: Colors.red),),)),
                          const SizedBox(height: 20,),
                          Wrap(
                              direction: Axis.horizontal,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              alignment: WrapAlignment.start,
                              spacing: 5.0,
                              runSpacing: 8.0,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(Constants.primaryBlue()),
                                        fixedSize: const Size(100, 45),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    onPressed: () {
                                      if (_adalenaController.bookDateTime.value.isEmpty) {
                                        _adalenaController.validateError.value = "Select date & time of your stay";
                                      } else {
                                        setState(() {
                                          _pageController.nextPage(
                                            duration: const Duration(milliseconds: 300),
                                            curve: Curves.easeIn,
                                          );
                                          _selectedIndex = -1;
                                        });
                                      }
                                    },
                                    child: const Text(
                                            "Next",
                                            style: TextStyle(color: Colors.white),
                                          )),
                                const SizedBox(
                                  width: 12,
                                ),
                                OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        fixedSize: const Size(100, 45),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    onPressed: () {
                                      _pageController.previousPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeIn,
                                      );
                                    },
                                    child: Text(
                                      "Back",
                                      style: TextStyle(
                                          color: Color(Constants.primaryBlue())),
                                    ))
                              ],
                            )
                          ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Media",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: Color(Constants.primaryGreen())
                              ),),
                          ),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "How did you hear about us?",
                              style: TextStyle(
                                  fontSize: widthVal < 500 ? 14 :20,
                                  color: Color(Constants.primaryBlue())
                              ),
                            ),
                          ),
                          const SizedBox(height: 25,),
                          _buildButton(0, "Internet Search", (){
                            _onButtonPressed(0);
                            _adalenaController.bookMedia.value = "Internet Search";
                          }),
                          const SizedBox(height: 10,),
                          _buildButton(1, "Facebook", (){
                            _onButtonPressed(1);
                            _adalenaController.bookMedia.value = "Facebook";
                          }),
                          const SizedBox(height: 10,),
                          _buildButton(2, "Instagram", (){
                            _onButtonPressed(2);
                            _adalenaController.bookMedia.value = "Instagram";
                          }),
                          const SizedBox(height: 10,),
                          _buildButton(3, "Linked In", (){
                            _onButtonPressed(3);
                            _adalenaController.bookMedia.value = "Linked In";
                          }),
                          const SizedBox(height: 10,),
                          _buildButton(4, "Family/Friend", (){
                            _onButtonPressed(4);
                            _adalenaController.bookMedia.value = "Family/Friend";
                          }),
                          Obx(()=>
                              SizedBox(height: 40,child: Text("${_adalenaController.validateError.value}",style: TextStyle(color: Colors.red),),)),
                          const SizedBox(height: 20,),
                          Wrap(
                              direction: Axis.horizontal,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              alignment: WrapAlignment.start,
                              spacing: 5.0,
                              runSpacing: 8.0,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(Constants.primaryBlue()),
                                        fixedSize: const Size(100, 45),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    onPressed: () {
                                      if (_adalenaController.bookMedia.value.isEmpty) {
                                        _adalenaController.validateError.value = "Select media";
                                      } else {
                                        setState(() {
                                          _pageController.nextPage(
                                            duration: const Duration(milliseconds: 300),
                                            curve: Curves.easeIn,
                                          );
                                          _selectedIndex = -1;
                                        });
                                      }
                                    },
                                    child:  const Text(
                                            "Next",
                                            style: TextStyle(color: Colors.white),
                                          )),
                                const SizedBox(
                                  width: 12,
                                ),
                                OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        fixedSize: const Size(100, 45),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    onPressed: () {
                                      _pageController.previousPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeIn,
                                      );
                                    },
                                    child: Text(
                                      "Back",
                                      style: TextStyle(
                                          color: Color(Constants.primaryBlue())),
                                    ))
                              ],
                            )
                          ],
                      ),
                    ),
                    Container(
                      width: 400,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Personal Details",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: Color(Constants.primaryGreen())
                              ),),
                          ),
                          const SizedBox(height: 10,),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    "What is your full name?",
                                    style: TextStyle(
                                        fontSize: widthVal < 500 ? 14 :20,
                                        color: Color(Constants.primaryBlue())
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15,),
                                SizedBox(
                                  width: 400,
                                  height: 80,
                                  child: TextFormField(
                                    onChanged: (v){
                                      setState(() {
                                        _adalenaController.bookName.value = v;
                                      });
                                    },
                                    validator: (v) {
                                        if ( v == null || v.isEmpty) {
                                          return 'Enter your name';
                                        } else {
                                          return null;
                                        }
                                    },
                                    // inputFormatters: [
                                    //   LengthLimitingTextInputFormatter(9),
                                    //   FilteringTextInputFormatter.allow(
                                    //     RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
                                    //   ),
                                    // ],
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
                                                  Constants.primaryBlue()))),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          borderSide:
                                          BorderSide(color: Colors.red)),
                                    ),
                                    keyboardType: TextInputType.name,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "What is your email?",
                                    style: TextStyle(
                                        fontSize: widthVal < 500 ? 14 : 20,
                                        color: Color(Constants.primaryBlue())
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15,),
                                SizedBox(
                                  width: 400,
                                  height: 80,
                                  child: TextFormField(
                                    controller: _emailController,
                                    onChanged: (v) {
                                     _adalenaController.bookEmail.value = v;
                                    },
                                    validator: (v) {
                                      // setState(() {});
                                      var result = _validateEmail(v);
                                      if(result == 1) {
                                        return null;
                                      } else  if (result == 2) {
                                        return 'enter a valid email';
                                      } else {
                                        return 'Enter an email address';
                                      }

                                    },
                                    // inputFormatters: [EmailInputFormatter()],
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
                                                  Constants.primaryBlue()))),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          borderSide:
                                          BorderSide(color: Colors.red)),
                                      errorText: _errorMessage
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Obx(()=>
                              SizedBox(height: 40,child: Text("${_adalenaController.validateError.value}",style: TextStyle(color: Colors.red),),)),
                          const SizedBox(height: 20,),
                          Wrap(
                              direction: Axis.horizontal,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              alignment: WrapAlignment.start,
                              spacing: 5.0,
                              runSpacing: 8.0,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(Constants.primaryBlue()),
                                        fixedSize: const Size(100, 45),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    onPressed: ()  {
                                      if (_formKey.currentState!.validate())  {
                                         _adalenaController.bookingTour().then((value){
                                          if((value is bool) == true) {
                                            setState(() {
                                              _pageController.nextPage(
                                                duration: const Duration(milliseconds: 300),
                                                curve: Curves.easeIn,
                                              );
                                              _selectedIndex = -1;
                                            });
                                          } else {
                                            WidgetHelper.snackbar("Failed", "An error occurred");
                                          }
                                        });

                                      } else {

                                      }
                                    },
                                    child: const Text(
                                            "Next",
                                            style: TextStyle(color: Colors.white),
                                          )),
                                const SizedBox(
                                  width: 12,
                                ),
                                OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        fixedSize: const Size(100, 45),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    onPressed: () {
                                      _pageController.previousPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeIn,
                                      );
                                    },
                                    child: Text(
                                      "Back",
                                      style: TextStyle(
                                          color: Color(Constants.primaryBlue())),
                                    ))
                              ],
                            )
                          ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Completed",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: Color(Constants.primaryGreen())
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "You will contacted shortly through email",
                              style: TextStyle(
                                  fontSize:widthVal < 500 ? 16 : 30,
                                  color: Color(Constants.primaryBlue())
                              ),
                            ),
                          ),
                          const SizedBox(height: 25,),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                                fixedSize: widthVal < 500 ? const Size(100,50): const Size(250,80),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero
                                )
                            ),
                            onPressed: () {
                              Get.toNamed(
                                Routes.getValueForRoute(RoutesEnum.home),
                              );
                            },
                            child: Text(
                              "Completed",
                              style: TextStyle(
                                  color: Color(Constants.primaryWhite()),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }


   Widget _buildButton(int index, String label, void Function() _assignValue) {
     return Padding (
       padding: EdgeInsets.all(8.0),
       child: ElevatedButton(
         onPressed: _assignValue,
         style: ElevatedButton.styleFrom(
           backgroundColor: _selectedIndex == index ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
             fixedSize: widthVal < 500 ? const Size(120,60): const Size(250,80),
             shape: const RoundedRectangleBorder(
                 borderRadius: BorderRadius.zero
             )
         ),
         child: Text(
           label,
           style: TextStyle(
               color: Color(Constants.primaryWhite()),
               fontSize: 14,
               fontWeight: FontWeight.w500
           ),
         ),
       ),
     );
   }

}
