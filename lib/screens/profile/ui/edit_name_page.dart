import 'package:e_commerce_app/core/components/custom_e_button.dart';
import 'package:e_commerce_app/core/function/build_custom_app_bar.dart';
import 'package:e_commerce_app/screens/auth/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key});

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  final TextEditingController _editName = TextEditingController();
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
                controller: _editName,
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

  @override
  void dispose() {
    _editName.dispose();
    super.dispose();
  }
}
