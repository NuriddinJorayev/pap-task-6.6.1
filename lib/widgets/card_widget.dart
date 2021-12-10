import 'package:flutter/material.dart';

class Card_widget{
  Widget build(name, age, salary){
    return  Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name + " ("+ age.toString() + ")", style: TextStyle(fontSize: 22.0)),
            Text(salary.toString() + "\$", style: TextStyle(fontSize: 20.0)),
          ],
        ),
      ),
    );
  }
}