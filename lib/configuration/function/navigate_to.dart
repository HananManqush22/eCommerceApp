import 'package:flutter/material.dart';

Future<dynamic> navigateTo(BuildContext context, Widget page) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
