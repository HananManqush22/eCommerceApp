import 'package:e_commerce_app/configuration/colors.dart';
import 'package:e_commerce_app/configuration/function.dart';
import 'package:e_commerce_app/screens/profile/ui/edit_name_page.dart';
import 'package:e_commerce_app/screens/profile/ui/widgets/custom_row_btn.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * .7,
        child: Card(
          color: AppColors.kWhiteColor,
          margin: EdgeInsets.all(24),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 10,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.kPrimaryColor,
                  foregroundColor: AppColors.kWhiteColor,
                  radius: 55,
                  child: Icon(Icons.person, size: 45),
                ),
                Text(
                  'User Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('User Email'),
                CustomRowBtn(
                  onTap: () => navigateTo(context, const EditNamePage()),
                  icon: Icons.person,
                  text: 'User Email',
                ),
                CustomRowBtn(
                  onTap: () {},
                  icon: Icons.shopping_basket,
                  text: 'My Orders',
                ),
                CustomRowBtn(onTap: () {}, icon: Icons.logout, text: 'Logout'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
