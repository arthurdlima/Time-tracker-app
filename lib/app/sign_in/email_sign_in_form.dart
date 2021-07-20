import 'package:flutter/material.dart';
import 'package:timer_tracker/common_widgets/form_submit_button.dart';

class EmailSignInForm extends StatelessWidget {
  const EmailSignInForm({Key? key}) : super(key: key);

  List<Widget> _buildChildren() {
    return [
      const TextField(
        decoration: const InputDecoration(
          labelText: 'Email',
          hintText: 'test@gmail.com',
        ),
      ),
      const SizedBox(height: 8.0),
      TextField(
        decoration: const InputDecoration(
          labelText: 'Password',
        ),
        obscureText: true,
      ),
      const SizedBox(height: 8.0),
      FormSubmitButton(
        text: 'Sign in',
        onPressed: () {},
      ),
      const SizedBox(height: 8.0),
      TextButton(
        onPressed: () {},
        child: const Text('Need an account? Register'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildChildren(),
      ),
    );
  }
}
