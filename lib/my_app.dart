import 'package:cloudy/HomePage.dart';
import 'package:cloudy/connectionCheck/connection.dart';
import 'package:cloudy/welcome_page/welcom%20page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  /*@override
  void initState() {
    getData();
    

  }*/


  getData()async{
      http.Response response = await http.get("http://api.openweathermap.org/data/2.5/weather?q=Jhenaidah&appid=263241df63fdd1b6dd713b14834fb2eb");
      return response.statusCode;
  }


  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: getData(),
      builder: (BuildContext context, snapshot){
        if(snapshot.data== 200){
          return HomePage();
        }else if(snapshot.connectionState == ConnectionState.waiting){
          return WelcomePage();
        }else{
          debugPrint(snapshot.connectionState.toString());
          return Connection();
        }
      }
      );
  }
}
