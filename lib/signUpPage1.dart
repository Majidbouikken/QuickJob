
import 'package:flutter/material.dart';
import 'main.dart';

class SignUpPagePage1 extends StatefulWidget {
  @override
  State createState() => new SignUpPage1State();
}

///i tried to implement a stepper in the Sign Up Page for a good looking page

class SignUpPage1State extends State<SignUpPagePage1> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body:Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Inscription",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 24),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: 300,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: QuickJobColors.BlueGrey,
                ),
                child: Center(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    onChanged: (String value) {
                      Etudiant.setCompetence(value);
                    },
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.work),
                      border: InputBorder.none,
                      hintText: "Compétence",
                      /*hintStyle: Theme
                          .of(context)
                          .textTheme
                          .display2,*/
                    ),
                  ),
                ),
              ),
            SizedBox(
              height: 16,
            ),

              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[*/
                  Container(
                    width: 300,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: QuickJobColors.BlueGrey,
                    ),
                    child: Center(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        onChanged: (String value) {
                          Etudiant.setBranch(value);
                        },
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.wb_incandescent),
                          border: InputBorder.none,
                          hintText: "Filière d\'étude",
                          /*hintStyle: Theme
                          .of(context)
                          .textTheme
                          .display2,*/
                        ),
                      ),
                    ),

                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: 300,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: QuickJobColors.BlueGrey,
                    ),
                    child: Center(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        onChanged: (String value) {
                          Etudiant.setUniv(value);
                        },
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.school),
                          border: InputBorder.none,
                          hintText: "université",
                          /*hintStyle: Theme
                          .of(context)
                          .textTheme
                          .display2,*/
                        ),
                      ),
                    ),

                  ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: 300,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: QuickJobColors.BlueGrey,
                ),
                child: Center(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    onChanged: (String value) {
                      Etudiant.setHobbies(value);
                    },
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.music_note),
                      border: InputBorder.none,
                      hintText: "hobbies",
                      /*hintStyle: Theme
                          .of(context)
                          .textTheme
                          .display2,*/
                    ),
                  ),
                ),),

                /*],
              ),*/

              ],
          )


        )
        );
  }
}