
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:adult_family_home/helpers/widget_helper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';

class HttpHelper {

  dynamic apiResponse;
  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': "application/json",
  };

  Future<dynamic> completePost(String uri, dynamic body) async {
    try {
      print("reached");
      final response = await http.post(Uri.parse("${Constants.ENDPOINT}$uri"),
        headers: _headers,
        body: jsonEncode(body)
      );
      print("passed");
      apiResponse = response;

      log(apiResponse);
      if(response.statusCode >= 200 && response.statusCode < 300 ) {
        return true;
      } else if( response.statusCode == 401) {
        return false;
      } else if(response.statusCode == 404) {
        var message = apiResponse["message"];
        
        return false;
      } else if(response.statusCode == 500) {
        return false;
      } else {

        var message = apiResponse["message"] ?? "This unknown error occurred try again later";
        return message;
      }

    } on SocketException {
      WidgetHelper.snackbar("Network error","check your internet connection", 50000, 250);
    } catch (error, trace) {
      return "An unknown error occurred try again later $error";
    }
  }

}