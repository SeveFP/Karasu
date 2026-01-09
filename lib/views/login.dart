import 'dart:math' show min;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:karasu/services/openapi_client.dart';

const usernameKey = "karasu:toshokan-username";
const passwordKey = "karasu:toshokan-password";

class LoginView extends StatelessWidget {
  final Function(String username, String password) credentialsCallback;
  const LoginView({super.key, required this.credentialsCallback});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Use 90% width on small screens, half on large, max 500px
    final formWidth = min(
      500.0,
      screenWidth < 600 ? screenWidth * 0.9 : screenWidth / 2,
    );

    return Center(
      child: SizedBox(
        width: formWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [LogInForm(credentialsCallback: credentialsCallback)],
        ),
      ),
    );
  }
}

class LogInForm extends StatefulWidget {
  final Function(String username, String password) credentialsCallback;
  const LogInForm({super.key, required this.credentialsCallback});

  @override
  LogInFormState createState() {
    return LogInFormState();
  }
}

class LogInFormState extends State<LogInForm> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      const storage = FlutterSecureStorage();
      String? username = await storage.read(key: usernameKey);
      String? password = await storage.read(key: passwordKey);

      setState(() {
        if (username != null && password != null) {
          usernameController.text = username;
          passwordController.text = password;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(
              helperText: ' ',
              labelText: 'Email',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is missing';
              }
              return null;
            },
          ),
          TextFormField(
            obscureText: true,
            controller: passwordController,
            decoration: const InputDecoration(
              helperText: ' ',
              labelText: 'Password',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is missing';
              }
              return null;
            },
          ),
          LayoutBuilder(
            builder: (context, constraints) => Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    const storage = FlutterSecureStorage();
                    storage.write(
                      key: usernameKey,
                      value: usernameController.text,
                    );
                    storage.write(
                      key: passwordKey,
                      value: passwordController.text,
                    );

                    widget.credentialsCallback(
                      usernameController.text,
                      passwordController.text,
                    );
                  }
                },
                child: const Text('Log in'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
