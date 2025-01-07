import 'package:flutter/material.dart';
import 'package:my_flutter_app/ui/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String password = '';
  bool changeButton = false;
  bool obscurePassword = true;

  // Reset fields and icon state when returning to this screen
  @override
  void initState() {
    super.initState();
    resetFields();
  }

  void resetFields() {
    name = '';
    password = '';
    obscurePassword = true;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Welcome Image
            Image.asset(
              'assets/images/welcome.png',
              height: 380,
              width: 280,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20.0),

            // Welcome Text
            Text(
              'Welcome $name',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  // Username TextField
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter username",
                      labelText: "User Name",
                    ),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    // Name validation
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username cannot be empty';
                      } else if (value.length < 3) {
                        return 'Name must be at least 3 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15.0),

                  // Password TextField with visibility toggle
                  TextFormField(
                    obscureText: obscurePassword,
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      labelText: "Password",
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
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    // Password validation
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30.0),

                  // Animated Login Button
                  InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          changeButton = true;
                        });

                        await Future.delayed(const Duration(seconds: 1));
                        Navigator.pushNamed(context, MyRoutes.homeRoute)
                            .then((_) {
                          resetFields();
                          setState(() {});
                        });

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
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
