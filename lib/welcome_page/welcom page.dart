import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var column = Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome", style: TextStyle(fontSize: 70),),
                  SizedBox(height: 20,),
                  CircularProgressIndicator(backgroundColor: Colors.white,),
                  ],
                );
        return Scaffold(
          body: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                 colors: [Colors.blue, Colors.lightBlue] 
                )
              ),
              child: Center(
                child: column,
          ),
        ),
      )
    );
  }
}
