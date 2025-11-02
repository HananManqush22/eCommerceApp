import 'package:e_commerce_app/core/colors.dart';
import 'package:flutter/material.dart';

class CustomRowBtn extends StatelessWidget {
  const CustomRowBtn({
    super.key,
    required this.icon,
    this.onTap,
    required this.text,
    this.isLoading = false,
  });
  final IconData icon;
  final void Function()? onTap;
  final String text;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kPrimaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(9)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: AppColors.kWhiteColor),
              isLoading
                  ? CircularProgressIndicator(color: AppColors.kWhiteColor)
                  : Text(text, style: TextStyle(color: AppColors.kWhiteColor)),
              Icon(Icons.arrow_forward_ios, color: AppColors.kWhiteColor),
            ],
          ),
        ),
      ),
    );
  }
}
