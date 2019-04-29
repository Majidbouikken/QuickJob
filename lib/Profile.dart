import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'logInPage.dart';
import 'main.dart';

Widget Profile() {

    return Scaffold(
      backgroundColor: QuickJobColors.BlueGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/img/photo de profil.jpg'),
                            fit: BoxFit.cover),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          new BoxShadow(
                              color: QuickJobColors.BlueGrey, blurRadius: 10),
                          new BoxShadow(
                              color: QuickJobColors.BlueGrey2,
                              offset: Offset(0, 6),
                              blurRadius: 12),
                        ]),
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        Etudiant.getNom(),
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            color: QuickJobColors.BlueGrey9,
                            fontSize: 20),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '${Etudiant.univ}',
                            style:
                            TextStyle(fontFamily: 'Quicksand', fontSize: 10),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '19',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 28,
                                color: QuickJobColors.BlueGrey6),
                          ),
                          Text(
                            ' Years old',
                            style:
                            TextStyle(fontFamily: 'Quicksand', fontSize: 14),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text('''${Etudiant.competence}'''),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: QuickJobColors.BlueGrey2, width: 1.2),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: FlatButton(
                            materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                            highlightColor: QuickJobColors.BlueGrey,
                            splashColor: QuickJobColors.BlueGrey,
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.pen,
                                  size: 16,
                                  color: QuickJobColors.BlueGrey4,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Edit profile',
                                  style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: QuickJobColors.BlueGrey4),
                                ),
                              ],
                            ))),
                  ),
                  SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      border:
                      Border.all(color: QuickJobColors.BlueGrey2, width: 1.2),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: FlatButton(
                        materialTapTargetSize:
                        MaterialTapTargetSize.shrinkWrap,
                        highlightColor: QuickJobColors.BlueGrey,
                        splashColor: QuickJobColors.BlueGrey,
                        onPressed: () {},
                        child: Icon(
                          FontAwesomeIcons.cog,
                          size: 16,
                          color: QuickJobColors.BlueGrey4,
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }