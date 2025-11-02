import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/core/function/navigate_replacement.dart';
import 'package:e_commerce_app/core/function/navigate_to.dart';
import 'package:e_commerce_app/screens/auth/logic/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/screens/auth/ui/login_page.dart';
import 'package:e_commerce_app/screens/auth/ui/widgets/custom_row_login.dart';
import 'package:e_commerce_app/screens/auth/ui/widgets/custom_text_button.dart';
import 'package:e_commerce_app/screens/auth/ui/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/screens/nav_bar/ui/main_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: AuthenticationCubit(),
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
                        spacing: 16,
                        children: [
                          CustomTextFormField(
                            controller: _name,
                            hintText: 'Name',
                            keyboardType: TextInputType.name,
                          ),
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

                          BlocConsumer<
                            AuthenticationCubit,
                            AuthenticationState
                          >(
                            listener: (context, state) {
                              if (state is SingUpSuccessState) {
                                navigateReplacement(context, MainHomePage());
                              }
                            },
                            builder: (context, state) {
                              return CustomRowLogin(
                                isLoading: state is SingUpLoadingState,
                                text: 'Sing Up',
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    await AuthenticationCubit.get(
                                      context,
                                    ).singUp(
                                      email: _email.text,
                                      password: _password.text,
                                      name: _name.text,
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
                                text: 'Sing Up whit Google',
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
        ),
      ),
    );
  }

  @override
  void dispose() {
    _email.dispose();
    _name.dispose();
    _password.dispose();
    super.dispose();
  }
}
