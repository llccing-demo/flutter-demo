import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/src/screens/RandomWords.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.red,
      width: 750,
      height: 1334,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RandomWords()));
        },
        child: const Text('跳转11'),
      ),
    );
  }
}
