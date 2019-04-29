import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

Future<dynamic> getOffers()  async{
  var q = await Firestore.instance.collection('/offers').getDocuments();
  return q ;

}

Widget Posts() {

  return FutureBuilder(
      future: getOffers(),
  builder: (_, snapshot) {
  if (snapshot.data == null) {
  return Center(child: CircularProgressIndicator());
  } else {
    return CustomScrollView(slivers: <Widget>[
    SliverAppBar(
      backgroundColor: QuickJobColors.BlueGrey,
      floating: true,
      bottom: PreferredSize(
        preferredSize: Size(1080, 80),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: SafeArea(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      height: 96,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          boxShadow: [
                            //TODO: add this shadow color to the main as color variable
                            new BoxShadow(
                                color: QuickJobColors.BlueGrey, blurRadius: 10),
                            new BoxShadow(
                                color: QuickJobColors.BlueGrey1,
                                offset: Offset(0, 12),
                                blurRadius: 12),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.solidBookmark,
                                    color: QuickJobColors.Blue,
                                    size: 26,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Applied',
                                    style: TextStyle(
                                        color: QuickJobColors.Blue,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      height: 96,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          boxShadow: [
                            new BoxShadow(
                                color: QuickJobColors.BlueGrey, blurRadius: 10),
                            new BoxShadow(
                                color: QuickJobColors.BlueGrey1,
                                offset: Offset(0, 12),
                                blurRadius: 12),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.solidHeart,
                                    color: QuickJobColors.Red,
                                    size: 26,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Interested',
                                    style: TextStyle(
                                        color: QuickJobColors.Red,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    SliverList(
      delegate: SliverChildListDelegate(
        [
          LineCard(snapshot.data.documents[0].data['title'],snapshot.data.documents[0].data['description'],snapshot.data.documents[0].data['fieldofwork'],snapshot.data.documents[0].data['date'],snapshot.data.documents[0].data['lieu'],),
          LineCard(snapshot.data.documents[1].data['title'],snapshot.data.documents[1].data['description'],snapshot.data.documents[1].data['fieldofwork'],snapshot.data.documents[1].data['date'],snapshot.data.documents[1].data['lieu'],),
          LineCard(snapshot.data.documents[2].data['title'],snapshot.data.documents[2].data['description'],snapshot.data.documents[2].data['fieldofwork'],snapshot.data.documents[2].data['date'],snapshot.data.documents[2].data['lieu'],),
          LineCard(snapshot.data.documents[3].data['title'],snapshot.data.documents[3].data['description'],snapshot.data.documents[3].data['fieldofwork'],snapshot.data.documents[3].data['date'],snapshot.data.documents[3].data['lieu'],),
          LineCard(snapshot.data.documents[4].data['title'],snapshot.data.documents[4].data['description'],snapshot.data.documents[4].data['fieldofwork'],snapshot.data.documents[4].data['date'],snapshot.data.documents[4].data['lieu'],),
          LineCard(snapshot.data.documents[5].data['title'],snapshot.data.documents[5].data['description'],snapshot.data.documents[5].data['fieldofwork'],snapshot.data.documents[5].data['date'],snapshot.data.documents[5].data['lieu'],),
          LineCard(snapshot.data.documents[6].data['title'],snapshot.data.documents[6].data['description'],snapshot.data.documents[6].data['fieldofwork'],snapshot.data.documents[6].data['date'],snapshot.data.documents[6].data['lieu'],),
          LineCard(snapshot.data.documents[7].data['title'],snapshot.data.documents[7].data['description'],snapshot.data.documents[7].data['fieldofwork'],snapshot.data.documents[7].data['date'],snapshot.data.documents[7].data['lieu'],),
          LineCard(snapshot.data.documents[8].data['title'],snapshot.data.documents[8].data['description'],snapshot.data.documents[8].data['fieldofwork'],snapshot.data.documents[8].data['date'],snapshot.data.documents[8].data['lieu'],),
          LineCard(snapshot.data.documents[9].data['title'],snapshot.data.documents[9].data['description'],snapshot.data.documents[9].data['fieldofwork'],snapshot.data.documents[9].data['date'],snapshot.data.documents[9].data['lieu'],),
          Container(
              padding: EdgeInsets.only(top: 38, bottom: 120),
              child: Column(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.bullseye,
                    size: 60,
                    color: QuickJobColors.BlueGrey2,
                  ),
                  SizedBox(height: 18,),
                  Text(
                    '''You reached the end of the list!''',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                      color: QuickJobColors.BlueGrey2,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ))
        ],
      ),
    )
  ]);
}});
}

Widget LineCard(String title, String des, String field, String duree, String lieu) {
  var butteoncolor = QuickJobColors.Yellow;
  return  Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16, left: 20, right: 20),
            child: Container(
              height: 142,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  boxShadow: [
                    //TODO: add this shadow color to the main as color variable
                    new BoxShadow(color: QuickJobColors.BlueGrey, blurRadius: 10),
                    new BoxShadow(
                        color: QuickJobColors.BlueGrey1,
                        offset: Offset(0, 12),
                        blurRadius: 12),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '${title}',
                              style: TextStyle(
                                  color: QuickJobColors.BlueGrey9,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15),
                            ),
                            Text(
                              ' / ${field}',
                              style: TextStyle(
                                  color: QuickJobColors.BlueGrey4,
                                  fontFamily: 'Quicksand',
                                  fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              padding: EdgeInsets.only(left: 8),
                              width: 200,
                              child: Text(
                                  '''${des}''',style: TextStyle(fontFamily: 'OpenSans',fontSize: 12),)),
                        ),
                        Expanded(child: SizedBox()),
                        Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.mapMarkerAlt,
                              size: 16,
                              color: QuickJobColors.BlueGrey4,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              '${lieu}',
                              style: TextStyle(
                                  fontFamily: 'OpenSans', fontWeight: FontWeight.w600, color: QuickJobColors.BlueGrey4,),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Icon(
                              FontAwesomeIcons.solidClock,
                              size: 16,
                              color: QuickJobColors.BlueGrey4,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text('${duree}',
                                style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600, color: QuickJobColors.BlueGrey4,)),
                          ],
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: butteoncolor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: FlatButton(
                            clipBehavior: Clip.antiAlias,
                            color: Colors.transparent,
                            highlightColor: QuickJobColors.lightYellow,
                            splashColor: QuickJobColors.lightYellow,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            onPressed: () {

                            },
                            child: Text(
                              'Apply',
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );



}
