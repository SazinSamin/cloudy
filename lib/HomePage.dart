import 'package:cloudy/LocationChange/Location_change.dart';
import 'package:cloudy/loading/loading.dart';
import 'package:cloudy/sunrise_and_set/SunTime.dart';
import 'package:cloudy/widgets/main_widget.dart';
import 'package:cloudy/button_widget/positioned_2.dart';
import 'package:cloudy/second_ListTile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {

  String locationOne;
  var apiData;

  HomePage({this.locationOne, this.apiData});

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

  var tempMax;
  var tempMin;

  var country;


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

      this.sunrise = SunTime(result['sys']['sunrise']).Execute();
      this.sunset = SunTime(result['sys']['sunset']).Execute();

      this.tempMax = ((result['main']['temp_max']) - 273.15).round();
      this.tempMin =((result['main']['temp_min']) - 273.15).round();

      this.country = result['sys']['country'];

      debugPrint(this.tempMax.toString());

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight, end: Alignment.bottomCenter,
                colors: [Colors.lightBlue,  Colors.blue[900]]
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
                      country: country,
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
                      tempMax: tempMax,
                      tempMin: tempMin,
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
            : LoadingState(),
      ),
    );
  }
}
