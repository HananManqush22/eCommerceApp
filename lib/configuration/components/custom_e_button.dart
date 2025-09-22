import 'package:e_commerce_app/configuration/colors.dart';
import 'package:flutter/material.dart';

class CustomEButton extends StatelessWidget {
  const CustomEButton({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kPrimaryColor,
        foregroundColor: AppColors.kWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
