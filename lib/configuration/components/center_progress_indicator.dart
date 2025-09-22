import 'package:e_commerce_app/configuration/colors.dart';
import 'package:flutter/material.dart';

class CenterProgressIndicator extends StatelessWidget {
  const CenterProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: AppColors.kPrimaryColor),
    );
  }
}
