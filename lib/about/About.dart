import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {

  _githubUrl()async{
    const url = ' https://github.com/SazinSamin/cloudy';
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw "Can't launch the $url";
    }
  }

  _emailUrl()async{
    const url = 'https://mail.google.com/sazinsamin50@gmail.com';
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw "Can't launch the $url";
    }
  }



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
              Text("This is an Open Source Project, You can contribute by Github pull requeset . . ."),
              SizedBox(height: 40,),
              Text("Design and Developed by",style: TextStyle(fontSize: 14),),
              Text("Sazin Reshed Samin",style: TextStyle(fontSize: 30),),
              Text("@Copyright 2020"),
              SizedBox(height: 30,),
              Text("Contact"),
              SizedBox(height: 7,),
              InkWell(
                child: Icon(Icons.email),
                onTap: (){
                  _emailUrl();
                },
              ),
              SizedBox(height: 10,),
              InkWell(
                child: Icon(Icons.bug_report),
                onTap: (){
                  _githubUrl();
                },
              ),
              Text("'\u{1f44f}'", style: TextStyle(fontSize: 15),),
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
