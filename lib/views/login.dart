import 'dart:math' show min;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:karasu/services/auth_service.dart';
import 'package:karasu/widgets/shell_scaffold.dart';

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

    return ShellScaffold(
      title: '',
      showAppBranding: true,
      body: Center(
        child: SizedBox(
          width: formWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [LogInForm(credentialsCallback: credentialsCallback)],
          ),
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
  bool _isAutoLoggingIn = false;

  @override
  void initState() {
    super.initState();
    _tryAutoLogin();
  }

  Future<void> _tryAutoLogin() async {
    const storage = FlutterSecureStorage();
    final username = await storage.read(key: usernameKey);
    final password = await storage.read(key: passwordKey);

    if (!mounted) return;

    if (username != null && password != null) {
      setState(() {
        usernameController.text = username;
        passwordController.text = password;
        _isAutoLoggingIn = true;
      });
      // Auto-login with stored credentials
      widget.credentialsCallback(username, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isAutoLoggingIn) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Logging in...'),
          ],
        ),
      );
    }

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(
              helperText: ' ',
              labelText: 'Username',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Username is missing';
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
