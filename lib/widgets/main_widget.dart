import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class MainWidget extends StatefulWidget {

  MainWidget({this.areaName, this.country, this.temp, this.des});

  var areaName;
  var country;
  var temp;
  var des;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {


  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.areaName.toString(),
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white, fontSize: 25)),
              Text(", ${widget.country.toString()}"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(widget.temp.toString() + '\u00B0', style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.white)),
              Text('c', style: TextStyle(fontSize: 70, color: Colors.white),),],),
          Text(widget.des.toString(), style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white),)
        ],
      ),
    );
  }
}
