import 'package:e_commerce_app/configuration/colors.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: ElevatedButton.icon(
          onPressed: () {},
          label: const Icon(Icons.search),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kPrimaryColor,
            foregroundColor: AppColors.kWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(5),
            ),
          ),
        ),
        hintText: 'Search in Market...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.kBorderSideColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.kBorderSideColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.kBorderSideColor),
        ),
      ),
    );
  }
}
