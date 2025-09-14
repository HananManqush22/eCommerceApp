import 'package:e_commerce_app/configuration/colors.dart';
import 'package:e_commerce_app/configuration/function.dart';
import 'package:e_commerce_app/screens/login/login_page.dart';
import 'package:e_commerce_app/widgets/custom_row_login.dart';
import 'package:e_commerce_app/widgets/custom_text_button.dart';
import 'package:e_commerce_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SingUpPage extends StatelessWidget {
  const SingUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome To Our Market',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
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
                        hintText: 'Name',
                        keyboardType: TextInputType.name,
                      ),
                      const CustomTextFormField(
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      CustomTextFormField(
                        hintText: 'Password',
                        keyboardType: TextInputType.visiblePassword,
                        isSecured: true,
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.visibility_off),
                        ),
                      ),

                      CustomRowLogin(text: 'Sing Up', onPressed: () {}),
                      CustomRowLogin(
                        text: 'Sing Up whit Google',
                        onPressed: () {},
                      ),
                      Row(
                        spacing: 5,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CustomTextButton(
                            text: 'Login ',
                            onTap: () {
                              navigateTo(context, const LoginPage());
                            },
                          ),
                        ],
                      ),
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
