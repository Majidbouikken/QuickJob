import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main.dart';

Widget Home() {

  return Scaffold(
    body: CustomScrollView(
      slivers: <Widget>[
    SliverList(
    delegate: SliverChildListDelegate([
      Image.asset('assets/img/HomeScreen.png')
    ]))],),);}