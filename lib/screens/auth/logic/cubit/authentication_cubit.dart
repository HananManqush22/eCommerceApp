import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/screens/auth/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  static AuthenticationCubit get(context) => BlocProvider.of(context);
  SupabaseClient client = Supabase.instance.client;
  Future<void> singUp({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SingUpLoadingState());

    try {
      await client.auth.signUp(password: password, email: email);
      await createUser(email: email, name: name);
      emit(SingUpSuccessState());
    } on AuthApiException catch (e) {
      log(e.toString());
      emit(SingUpErrorState(error: e.toString()));
    } catch (e) {
      log(e.toString());
      emit(SingUpErrorState(error: e.toString()));
    }
  }

  Future<void> logIn({required String email, required String password}) async {
    emit(LogInLoadingState());

    try {
      await client.auth.signInWithPassword(password: password, email: email);
      emit(LogInSuccessState());
    } on AuthApiException catch (e) {
      log(e.toString());
      emit(LogInErrorState(error: e.toString()));
    } catch (e) {
      log(e.toString());
      emit(LogInErrorState(error: e.toString()));
    }
  }

  Future<void> googleSignIn() async {
    emit(GooglLogInLoadingState());
    try {
      const webClientId =
          '494425657209-801rmhg0mmcum4t8epu69f97cplmg30p.apps.googleusercontent.com';

      final scopes = ['email', 'profile'];
      final googleSignIn = GoogleSignIn.instance;

      await googleSignIn.initialize(serverClientId: webClientId);
      final googleUser = await googleSignIn.attemptLightweightAuthentication();

      if (googleUser == null) {
        return;
      }

      final authorization =
          await googleUser.authorizationClient.authorizationForScopes(scopes) ??
          await googleUser.authorizationClient.authorizeScopes(scopes);

      final idToken = googleUser.authentication.idToken;

      if (idToken == null) {
        throw AuthException('No ID Token found.');
      }

      await client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: authorization.accessToken,
      );
      await createUser(
        email: googleUser.email,
        name: googleUser.displayName ?? '',
      );
      emit(GooglLogInSuccessState());
    } catch (e) {
      log(e.toString());
      emit(GooglLogInErrorState(error: e.toString()));
    }
  }

  Future<void> logOut() async {
    emit(LogOutLoadingState());
    try {
      await client.auth.signOut();
      emit(LogOutSuccessState());
    } catch (e) {
      log(e.toString());
      emit(LogOutErrorState(error: e.toString()));
    }
  }

  Future<void> resetPassword({required String email}) async {
    emit(ResetPasswordLoadingState());
    try {
      await client.auth.resetPasswordForEmail(email);
      emit(ResetPasswordSuccessState());
    } catch (e) {
      log(e.toString());
      emit(ResetPasswordErrorState(error: e.toString()));
    }
  }

  Future<void> createUser({required String email, required String name}) async {
    emit(AddUserLoadingState());
    try {
      await client.from('users').upsert({
        'user_id': client.auth.currentUser!.id,
        'name': name,
        'email': email,
      }).select();
      emit(AddUserSuccessState());
    } catch (e) {
      log(e.toString());
      emit(AddUserErrorState(error: e.toString()));
    }
  }

  UserModel? userModel;
  Future<void> getUser() async {
    emit(GetUserLoadingState());
    try {
      final data = await client
          .from('users')
          .select()
          .eq("user_id", client.auth.currentUser!.id);
      userModel = UserModel(
        email: data[0]['email'],
        name: data[0]['name'],
        userId: data[0]['user_id'],
      );

      emit(GetUserSuccessState());
    } catch (e) {
      log(e.toString());
      emit(GetUserErrorState(error: e.toString()));
    }
  }
}
