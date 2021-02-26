import 'package:cloudy/about/About.dart';
import 'package:flutter/material.dart';

class PositionedWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Icon(Icons.account_box_outlined, size: 25, color: Colors.white,),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>About()));
      },
    );
  }
}
