import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final Function(String username, String password) credentialsCallback;
  const LoginView({super.key, required this.credentialsCallback});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Center(
      child: SizedBox(
        width: screenSize.width / 2,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          LogInForm(
            credentialsCallback: credentialsCallback,
          )
        ]),
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
                    widget.credentialsCallback(
                        usernameController.text, passwordController.text);
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
