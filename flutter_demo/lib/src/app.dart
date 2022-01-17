import 'package:flutter/material.dart';
import 'package:flutter_demo/src/screens/login/login.dart';
import 'package:flutter_demo/src/screens/randomWords.dart';
import 'package:flutter_demo/src/screens/home.dart';
import 'package:flutter_demo/src/screens/contract_detail/contract_detail.dart';
import 'package:get/get.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void onLogin(Credentials) {
    print('onLogin');
    print(Credentials);
  }

  @override
  Widget build(BuildContext context) {
    //MaterialApp ->GetMaterialApp 
    return GetMaterialApp(
        title: '首页',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(onLogin: onLogin),
          '/home': (context) => HomeScreen(),
          '/random': (context) => RandomWords(),
          '/contract-detail': (context) => ContractDetail(),
        });
  }
}
