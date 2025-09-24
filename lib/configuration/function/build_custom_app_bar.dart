import 'package:e_commerce_app/configuration/colors.dart';
import 'package:flutter/material.dart';

AppBar buildCustomAppBar(String title, context) {
  return AppBar(
    backgroundColor: AppColors.kPrimaryColor,
    centerTitle: true,
    title: Text(title, style: TextStyle(color: AppColors.kWhiteColor)),
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(Icons.arrow_back_ios, color: AppColors.kWhiteColor),
    ),
  );
}
