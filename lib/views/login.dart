import 'dart:math' show min;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:karasu/l10n/app_localizations.dart';
import 'package:karasu/services/auth_service.dart';
import 'package:karasu/widgets/shell_scaffold.dart';

class LoginView extends StatelessWidget {
  final Function(String username, String password) credentialsCallback;
  final bool loginFailed;

  const LoginView({
    super.key,
    required this.credentialsCallback,
    this.loginFailed = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Use 90% width on small screens, half on large, max 500px
    final formWidth = min(
      500.0,
      screenWidth < 600 ? screenWidth * 0.9 : screenWidth / 2,
    );

    return ShellScaffold(
      title: AppLocalizations.of(context)!.loginTitle,
      showAppBranding: true,
      body: Center(
        child: SizedBox(
          width: formWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogInForm(
                credentialsCallback: credentialsCallback,
                loginFailed: loginFailed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LogInForm extends StatefulWidget {
  final Function(String username, String password) credentialsCallback;
  final bool loginFailed;

  const LogInForm({
    super.key,
    required this.credentialsCallback,
    this.loginFailed = false,
  });

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

  @override
  void didUpdateWidget(LogInForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If login failed, stop showing the spinner
    if (widget.loginFailed && _isAutoLoggingIn) {
      setState(() {
        _isAutoLoggingIn = false;
      });
    }
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
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(AppLocalizations.of(context)!.loggingIn),
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
            decoration: InputDecoration(
              helperText: ' ',
              labelText: AppLocalizations.of(context)!.usernameLabel,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.usernameMissing;
              }
              return null;
            },
          ),
          TextFormField(
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
              helperText: ' ',
              labelText: AppLocalizations.of(context)!.passwordLabel,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.passwordMissing;
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
                child: Text(AppLocalizations.of(context)!.loginButton),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
