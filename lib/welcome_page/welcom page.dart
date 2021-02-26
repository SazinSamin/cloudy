import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome", style: TextStyle(fontSize: 70),),
                SizedBox(height: 20,),
                CircularProgressIndicator(backgroundColor: Colors.white,),
              ],
            ),
          ),
        )
      ),
    );
  }
}
