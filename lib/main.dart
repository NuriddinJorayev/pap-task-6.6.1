
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdp_task_6_1/models/user.dart';
import 'package:pdp_task_6_1/pages/get_id_page.dart';
import 'package:pdp_task_6_1/service/rest_api.dart';
import 'package:pdp_task_6_1/widgets/card_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> all_list = [];
  late Future<List<User>> future_list;


 

  show(List<User> user){    
      all_list = user;
  }

  @override
  void initState() {         
     super.initState();
     future_list = Rest_API.Get();
     future_list.then((value) => show(value));
       
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<List<User>>(
          future: future_list,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
          itemCount: all_list.length,
          itemBuilder: (ctx, i){
            return InkWell(
              onTap: (){page_opener(i, this.context);},
              child: Card_widget().build(snapshot.data![i].employee_name,snapshot.data![i].employee_age,snapshot.data![i].employee_salary),
            );
          },
        );
            }
            else
              return CircularProgressIndicator();
            
          }
        ),     
    ),
    );
  }
  page_opener(id, ctx){
     
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_) => Get_id_page(id+1)));
 
  }
}
