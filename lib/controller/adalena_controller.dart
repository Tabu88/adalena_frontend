import 'dart:convert';

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
        "to": bookEmail.value,
        "subject": bookName.value,
        "body": "Name:${bookName.value}, Media: ${bookMedia.value}, Feature: ${bookFeature.value}"
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
        "to": contactEmail.value,
        "subject": contactReason.value,
        "body": "Query:${contactQuery.value}, Media: ${contactMedia.value}"
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