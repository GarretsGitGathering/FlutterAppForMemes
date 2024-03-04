import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  final Function()? onTap;
  const Signup({Key? key, required this.onTap}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // Controllers for handling input data
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  // Method for signing up the user
  void signUserUp() async {
    var auth = FirebaseAuth.instance;

    // Show a loading dialog while signing up
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Check if passwords match
    if (passwordController.text != confirmController.text) {
      Navigator.pop(context); // Dismiss the loading dialog
      showErrorMessage("Passwords do not match!");
      return;
    }

    try {
      // Create user with provided email and password
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context); // Dismiss the loading dialog
      var userUid = auth.currentUser?.uid;
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Dismiss the loading dialog
      if (e.code == 'weak-password') {
        showErrorMessage("password is too weak dude");
      } else {
        print("GIVEN ERROR: ${e.code}");
      }
    }
  }

  // Method for showing error message
  void showErrorMessage(String text) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
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
                  'assets/marcello-hitting-the-griddy.gif', // Path to your image asset
                  width: 200, // Adjust the width as needed
                  height: 200, // Adjust the height as needed
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
                const Text(
                  'Sign up here.',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),

                const SizedBox(height: 25),

                // Email text field
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'email',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Password text field
                Center(
                  child: Padding(
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
                ),
                const SizedBox(height: 10),
                // Confirm Password text field
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: confirmController,
                      decoration: const InputDecoration(
                        hintText: 'password x 2',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Sign Up button
                ElevatedButton(
                  onPressed: signUserUp,
                  child: const Text("register"),
                ),

                const SizedBox(height: 40),

                // Text for navigating to login page
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('go back to the'),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'login here',
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
