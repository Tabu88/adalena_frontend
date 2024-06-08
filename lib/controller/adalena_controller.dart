import 'dart:convert';
// import 'dart:ffi';

import 'package:adult_family_home/helpers/http_helper.dart';
import 'package:adult_family_home/models/news_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../helpers/constants.dart';

class AdalenaController extends GetxController {
  Rx<double> scrollIndex = 0.0.obs;
  Rx<String> contactName = ''.obs;
  Rx<String> contactEmail = ''.obs;
  Rx<String> contactPhone = ''.obs;
  Rx<String> contactReason = "".obs;
  Rx<String> contactMedia = ''.obs;
  Rx<String> contactQuery = ''.obs;
  Rx<String> bookTour = "".obs;
  Rx<String> bookTimeline = "".obs;
  Rx<String> bookPersonOfInterest = "".obs;
  Rx<String> bookFeature = "".obs;
  Rx<String> bookDateTime = "".obs;
  Rx<String> bookMedia = "".obs;
  Rx<String> bookName = "".obs;
  Rx<String> bookEmail = "".obs;
  Rx<String> errorMessage = "".obs;
  Rx<String> validateError = "".obs;
  RxList<NewsModel> newsValidationResponse = <NewsModel>[].obs;

  resetController(){
    contactName = ''.obs;
    contactEmail = ''.obs;
    contactPhone = ''.obs;
    contactReason = ''.obs;
    contactMedia = ''.obs;
    contactQuery = ''.obs;
    bookTour = "".obs;
    bookTimeline = "".obs;
    bookPersonOfInterest = "".obs;
    bookFeature = "".obs;
    bookDateTime = "".obs;
    bookMedia = "".obs;
    bookName = "".obs;
    bookEmail = "".obs;
    errorMessage = "".obs;

  }

  Future<dynamic>bookingTour() async {
    try {
      var jsonData = {
        "name": bookName.value,
        "email": bookEmail.value,
        "typeoftour": bookTour.value,
        "personOfInterest": bookPersonOfInterest.value,
        "timeline": bookTimeline.value,
        "feature": bookFeature.value,
        "datetime": bookDateTime.value,
        "media": bookMedia.value,
      };

      final response = await HttpHelper().completePost("", jsonData);
      print("passed");
      if (response["statusCode"].toString() == "200") {
        return true;
      } else {
        errorMessage.value = response["message"].toString();
        return false;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> contactAdalena() async {
    try {
      var jsonData = {
        "name": contactName.value,
        "email": contactEmail.value,
        "phoneNumber": contactPhone.value,
        "reason": contactReason.value,
        "media": contactMedia.value,
        "query": contactQuery.value,
      };
      print(jsonData);

      final response = await HttpHelper().completePost("", jsonData);
      print(response);
      if (response["statusCode"].toString() == "200") {
        return true;
      } else {
        errorMessage.value = response["message"].toString();
        return false;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<bool> getNewsApi() async {

    try {
      var response = await http.get(Uri.parse("https://newsapi.org/v2/everything?q=HealthCare&from=2024-05-31&sortBy=popularity&apiKey=${Constants.APIKEY}"));


      final jsonData = jsonDecode(response.body);
     print(jsonData);
      if(jsonData["status"] == "ok"){
        List<NewsModel> _newsResponse =
        (jsonData["articles"] as List<dynamic>)
            .map((e) => NewsModel.fromJson(e))
            .toList();

        newsValidationResponse.value =  _newsResponse;
        return true;
      } else {
        return false;
      }
    } catch(e) {
      print("Error: $e");
      return false;
    }
  }

}