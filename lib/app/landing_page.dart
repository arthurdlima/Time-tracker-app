import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_tracker/app/home_page.dart';
import 'package:timer_tracker/app/sign_in/sign_in_page.dart';
import 'package:timer_tracker/services/auth.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            if (user == null) {
              return SignInPage.create(context);
            }
            return HomePage();
          }
          return const Scaffold(
            body: const Center(
              child: const CircularProgressIndicator(),
            ),
          );
        });
  }
}
