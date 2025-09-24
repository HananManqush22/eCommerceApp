import 'package:e_commerce_app/configuration/components/custom_e_button.dart';
import 'package:e_commerce_app/configuration/function/build_custom_app_bar.dart';
import 'package:e_commerce_app/screens/auth/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EditNamePage extends StatelessWidget {
  const EditNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar('Edit Name', context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 15,
            children: [
              CustomTextFormField(
                hintText: 'Enter Name',
                keyboardType: TextInputType.text,
              ),
              CustomEButton(text: 'Update', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
