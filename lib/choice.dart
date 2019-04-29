import 'package:flutter/material.dart';
import 'logInPage.dart';
import 'package:quickjob/CreateAnnounce.dart';
class First extends StatefulWidget {
  @override
  State createState() => new FirstState();
}

class FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Body
        body: PageView(children: <Widget>[
          First1(),
          First2(),

        ],));
  }}


class First1 extends StatefulWidget {
  @override
  State createState() => new First1State();
}

///i tried to implement a stepper in the Sign Up Page for a good looking page

class First1State extends State<First1> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Body
        body: GestureDetector(
            child: Container(
              width: 1000,
              height: 1000,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: Color(0xFF1C92D2),),
              child:Center(child: Text('Student', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontSize: 35, fontFamily: 'Oxygen'),),),),
            onLongPress: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => LogInPage()),
              );
            }

        )

    );
  }
}

class First2 extends StatefulWidget {
  @override
  State createState() => new First2State();
}

///i tried to implement a stepper in the Sign Up Page for a good looking page

class First2State extends State<First2> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Body
        body:  GestureDetector(
            child: Container(
              width: 1000,
              height: 1000,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: Color(0xFFFF5C3E),),
              child:Center(child: Text('Employer', style: TextStyle(color: Colors.white, fontSize: 35, fontFamily: 'Oxygen',fontWeight: FontWeight.w700),),),),
            onLongPress: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => AnnounceCreation()),
              );
            }

        )

    );
  }
}