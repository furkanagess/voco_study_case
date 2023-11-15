import 'package:flutter/material.dart';

@immutable
final class AppStrings {
  const AppStrings._();
  static const String appName = "Voco Case";
  static const String logout = "Logout";
  static const String login = "Login";
  static const String loginPage = "Login Page";
  static const String participantList = "Participant List Page";

  // Labels
  static const String email = "Email";
  static const String password = "Password";

  // Login Error
  static const String invalidCred = 'Invalid credentials. Please try again.';
  static const String loginFailed = "Login Failed";
  static const String back = "Back";

  // No Connection
  static const String noConnection = "Please Check Your Internet Connection !";
}
