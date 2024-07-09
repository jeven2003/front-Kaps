import 'package:flutter/material.dart';
import 'package:untitled2/home.dart';
import 'package:untitled2/pages/dashboard.dart';
import 'package:untitled2/pages/login.dart';
import 'package:untitled2/pages/menu.dart';
import 'package:untitled2/pages/signup.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/signup',
  routes: {
    '/' : (context)=> Dashboard(),
    '/menu': (context) => Menu(),
    '/profile' : (context) => Home(),
    '/signup' : (context) => signup(),
    '/login' : (context) => login(),
},

));
