import 'package:pdp_task_6_1/models/user.dart';

class Employee_single{
   String status;
   String message;
   User data;
  Employee_single(this.status, this.message, this.data);

  Employee_single.FromJson(Map<String, dynamic> json)
  : status = json['status'],
   message = json['message'],
   data = User.FromJson(json['data']);

   Map<String, dynamic> ToJson()=>{
      'status' : status,
      'message' : message,
      'data' : data.toJson(),
   };
}