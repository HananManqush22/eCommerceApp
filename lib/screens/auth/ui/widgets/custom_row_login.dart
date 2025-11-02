import 'package:e_commerce_app/core/colors.dart';
import 'package:flutter/material.dart';

class CustomRowLogin extends StatelessWidget {
  const CustomRowLogin({
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
          child: isLoading
              ? Padding(
                  padding: const EdgeInsets.all(2),
                  child: CircularProgressIndicator(
                    color: AppColors.kWhiteColor,
                  ),
                )
              : Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
