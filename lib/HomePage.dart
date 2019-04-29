import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main.dart';
import 'Home.dart';
import 'Posts.dart';
import 'Profile.dart';

class HomeSreen extends StatefulWidget {
  @override
  State createState() {
    return new HomeSreenState();
  }
}

class HomeSreenState extends State<HomeSreen> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget CallPage(i) {
    switch (i) {
      case 0:
        return Home();
      case 1:
        return Posts();
      case 2:
        return Profile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: QuickJobColors.BlueGrey,
        body: Stack(
          children: <Widget>[
            CallPage(_currentIndex),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavigationBar(
                iconSize: 25,
                onTap: onTabTapped, // new
                currentIndex: _currentIndex, // new
                items: [
                  new BottomNavigationBarItem(
                    title: Text('Home'),
                    icon: Icon(
                      FontAwesomeIcons.home,
                    ),
                    activeIcon: Icon(
                      FontAwesomeIcons.home,
                    ),
                  ),
                  new BottomNavigationBarItem(
                    title: Text('Jobs'),
                    icon: Icon(
                      FontAwesomeIcons.bell,
                    ),
                    activeIcon: Icon(
                      FontAwesomeIcons.solidBell,
                    ),
                  ),
                  new BottomNavigationBarItem(
                    title: Text('Profile'),
                    icon: Icon(
                      FontAwesomeIcons.user,
                    ),
                    activeIcon: Icon(
                      FontAwesomeIcons.userAlt,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
