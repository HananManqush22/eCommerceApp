import 'package:e_commerce_app/configuration/colors.dart';
import 'package:e_commerce_app/configuration/components/custom_e_button.dart';
import 'package:e_commerce_app/screens/auth/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ForgetPage extends StatelessWidget {
  const ForgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 25),
              const Text(
                'Enter Your Email To Reset Password',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Card(
                color: AppColors.kWhiteColor,
                margin: EdgeInsets.all(24),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 16,
                    children: [
                      const CustomTextFormField(
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      CustomEButton(text: 'Send', onPressed: () {}),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
