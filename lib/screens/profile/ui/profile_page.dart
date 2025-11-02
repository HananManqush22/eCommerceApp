import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/core/function/navigate_replacement.dart';
import 'package:e_commerce_app/core/function/navigate_to.dart';
import 'package:e_commerce_app/screens/auth/logic/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/screens/auth/model/user_model.dart';
import 'package:e_commerce_app/screens/auth/ui/login_page.dart';
import 'package:e_commerce_app/screens/profile/my_orders_page.dart';
import 'package:e_commerce_app/screens/profile/ui/edit_name_page.dart';
import 'package:e_commerce_app/screens/profile/ui/widgets/custom_row_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: AuthenticationCubit()..getUser(),
      child: Center(
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
              child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
                listener: (context, state) {
                  if (state is LogOutSuccessState) {
                    navigateReplacement(context, LoginPage());
                  }
                },
                builder: (context, state) {
                  UserModel? user = AuthenticationCubit.get(context).userModel;
                  return Column(
                    spacing: 10,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.kPrimaryColor,
                        foregroundColor: AppColors.kWhiteColor,
                        radius: 55,
                        child: Icon(Icons.person, size: 45),
                      ),
                      Text(
                        user?.name ?? "User Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(user?.email ?? "email"),
                      CustomRowBtn(
                        onTap: () => navigateTo(context, const EditNamePage()),
                        icon: Icons.person,
                        text: 'User Email',
                      ),
                      CustomRowBtn(
                        onTap: () => navigateTo(context, const MyOrdersPage()),
                        icon: Icons.shopping_basket,
                        text: 'My Orders',
                      ),

                      CustomRowBtn(
                        isLoading: state is LogOutLoadingState,
                        onTap: () => AuthenticationCubit.get(context).logOut(),
                        icon: Icons.logout,
                        text: 'Logout',
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
