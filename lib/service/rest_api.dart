
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pdp_task_6_1/models/allEmployees.dart';
import 'package:pdp_task_6_1/models/emplopee_single.dart';
import 'package:pdp_task_6_1/models/user.dart';

class Rest_API {
  static String base = "dummy.restapiexample.com";
  static String getURL = "/api/v1/employees";
  static String getidURL = "/api/v1/employee/"; // = 1
  static String postURL = "/api/v1/create";
  static String putURL = "/api/v1/update/"; // = 21
  static String deleteURL = "/api/v1/delete/"; // = 2
  static Map<String, String> header = {};


  //get method
  static Future<List<User>> Get() async {
    var uri =  Uri.http(base, getURL);
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {      
      return AllEmployees.FromJson(jsonDecode(response.body)).data;
    }var a;
    return a;
  }

  //get id method
  static Future<User> GetId(int id) async {
    var uri =  Uri.http(base, getidURL + id.toString());
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      return Employee_single.FromJson(jsonDecode(response.body)).data;
    } var a;
    return a;
  }

}