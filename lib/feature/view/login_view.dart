import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voco_study_case/feature/controller/auth_controller.dart';
import 'package:voco_study_case/feature/controller/participant_provider.dart';
import 'package:voco_study_case/feature/view/participant_view.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final email = emailController.text;
                final password = passwordController.text;
                await authProvider.login(email, password);
                if (authProvider.token != null) {
                  // Login successful, fetch participants
                  await Provider.of<ParticipantProvider>(context, listen: false)
                      .fetchParticipants();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ParticipantListPage()),
                  );
                } else {
                  print('Login failed');
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
