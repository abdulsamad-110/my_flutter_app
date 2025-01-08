import 'package:flutter/material.dart';
import 'package:my_flutter_app/ui/utils/routes.dart';
import 'package:my_flutter_app/ui/widgets/custom_textfield.dart';
import 'package:my_flutter_app/ui/widgets/name_passwidget.dart';

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: MediaQuery.of(context).padding.top + 20.0,
          ),
          child: Column(
            children: [
              ///// Welcome Image
              Image.asset(
                'assets/images/welcome.png',
                height: 280,
                width: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20.0),

              ///// Welcome Text
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
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      ///// widget
                      NamePassWidget(),
                      const SizedBox(height: 30.0),

                      ///// Animated Login Button
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
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
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
