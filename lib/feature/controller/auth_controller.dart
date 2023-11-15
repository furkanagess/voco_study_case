import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController with ChangeNotifier {
  String? _token;

  String? get token => _token;

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://reqres.in/api/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      _token = data['token'];
      await saveTokenToLocal(_token!);
      notifyListeners();
    } else {
      throw Exception('Login failed');
    }
  }

  Future<void> saveTokenToLocal(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<void> loadTokenFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    notifyListeners();
  }

  void logout() async {
    _token = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    notifyListeners();
  }
}
