import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bugly/flutter_bugly.dart';

void main() => FlutterBugly.postCatchedException(() => runApp(const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _platformVersion = 'Unknown';
  // GlobalKey<UpdateDialogState>

  @override
  void initState() {
    super.initState();
    FlutterBugly.init(
      androidAppId: 'adeeed5ec1',
      iOSAppId: '0941ecf9a6',
      customUpgrade: true,
    ).then((_result) {
      setState(() {
        _platformVersion = _result.message;
        print(_result.appId);
      });
    });

    FlutterBugly.onCheckUpgrade.listen((_upgradeInfo) {
      print('展示升级弹窗');
    });

    FlutterBugly.setUserId('6666666');
    FlutterBugly.putUserData(key: 'key', value: 'value');
    int tag = 9527;
    FlutterBugly.setUserTag(tag);
  }

  @override
  void dispose() {
    FlutterBugly.dispose();
    super.dispose();
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter+=2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onTap: () {
          print('1312');

          FlutterBugly.setUserId('7777');
          FlutterBugly.putUserData(key: 'key1', value: 'value1');
          int tag = 9528;
          FlutterBugly.setUserTag(tag);
          // if (Platform.isAndroid) {
            _checkUpgrade();
          // }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text('init result: $_platformVersion\n'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _checkUpgrade() {
    print('获取更新中');
    FlutterBugly.checkUpgrade();
  }
}
