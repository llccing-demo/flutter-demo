import 'package:flutter/material.dart';
import 'package:flutter_demo/src/screens/login.dart';
import 'package:flutter_demo/src/screens/randomWords.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void onLogin(Credentials) {
    print('onLogin');
    print(Credentials);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '名字生成器',
        // 该设置未生效
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(onLogin: onLogin),
          '/random': (context) => RandomWords(),
        });
  }
}
