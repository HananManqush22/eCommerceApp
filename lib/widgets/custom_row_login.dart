import 'package:e_commerce_app/configuration/colors.dart';
import 'package:flutter/material.dart';

class CustomRowLogin extends StatelessWidget {
  const CustomRowLogin({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kPrimaryColor,
            foregroundColor: AppColors.kWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
          ),
          onPressed: onPressed,
          child: Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
