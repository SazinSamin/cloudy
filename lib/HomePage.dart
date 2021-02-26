import 'package:cloudy/ErrorPage.dart';
import 'package:cloudy/LocationChange/demo1.dart';
import 'package:cloudy/sunrise_and_set/SunTime.dart';
import 'package:cloudy/widgets/main_widget.dart';
import 'package:cloudy/button_widget/positioned_2.dart';
import 'package:cloudy/second_ListTile.dart';
import 'package:cloudy/welcome_page/welcom%20page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {

  String locationOne;
  HomePage({this.locationOne});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  //Main widget variable
  var areaName;
  var temp;
  var des;
  //secondary widget variable
  var feelLike;
  var humidity;
  var windSpeed;
  var visibility;
  var cloud;
  var pressure;
  var windDegree;
  var lat;
  var long;
  //sunset and sunrise
  var sunset;
  var sunrise;

  var sr;
  var ss;

  //Force this methods for run first
  @override
  void initState() {
    super.initState();
    resetLocation();
    getWeather();
  }

  var area;

  void resetLocation(){
    setState(() {
      if(widget.locationOne !=null){
        widget.locationOne = widget.locationOne.trim();
      }
      area = widget.locationOne;
    });
  }


  //http response from the api
  Future getWeather() async {
    http.Response response = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?q=${area ==null ? "Jhenaidah" : widget.locationOne}&appid=263241df63fdd1b6dd713b14834fb2eb");
    var result = jsonDecode(response.body);

    setState(() {
      // Main widget variable data collection
      this.areaName = result['name'];
      this.temp = ((result['main']['temp']) - 273.15).round();
      this.des = result['weather'][0]['description'];
      // Secondary widget variable data collection
      //also do some calculation to match with local units
      this.feelLike = ((result['main']['feels_like']) - 273.15).round();
      this.humidity = result['main']['humidity'];
      this.windSpeed = ((result['wind']['speed']) * 3.6).round();
      this.visibility = (result['visibility']) / 1000;
      this.cloud = result['clouds']['all'];
      this.pressure = result['main']['pressure'];
      this.windDegree = result['wind']['degree'];
      this.lat = result['coord']['lat'];
      this.long = result['coord']['lon'];

      var getSunTimeValue = result['sys']['sunset'];
      this.sunrise = SunTime(result['sys']['sunrise']).Execute();
      this.sunset = SunTime(result['sys']['sunset']).Execute();
      print("The value here : $sunrise");
      print("The value here : $sunset");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight, end: Alignment.bottomCenter,
                colors: [Colors.indigo, Colors.indigo, Colors.blue]
            )
        ),
        child: temp != null
            ? RefreshIndicator(
                color: Colors.white,
                backgroundColor: Colors.greenAccent,
                onRefresh: getWeather,
                child: Stack(
                  children: [
                Column(
                  children: [
                    MainWidget(
                      areaName: areaName,
                      temp: temp,
                      des: des,
                    ),
                    SecondaryTile(
                      feelLike: feelLike,
                      humidity: humidity,
                      windSpeed: windSpeed,
                      visibility: visibility,
                      cloud: cloud,
                      pressure: pressure,
                      windDegree: windSpeed,
                      lat: lat,
                      long: long,
                      sunrise: sunrise,
                      sunset: sunset,
                    ),
                  ],
                ),
                Positioned(
                  top: 370,
                  right: 150,
                  child: FloatingActionButton(
                    elevation: 30,
                      backgroundColor: Colors.red,
                  child: Icon(Icons.edit_location, color: Colors.white, size: 30,),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ChangeLoc(),
                    ));
                  }),
                ),
                Positioned(
                  top: 50,
                  right: 5,
                  child: PositionedWidget2(),
                ),
                  ],
                ),
              )
            : WelcomePage(),
      ),
    );
  }
}
