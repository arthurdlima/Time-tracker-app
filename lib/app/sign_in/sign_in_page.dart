import 'package:flutter/material.dart';
import 'package:timer_tracker/app/sign_in/sign_in_button.dart';
import 'package:timer_tracker/common_widgets/custom_elevated_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Tracker'),
        elevation: 2.0,
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8.0),
          SignInButton(
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
