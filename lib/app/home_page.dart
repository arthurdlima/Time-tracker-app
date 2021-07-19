import 'package:flutter/material.dart';
import 'package:timer_tracker/services/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    @required this.auth,
  }) : super(key: key);

  final AuthBase? auth;

  Future<void> _signOut() async {
    try {
      await auth?.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: <Widget>[
          TextButton(
            onPressed: _signOut,
            child: const Text(
              'Logout',
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
