import 'package:flutter/material.dart';
import 'package:my_flutter_app/ui/widgets/custom_textfield.dart';

class NamePassWidget extends StatefulWidget {
  const NamePassWidget({super.key});

  @override
  _NamePassWidgetState createState() => _NamePassWidgetState();
}

class _NamePassWidgetState extends State<NamePassWidget> {
  String username = '';
  String password = '';
  bool obscurePassword = true;

  final usernameFocus = FocusNode();
  final passFocus = FocusNode();

  ///// Validation function for username
  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    }
    return null;
  }

  ///// Validation function for password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 5) {
      return 'Password must be at least 5 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///// Username CustomTextField
        CustomTextField(
          labelText: "Username",
          hintText: "Enter username",
          onChanged: (value) {
            setState(() {
              username = value;
            });
          },
          focusNode: usernameFocus,
          prefixIcon: const Icon(color: Colors.deepPurple, Icons.person),
          validator: validateUsername,
          onSubmit: () {
            FocusScope.of(context).requestFocus(passFocus);
          },
        ),

        const SizedBox(height: 15.0),

        ///// Password CustomTextField
        CustomTextField(
          labelText: "Password",
          hintText: "Enter password",
          obscureText: obscurePassword,
          prefixIcon: const Icon(color: Colors.deepPurple, Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(
              obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.deepPurple,
            ),
            onPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
          ),
          focusNode: passFocus,
          validator: validatePassword,
          onChanged: (value) {
            setState(() {
              password = value;
            });
          },
          onSubmit: () {
            print('Password submitted');
          },
        ),
      ],
    );
  }
}
