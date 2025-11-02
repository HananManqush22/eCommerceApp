import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/core/components/custom_e_button.dart';
import 'package:e_commerce_app/screens/auth/logic/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/screens/auth/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPage extends StatefulWidget {
  const ForgetPage({super.key});

  @override
  State<ForgetPage> createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {
  final TextEditingController _email = TextEditingController();
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
                          CustomTextFormField(
                            controller: _email,
                            hintText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          BlocConsumer<
                            AuthenticationCubit,
                            AuthenticationState
                          >(
                            listener: (context, state) {
                              if (state is ResetPasswordSuccessState) {
                                Navigator.pop(context);
                              }
                            },
                            builder: (context, state) {
                              return CustomEButton(
                                text: 'Send',
                                isLoading: state is ResetPasswordLoadingState,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    AuthenticationCubit.get(
                                      context,
                                    ).resetPassword(email: _email.text);
                                  }
                                },
                              );
                            },
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
    super.dispose();
  }
}
