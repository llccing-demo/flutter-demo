import 'package:flutter/material.dart';

class Credentials {
  final String username;
  final String password;

  Credentials(this.username, this.password);
}

class LoginScreen extends StatefulWidget {
  final ValueChanged<Credentials> onLogin;

  const LoginScreen({
    required this.onLogin,
    Key? key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(
              child: Card(
                  child: Container(
        constraints: BoxConstraints.loose(const Size(600, 600)),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('登录', style: Theme.of(context).textTheme.headline4),
            TextField(
              decoration: const InputDecoration(labelText: "用户名"),
              controller: _usernameController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "密码"),
              controller: _passwordController,
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextButton(
                onPressed: () {
                  widget.onLogin(Credentials(_usernameController.value.text,
                      _passwordController.value.text));
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: const Text('登录'),
              ),
            ),
          ],
        ),
      ))));
}
