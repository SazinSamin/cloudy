import 'package:cloudy/widgets/secondary_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecondaryTile extends StatelessWidget {


  SecondaryTile({this.feelLike, this.humidity, this.windSpeed, this.visibility, this.cloud, this.pressure, this.windDegree, this.lat, this.long, this.sunrise, this.sunset});

  var feelLike;
  var humidity;
  var windSpeed;
  var visibility;
  var cloud;
  var pressure;
  var windDegree;
  var lat;
  var long;
  var sunrise;
  var sunset;

  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 1, 15, 5),
      child: Container(
        height: MediaQuery.of(context).size.height/2.16,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              SecondaryWidget(icon: FontAwesomeIcons.smile,
                dataName: "feel like", dataValue: feelLike.toString() + '\u00B0',
              ),
              SecondaryWidget(icon: FontAwesomeIcons.snowflake,
                dataName: "humidity", dataValue: humidity.toString() + "%",
              ),
              SecondaryWidget(icon: FontAwesomeIcons.solidSun,
                dataName: "sunrise", dataValue: sunrise.toString(),
              ),
              SecondaryWidget(icon: FontAwesomeIcons.cloud,
                dataName: "cloud", dataValue: cloud.toString() + ' %',
              ),
              SecondaryWidget(icon: FontAwesomeIcons.wind,
                dataName: "wind speed", dataValue: windSpeed.toString() + ' km/hr',
              ),
              SecondaryWidget(icon: FontAwesomeIcons.lowVision,
                dataName: "visibility", dataValue: visibility.toString() + ' km',
              ),
              SecondaryWidget(icon: FontAwesomeIcons.compress,
                dataName: "pressure", dataValue: pressure.toString() + " bar",
              ),
              SecondaryWidget(icon: FontAwesomeIcons.arrowLeft,
                dataName: "wind degree", dataValue: windDegree.toString(),
              ),
              SecondaryWidget(icon: FontAwesomeIcons.landmark,
                dataName: "lat", dataValue: lat.toString(),
              ),
              SecondaryWidget(icon: FontAwesomeIcons.landmark,
                dataName: "long", dataValue: long.toString(),
              ),
              SecondaryWidget(icon: FontAwesomeIcons.sun,
                dataName: "sunset", dataValue: sunset.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
