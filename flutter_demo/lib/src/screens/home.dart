import 'package:flutter/material.dart';
import 'bottom_navigation_items/bottom_navigation_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const MainWidget(),
    MessageWidget(),
    ContractCenterWidget(),
    MyWidget(),
  ];
  final List<String> _titleText = ["首页", "消息", "合同中心", '我的'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText[_currentIndex]),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.green,
          backgroundColor: Colors.grey[300],
          unselectedItemColor: Colors.grey[500],
          showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '首页',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_sharp),
              label: '消息',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business_center),
              label: '合同中心',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '我的',
            ),
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
