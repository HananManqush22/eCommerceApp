import 'package:e_commerce_app/configuration/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.isSecured = false,
    required this.keyboardType,
  });
  final String hintText;
  final Widget? suffixIcon;
  final bool isSecured;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null && value!.isEmpty) {
          return "This Field Is Required";
        }
        return null;
      },
      obscureText: isSecured,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,

        hintText: hintText,
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
