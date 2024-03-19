import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mahalle_man/LoginPage.dart';
import 'package:mahalle_man/Products.dart';
import 'BottomNavigator.dart';
import 'package:http/http.dart';
import 'DescriptionPage.dart';
import 'lang/faLang.dart';
import 'shoppingBasket.dart';

void main() => runApp(MainMaterial());
var lang = FaLang();
var fontFamily = FontFamily();
class MainMaterial extends StatelessWidget {
  const MainMaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}