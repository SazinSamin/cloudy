import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Cloudy",style: TextStyle(fontSize: 50, color: Colors.greenAccent),),
              Text("version : 1.0.3"),
              SizedBox(height: 50,),
              Text("This is a Open Source Project, You can contribute by Github pull requeset . . ."),
              SizedBox(height: 40,),
              Text("Design and Developed by",style: TextStyle(fontSize: 14),),
              Text("Sazin Reshed Samin",style: TextStyle(fontSize: 30),),
              Text("@Copyright 2020"),
              SizedBox(height: 30,),
              Text("Contact"),
              SizedBox(height: 7,),
              Text("email : sazinsamin50@gmail.com", style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Text("github : https://github.com/SazinSamin/cloudy", style: TextStyle(fontSize: 15),),
              SizedBox(height: 50,),

              FloatingActionButton(
                backgroundColor: Colors.red,
                child: Icon(Icons.arrow_back_ios_outlined, size: 30, color: Colors.white,),
                onPressed: (){
                    Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
