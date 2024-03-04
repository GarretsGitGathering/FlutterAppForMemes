import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final Function()? onTap;
  const Login({Key? key, required this.onTap}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Controllers for handling input data
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Method for signing in the user
  void signUserIn() async {
    // Show a loading dialog while signing in
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      // Sign in with provided email and password
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context); // Dismiss the loading dialog
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Dismiss the loading dialog
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        print("GIVEN ERROR: ${e.code}");
      } else {
        print("GIVEN ERROR: ${e.code}");
      }
    }
  }

  // Method for showing incorrect credentials message
  void wrongCredMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Email or Password! Please try again!'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/i-need-you-to-login.jpg', // Path to your image asset
                  width: 200, // Adjust the width as needed
                  height: 200, // Adjust the height as needed
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
                const SizedBox(height: 25),
                // Email text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'account email',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Password text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: 'password',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 30),
                // Sign In button
                ElevatedButton(
                  onPressed: signUserIn,
                  child: const Text("login"),
                ),
                const SizedBox(height: 40),
                // Text for navigating to register page
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('or you can'),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'register here',
                        style: TextStyle(
                          color: Colors.blue[300],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
