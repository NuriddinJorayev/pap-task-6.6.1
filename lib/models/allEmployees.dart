import 'package:pdp_task_6_1/models/user.dart';

class AllEmployees{
  String status;
  String message;
  List<User> data;

  AllEmployees(this.status, this.message, this.data);

  AllEmployees.FromJson(Map<String, dynamic> json) 
 : status = json['status'],
  message = json['message'],
  data = new List<User>.from(json['data'].map((e) => User.FromJson(e))) ;
  
 Map<String, dynamic> ToJson() =>{
   'status' : status,
   'message' : message,
   'data' : new List<User>.from(data.map((e) => e.toJson()))
 };
}