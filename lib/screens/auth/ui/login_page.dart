import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/core/function/navigate_replacement.dart';
import 'package:e_commerce_app/core/function/navigate_to.dart';
import 'package:e_commerce_app/screens/auth/logic/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/screens/auth/ui/forget_page.dart';
import 'package:e_commerce_app/screens/auth/ui/sing_up_page.dart';
import 'package:e_commerce_app/screens/auth/ui/widgets/custom_row_login.dart';
import 'package:e_commerce_app/screens/auth/ui/widgets/custom_text_button.dart';
import 'package:e_commerce_app/screens/auth/ui/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/screens/nav_bar/ui/main_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                          CustomTextFormField(
                            controller: _email,
                            hintText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          CustomTextFormField(
                            controller: _password,
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
                          BlocConsumer<
                            AuthenticationCubit,
                            AuthenticationState
                          >(
                            listener: (context, state) {
                              if (state is LogInSuccessState) {
                                navigateReplacement(context, MainHomePage());
                              }
                            },
                            builder: (context, state) {
                              return CustomRowLogin(
                                isLoading: state is LogInLoadingState,
                                text: 'Login',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    AuthenticationCubit.get(context).logIn(
                                      email: _email.text,
                                      password: _password.text,
                                    );
                                  }
                                },
                              );
                            },
                          ),
                          BlocConsumer<
                            AuthenticationCubit,
                            AuthenticationState
                          >(
                            listener: (context, state) {
                              if (state is GooglLogInSuccessState) {
                                navigateReplacement(context, MainHomePage());
                              }
                            },
                            builder: (context, state) {
                              return CustomRowLogin(
                                isLoading: state is GooglLogInLoadingState,
                                text: 'Login whit Google',
                                onPressed: () => AuthenticationCubit.get(
                                  context,
                                ).googleSignIn(),
                              );
                            },
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
        ),
      ),
    );
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
}
