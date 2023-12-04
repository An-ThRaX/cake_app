// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_net_ninja_tutorial/world_time/pages/choose_location.dart';
import 'package:flutter_net_ninja_tutorial/world_time/pages/home.dart';
import 'package:flutter_net_ninja_tutorial/world_time/pages/loading.dart';


void main() => runApp(MaterialApp(
  // used for the moment, while we create the home screen
  initialRoute: '/home',
    routes: {
      // this defines the base route; should be the same as the value of the home:
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
    ));

