import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:voco_study_case/feature/model/participant.dart';

import 'package:http/http.dart' as http;

class ParticipantProvider with ChangeNotifier {
  List<Participant> _participants = [];

  List<Participant> get participants => _participants;

  Future<void> fetchParticipants() async {
    final response = await http.get(
      Uri.parse('https://reqres.in/api/users'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> userList = data['data'];
      _participants =
          userList.map((user) => Participant.fromJson(user)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to fetch participants');
    }
  }
}
