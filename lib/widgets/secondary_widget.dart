import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecondaryWidget extends StatelessWidget {
  SecondaryWidget({this.icon, this.dataName, this.dataValue});

  var icon;
  var dataName;
  var dataValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
      child: Container(
        child: ListTile(
          leading: FaIcon(
            icon,
            color: Colors.greenAccent,
          ),
          title: Text(dataName != null ? dataName : "No data found",
              style: Theme.of(context).textTheme.bodyText2),
          trailing: Text(
            dataValue != null ? dataValue : "no data found",
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(fontSize: 15, fontStyle: FontStyle.italic, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
