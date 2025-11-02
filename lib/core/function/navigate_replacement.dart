import 'package:flutter/material.dart';

Future<dynamic> navigateReplacement(BuildContext context, Widget page) =>
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
