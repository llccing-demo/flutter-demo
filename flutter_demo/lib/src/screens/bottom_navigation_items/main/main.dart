import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/src/screens/RandomWords.dart';
import 'package:flutter_demo/src/screens/contract_detail/contract_detail.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        width: 750,
        height: 1334,
        child: Column(
          children: [
            MaterialButton(
              color: Colors.lightBlueAccent[200],
              textColor: Colors.white,
              child: const Text('跳转测试页'),
              minWidth: 500,
              height: 50,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RandomWords()));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: MaterialButton(
                color: Colors.lightBlueAccent[200],
                textColor: Colors.white,
                child: const Text('合同详情页'),
                minWidth: 500,
                height: 50,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContractDetail()));
                },
              ),
            ),
          ],
        ));
  }
}
