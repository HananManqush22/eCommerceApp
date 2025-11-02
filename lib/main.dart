import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/dio_consume.dart';
import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/core/cubit/home_cubit.dart';
import 'package:e_commerce_app/core/sensitive_data.dart';
import 'package:e_commerce_app/core/simple_observer_bloc.dart';
import 'package:e_commerce_app/screens/auth/ui/login_page.dart';
import 'package:e_commerce_app/screens/nav_bar/ui/main_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleObserverBloc();
  await Supabase.initialize(url: supBaseUrl, anonKey: anonKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //494425657209-nn25dspp4t5djcg9v3jjdqo5n8cn4oiv.apps.googleusercontent.com
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SupabaseClient client = Supabase.instance.client;
    return BlocProvider(
      create: (context) => HomeCubit(DioConsume(dio: Dio())),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(scaffoldBackgroundColor: AppColors.kScaffoldColor),
        debugShowCheckedModeBanner: false,
        home: client.auth.currentUser == null ? LoginPage() : MainHomePage(),
      ),
    );
  }
}
