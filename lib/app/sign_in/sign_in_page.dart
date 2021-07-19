import 'package:flutter/material.dart';
import 'package:timer_tracker/app/sign_in/sign_in_button.dart';
import 'package:timer_tracker/services/auth.dart';

import 'social_sign_in_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    Key? key,
    @required this.auth,
  }) : super(key: key);

  final AuthBase? auth;

  Future<void> _signInAnonymously() async {
    try {
      await auth?.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

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
          const SizedBox(height: 48.0),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black,
            color: Colors.white,
            onPressed: () {},
          ),
          const SizedBox(height: 8.0),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () {},
          ),
          const SizedBox(height: 8.0),
          SignInButton(
            text: 'Sign in with email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: () {},
          ),
          const SizedBox(height: 8.0),
          const Text(
            'ok',
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          SignInButton(
            text: 'Go anonymous',
            textColor: Colors.black,
            color: Colors.lime[300],
            onPressed: _signInAnonymously,
          ),
        ],
      ),
    );
  }
}
