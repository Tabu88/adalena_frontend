import 'package:adult_family_home/controller/adalena_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/web_navigation_controller.dart';
import '../../helpers/constants.dart';

class BookTourDrawer extends StatefulWidget {
  const BookTourDrawer({super.key});

  @override
  State<BookTourDrawer> createState() => _BookTourDrawerState();
}

class _BookTourDrawerState extends State<BookTourDrawer> {
  final WebNavigationController webNavigationController = Get.put(WebNavigationController());
  final AdalenaController _adalenaController = Get.put(AdalenaController());
   bool isSelected = false;
   int _currentStep = 0;
   bool _firstList = true;

   void _switchStepList() {
     setState(() {
       _firstList = !_firstList;
       _currentStep = 0;
     });
   }


  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: Color(Constants.primaryWhite()),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back,size: 30,color: Color(Constants.primaryBlue()),),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(primary: Color(Constants.primaryGreen()))),
              child: Center(
                child: Stepper(
                  type: StepperType.vertical,
                  steps: _firstList ? getFirstSteps() : getSecondSteps(),
                  currentStep: _currentStep,
                  onStepContinue: () {
                   if(_currentStep < (_firstList ? getFirstSteps().length : getSecondSteps().length) - 1){
                     setState(() {
                       _currentStep += 1;
                     });
                   } else if(_currentStep >= getSecondSteps().length - 1){
                     setState(() {
                       _switchStepList();
                     });
                   } else {
                     //print("Completed");
                     Get.back();
                   }
                  },
                  onStepTapped: (step){
                    setState(() {
                      _currentStep = step;
                    });
                  },
                  onStepCancel: () {

                  },
                  controlsBuilder: (context, details){
                    if(_firstList == false && _currentStep >= getSecondSteps().length - 1){
                      return const SizedBox();
                    } else {
                      return Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(Constants.primaryBlue()),
                                fixedSize: const Size(100,45),
                                shape: const RoundedRectangleBorder (
                                    borderRadius: BorderRadius.zero
                                )
                            ),
                              onPressed: details.onStepContinue,
                              child: const Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              )
                          ),
                          const SizedBox(width: 12,),
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  fixedSize: const Size(100,45),
                                  shape: const RoundedRectangleBorder (
                                      borderRadius: BorderRadius.zero
                                  )
                              ),
                              onPressed: details.onStepCancel,
                              child: Text(
                                  "Back",
                                style: TextStyle(
                                  color: Color(Constants.primaryBlue())
                                ),
                              )
                          )
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          )
        ],
      )

    );
  }


  List<Step> getFirstSteps() => [
    Step(
      state: _currentStep > 0 ? StepState.complete : StepState.indexed,
      isActive: _currentStep >= 0,
      title: Text(
        "Type of Tour",
        style: TextStyle(
        fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Color(Constants.primaryGreen())
      ),),
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "What kind of tour are you requesting?",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(Constants.primaryBlue())
                ),
              ),
            ),
            const SizedBox(height: 25,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                fixedSize: const Size(250,80),
                shape: const RoundedRectangleBorder (
                    borderRadius: BorderRadius.zero
                )
              ),
              onPressed: () {
                setState(() {
                  isSelected == !isSelected;
                  _adalenaController.bookTour.value = "In-Person Tour";
                });
              },
              child: Text(
                "In-Person Tour",
                style: TextStyle(
                  color: Color(Constants.primaryWhite()),
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                  fixedSize: const Size(250,80),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                  )
              ),
              onPressed: (){
                setState(() {
                  isSelected == !isSelected;
                  _adalenaController.bookTour.value = "Virtual Tour";
                });
              },
              child: Text(
                "Virtual Tour",
                style: TextStyle(
                    color: Color(Constants.primaryWhite()),
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          ],
        ),
      )
    ),//type of tour
    Step(
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
      isActive: _currentStep >= 1,
      title: Text(
        "Person of Interest",
        style: TextStyle(
        fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Color(Constants.primaryGreen())
      ),),
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Could you tell me who is interested in moving to Adalena?",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(Constants.primaryBlue())
                ),
              ),
            ),
            const SizedBox(height: 25,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                fixedSize: const Size(250,80),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                  )
              ),
              onPressed: (){
                setState(() {
                  isSelected == !isSelected;
                  _adalenaController.bookPersonOfInterest.value = "Myself";
                });
              },
              child: Text(
                "Myself",
                style: TextStyle(
                  color: Color(Constants.primaryWhite()),
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                  fixedSize: const Size(250,80),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                  )
              ),
              onPressed: (){
                setState(() {
                  isSelected == !isSelected;
                  _adalenaController.bookPersonOfInterest.value = "Parent";
                });
              },
              child: Text(
                "Parent",
                style: TextStyle(
                    color: Color(Constants.primaryWhite()),
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                  fixedSize: const Size(250,80),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                  )
              ),
              onPressed: (){
                setState(() {
                  isSelected == !isSelected;
                  _adalenaController.bookPersonOfInterest.value = "Spouse";
                });
              },
              child: Text(
                "Spouse",
                style: TextStyle(
                    color: Color(Constants.primaryWhite()),
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                  fixedSize: const Size(250,80),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                  )
              ),
              onPressed: (){
                setState(() {
                  isSelected == !isSelected;
                  _adalenaController.bookPersonOfInterest.value = "Family Member";
                });
              },
              child: Text(
                "Family Member",
                style: TextStyle(
                    color: Color(Constants.primaryWhite()),
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                  fixedSize: const Size(250,80),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                  )
              ),
              onPressed: (){
                setState(() {
                  isSelected == !isSelected;
                  _adalenaController.bookPersonOfInterest.value = "Friend";
                });
              },
              child: Text(
                "Friend",
                style: TextStyle(
                    color: Color(Constants.primaryWhite()),
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                  fixedSize: const Size(250,80),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                  )
              ),
              onPressed: (){
                setState(() {
                  isSelected == !isSelected;
                  _adalenaController.bookPersonOfInterest.value = "Other";
                });
              },
              child: Text(
                "Other",
                style: TextStyle(
                    color: Color(Constants.primaryWhite()),
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          ],
        ),
      )
    ),//person of interest
    Step(
        state: _currentStep > 2 ? StepState.complete : StepState.indexed,
      isActive: _currentStep >= 2,
      title: Text(
        "Timeline",
        style: TextStyle(
        fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Color(Constants.primaryGreen())
      ),),
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "What is your timeline for potentially making a move?",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(Constants.primaryBlue())
                ),
              ),
            ),
            const SizedBox(height: 25,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                fixedSize: const Size(250,80),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                  )
              ),
              onPressed: (){
                setState(() {
                  isSelected == !isSelected;
                  _adalenaController.bookTimeline.value = "Immediately";
                });
              },
              child: Text(
                "Immediately",
                style: TextStyle(
                  color: Color(Constants.primaryWhite()),
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                  fixedSize: const Size(250,80),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                  )
              ),
              onPressed: (){
                setState(() {
                  isSelected == !isSelected;
                  _adalenaController.bookTimeline.value = "1-3 Months";
                });
              },
              child: Text(
                "1-3 Months",
                style: TextStyle(
                    color: Color(Constants.primaryWhite()),
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                  fixedSize: const Size(250,80),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                  )
              ),
              onPressed: (){
                setState(() {
                  isSelected == !isSelected;
                  _adalenaController.bookTimeline.value = "3 Months+";
                });
              },
              child: Text(
                "3 Months+",
                style: TextStyle(
                    color: Color(Constants.primaryWhite()),
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                  fixedSize: const Size(250,80),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                  )
              ),
              onPressed: (){
                setState(() {
                  isSelected == !isSelected;
                  _adalenaController.bookTimeline.value = "Just Researching";
                });
              },
              child: Text(
                "Just Researching",
                style: TextStyle(
                    color: Color(Constants.primaryWhite()),
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          ],
        ),
      )
    ),//timeline
    Step(
        state: _currentStep > 3 ? StepState.complete : StepState.indexed,
      isActive: _currentStep >= 3,
      title: Text(
        "Significant Feature",
        style: TextStyle(
        fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Color(Constants.primaryGreen())
      ),),
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "What is most important to you when choosing a senior living community?",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(Constants.primaryBlue())
                ),
              ),
            ),
            const SizedBox(height: 25,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                fixedSize: const Size(250,80),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                  )
              ),
              onPressed: (){
                setState(() {
                  isSelected == !isSelected;
                  _adalenaController.bookFeature.value = "Activities";
                });
              },
              child: Text(
                "Activities",
                style: TextStyle(
                  color: Color(Constants.primaryWhite()),
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                  fixedSize: const Size(250,80),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                  )
              ),
              onPressed: (){
                setState(() {
                  isSelected == !isSelected;
                  _adalenaController.bookFeature.value = "Layout";
                });
              },
              child: Text(
                "Layout",
                style: TextStyle(
                    color: Color(Constants.primaryWhite()),
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          ],
        ),
      )
    ),//feature*
   //personal details
  ];

  List<Step> getSecondSteps()=> [
    Step(
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: _currentStep >= 0,
        title: Text(
          "Date & Time",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color(Constants.primaryGreen())
          ),),
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "When would you like to schedule your visit?",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(Constants.primaryBlue())
                  ),
                ),
              ),
              const SizedBox(height: 25,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                    fixedSize: const Size(250,80)
                ),
                onPressed: (){
                  setState(() {
                    isSelected == !isSelected;
                    _adalenaController.bookTour.value = "In-Person Tour";
                  });
                },
                child: Text(
                  "In-Person Tour",
                  style: TextStyle(
                      color: Color(Constants.primaryWhite()),
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                    fixedSize: const Size(250,80)
                ),
                onPressed: (){
                  setState(() {
                    isSelected == !isSelected;
                    _adalenaController.bookTour.value = "In-Person Tour";
                  });
                },
                child: Text(
                  "In-Person Tour",
                  style: TextStyle(
                      color: Color(Constants.primaryWhite()),
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ],
          ),
        )
    ),//date&time*
    Step(
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: _currentStep >= 1,
        title: Text(
          "Media",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color(Constants.primaryGreen())
          ),),
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "How did you hear about us?",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(Constants.primaryBlue())
                  ),
                ),
              ),
              const SizedBox(height: 25,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                    fixedSize: const Size(250,80),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero
                    )
                ),
                onPressed: (){
                  setState(() {
                    isSelected == !isSelected;
                    _adalenaController.bookMedia.value = "Internet search";
                  });
                },
                child: Text(
                  "Internet Search",
                  style: TextStyle(
                      color: Color(Constants.primaryWhite()),
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                    fixedSize: const Size(250,80),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero
                    )
                ),
                onPressed: (){
                  setState(() {
                    isSelected == !isSelected;
                    _adalenaController.bookMedia.value = "Facebook";
                  });
                },
                child: Text(
                  "Facebook",
                  style: TextStyle(
                      color: Color(Constants.primaryWhite()),
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                    fixedSize: const Size(250,80),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero
                    )
                ),
                onPressed: (){
                  setState(() {
                    isSelected == !isSelected;
                    _adalenaController.bookMedia.value = "Instagram";
                  });
                },
                child: Text(
                  "Instagram",
                  style: TextStyle(
                      color: Color(Constants.primaryWhite()),
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                    fixedSize: const Size(250,80),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero
                    )
                ),
                onPressed: (){
                  setState(() {
                    isSelected == !isSelected;
                    _adalenaController.bookMedia.value = "Linked In";
                  });
                },
                child: Text(
                  "Linked In",
                  style: TextStyle(
                      color: Color(Constants.primaryWhite()),
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                    fixedSize: const Size(250,80),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero
                    )
                ),
                onPressed: (){
                  setState(() {
                    isSelected == !isSelected;
                    _adalenaController.bookMedia.value = "Family/Friend";
                  });
                },
                child: Text(
                  "Family/Friend",
                  style: TextStyle(
                      color: Color(Constants.primaryWhite()),
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ],
          ),
        )
    ),//media
    Step(
        state: _currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: _currentStep >= 2,
        title: Text(
          "Personal Details",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color(Constants.primaryGreen())
          ),),
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "What is your first and last name?",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(Constants.primaryBlue())
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              TextFormField(
                onChanged: (v){
                  _adalenaController.bookName.value = v;
                },
                validator: (v){
                  if (v == null || v.isEmpty) {
                    return 'Enter your name';
                  } else {
                    return null;
                  }
                },
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
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "What is your email?",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(Constants.primaryBlue())
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              TextFormField(
                onChanged: (v){
                  _adalenaController.bookName.value = v;
                },
                validator: (v){
                  if (v == null || v.isEmpty) {
                    return 'Enter your email';
                  } else {
                    return null;
                  }
                },
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
                ),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 22,),
            ],
          ),
        )
    ),//personal details
    Step(
        state: _currentStep > 3 ? StepState.complete : StepState.indexed,
        isActive: _currentStep >= 3,
        title: Text(
          "Completed",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color(Constants.primaryGreen())
          ),),
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "You will contacted shortly through email",
                  style: TextStyle(
                      fontSize: 30,
                      color: Color(Constants.primaryBlue())
                  ),
                ),
              ),
              const SizedBox(height: 25,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected ? Color(Constants.primaryGreen()) : Color(Constants.primaryBlue()),
                    fixedSize: const Size(250,80),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero
                    )
                ),
                onPressed: (){
                  setState(() {
                    Get.back();
                  });
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
        )
    ),
  ];
}
