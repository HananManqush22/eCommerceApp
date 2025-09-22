import 'package:e_commerce_app/configuration/colors.dart';
import 'package:e_commerce_app/configuration/function.dart';
import 'package:e_commerce_app/screens/auth/ui/forget_page.dart';
import 'package:e_commerce_app/screens/auth/ui/sing_up_page.dart';
import 'package:e_commerce_app/screens/auth/ui/widgets/custom_row_login.dart';
import 'package:e_commerce_app/screens/auth/ui/widgets/custom_text_button.dart';
import 'package:e_commerce_app/screens/auth/ui/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/screens/nav_bar/ui/main_home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 25),
              const Text(
                'Welcome To Our Market',
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: 16,
                    children: [
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
                      CustomTextButton(
                        text: 'Forget Password?',
                        onTap: () {
                          navigateTo(context, ForgetPage());
                        },
                      ),
                      CustomRowLogin(
                        text: 'Login',
                        onPressed: () {
                          navigateTo(context, MainHomePage());
                        },
                      ),
                      CustomRowLogin(
                        text: 'Login whit Google',
                        onPressed: () {},
                      ),
                      Row(
                        spacing: 5,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CustomTextButton(
                            text: 'Sing Up',
                            onTap: () {
                              navigateTo(context, const SingUpPage());
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
