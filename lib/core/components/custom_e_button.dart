import 'package:e_commerce_app/core/colors.dart';
import 'package:flutter/material.dart';

class CustomEButton extends StatelessWidget {
  const CustomEButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  });
  final String text;
  final void Function()? onPressed;
  final bool isLoading;
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
