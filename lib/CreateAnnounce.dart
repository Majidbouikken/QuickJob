import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnnounceCreation extends StatefulWidget {
  @override
  State createState() => new AnnounceCreationState();
}

///i tried to implement a stepper in the Sign Up Page for a good looking page

class AnnounceCreationState extends State<AnnounceCreation> {
  String title;
  String hintfield = 'fcghsdhstjhxdt';

  String fieldOfStudy;
  String description;
  var date;
  int salary;
  int dure;
  List<String> fielddropdown = [
    '''web''',
    "medecine",
    'babysetting',
    "Transport",
    "agriculture",
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Create a job announce',
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: (MediaQuery.of(context).size.width - 48) / 2,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: QuickJobColors.BlueGrey,
                    ),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      onChanged: (String value) {
                        title = value;
                      },
                      style: TextStyle(fontSize: 20, color: Colors.black87),
                      decoration: InputDecoration(
                        prefixIcon: Icon(FontAwesomeIcons.pen, size: 16,),
                        border: InputBorder.none,
                        hintText: "Title",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    width: 160,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: QuickJobColors.BlueGrey,
                    ),
                    child: Center(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (String value) {
                          dure = int.parse(value);
                        },
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                        decoration: InputDecoration(
                          prefixIcon: Icon(FontAwesomeIcons.solidClock, size: 16,),
                          border: InputBorder.none,
                          hintText: "duration (h)",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                  width: 200,
                  height: 44,
                  decoration: BoxDecoration(
                    color: QuickJobColors.BlueGrey,
                    borderRadius: BorderRadius.circular(100)
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                      value: fielddropdown[0],
                      isExpanded: false,
                      onChanged: (String newValue) {
                        fieldOfStudy = newValue;
                        hintfield = newValue;
                        setState(() {});
                      },
                      items: fielddropdown
                          .map<DropdownMenuItem<String>>((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(
                            value,
                            style: TextStyle(color: Colors.black87),
                          ),
                        );
                      }).toList(),
                    ),
                  )),
              SizedBox(
                height: 16,
              ),
              Container(
                width: 1080,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: QuickJobColors.BlueGrey,
                ),
                child: Center(
                  child: TextField(
                    maxLines: 3,
                    keyboardType: TextInputType.text,
                    onChanged: (String value) {
                      description = value;
                    },
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                    decoration: InputDecoration(
                        prefix: SizedBox(
                          width: 12,
                        ),
                        border: InputBorder.none,
                        alignLabelWithHint: true,
                        hintText: 'description'),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: 1080,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: QuickJobColors.BlueGrey,
                ),
                child: Center(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      salary = int.parse(value);
                    },
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.dollarSign, size: 16,),
                      border: InputBorder.none,
                      hintText: "salary",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: 200,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: QuickJobColors.Red,
                ),
                child: FlatButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onPressed: () async {
                      String date = DateTime.now().year.toString() +
                          '-' +
                          DateTime.now().month.toString() +
                          '-' +
                          DateTime.now().day.toString();
                      await Firestore.instance.collection('/offers').add({
                        'title': title,
                        'fieldofwork': fieldOfStudy,
                        'description': description,
                        'salary': salary,
                        'duration': dure,
                        'date': date
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AnnounceCreation()),
                      );
                    },
                    child: Text(
                      "Post",
                      style: new TextStyle(
                          color: Colors.white,
                          fontFamily: 'Oxygen',
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
