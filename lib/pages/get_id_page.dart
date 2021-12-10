import 'package:flutter/material.dart';
import 'package:pdp_task_6_1/models/user.dart';
import 'package:pdp_task_6_1/service/rest_api.dart';

class Get_id_page extends StatefulWidget {
  int id;
  Get_id_page(this.id);

  @override
  _Get_id_pageState createState() => _Get_id_pageState();
}

class _Get_id_pageState extends State<Get_id_page> {
  late Future<User> futureUser;
  List<User> user = [];

  @override
  void initState() {
    super.initState();
    futureUser = Rest_API.GetId(widget.id);
    futureUser.then((value) => (user.add(value)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Get id page"),
        ),
        body: FutureBuilder(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        '${user.first.employee_name} (${user.first.employee_age})',
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8.0),
                    Text("${user.first.employee_salary}\$",
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ],
                ),
              );
            } else
              return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
