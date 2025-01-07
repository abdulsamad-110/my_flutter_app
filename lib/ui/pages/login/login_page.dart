import 'package:flutter/material.dart';
import 'package:my_flutter_app/ui/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  bool changeButton = false;
  bool obscurePassword = true;

  // Validation function for username
  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    }
    return null;
  }

  // Validation function for password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: MediaQuery.of(context).padding.top + 30,
          ),
          child: Column(
            children: [
              // Welcome Image
              Image.asset(
                'assets/images/welcome.png',
                height: 280,
                width: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20.0),

              // Welcome Text
              Text(
                'Welcome $username',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),

              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      // Username Field
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Username",
                          hintText: "Enter username",
                        ),
                        validator: validateUsername,
                        onChanged: (value) {
                          setState(() {
                            username = value;
                          });
                        },
                      ),
                      const SizedBox(height: 15.0),

                      // Password Field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.deepPurple,
                            ),
                            onPressed: () {
                              setState(() {
                                obscurePassword = !obscurePassword;
                              });
                            },
                          ),
                        ),
                        obscureText: obscurePassword,
                        validator: validatePassword,
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                      const SizedBox(height: 30.0),

                      // Animated Login Button
                      InkWell(
                        onTap: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            setState(() {
                              changeButton = true;
                            });

                            await Future.delayed(const Duration(seconds: 1));
                            Navigator.pushReplacementNamed(
                                context, MyRoutes.homeRoute);

                            setState(() {
                              changeButton = false;
                            });
                          }
                        },
                        child: AnimatedContainer(
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius:
                                BorderRadius.circular(changeButton ? 25 : 8),
                          ),
                          duration: const Duration(seconds: 1),
                          child: changeButton
                              ? const Icon(Icons.done, color: Colors.white)
                              : const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
