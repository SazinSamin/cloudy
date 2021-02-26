import 'package:cloudy/HomePage.dart';
import 'package:flutter/material.dart';

class ChangeLoc extends StatefulWidget {


  ChangeLoc({this.LocationChange});
  Function(String) LocationChange;

  @override
  _ChangeLocState createState() => _ChangeLocState();
}

class _ChangeLocState extends State<ChangeLoc> {

  String areaOne;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 2.0,
            colors: [Colors.greenAccent, Colors.blue]
          )
        ),
        padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
        child: Column(
          children: [
            TextFormField(
              style: TextStyle(fontSize: 30),
              decoration: InputDecoration(
                hintText: "Type here",fillColor: Colors.grey,
                labelText: "Enter the new location"
              ),
              onChanged: (val){
                setState(() {
                  areaOne = val;
                });
              },
            ),
            SizedBox(height: 50,),
            FloatingActionButton(
              heroTag: "Push to new location",
              backgroundColor: Colors.lightGreenAccent,
              child: Icon(Icons.done, color: Colors.red,),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> HomePage(locationOne: areaOne,)
                ));
              },
            ),
            SizedBox(height: 30,),
            FloatingActionButton(
              heroTag: "Cancel the location change",
              backgroundColor: Colors.red,
              child: Icon(Icons.cancel, color: Colors.white,),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
