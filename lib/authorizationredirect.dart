import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garrets_flutter_app/home.dart';

import 'main.dart';
import 'loginorregister.dart';

class AuthorizationRedirect extends StatelessWidget {
  const AuthorizationRedirect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return const UserHomePage();
          }
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}