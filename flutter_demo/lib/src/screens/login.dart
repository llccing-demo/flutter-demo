import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_demo/src/screens/bottom_navigation_items/bottom_navigation_items.dart';
// import './bottom_navigation_items//message/message.dart' show loginReq;
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';

>>>>>>> b49f51d005ae181010d4bbf0f94f1758833990be
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
  Widget _buildLoginButton() => MaterialButton(
        // color: Colors.lightBlue[500],
        color: Colors.lightBlueAccent[200],
        textColor: Colors.white,
        child: Text('登录'),
        minWidth: 500,
        height: 50,
        onPressed: () {
          if (_checkLogin(_usernameController.text, _passwordController.text)) {
             loginReq();
            print('success');
            Navigator.pushReplacementNamed(context, '/home');
          } else {
            print('fail');
          }
        },
      );
  bool _checkLogin(username, password) {
    if (username == "lbt" && password == "123") {
      return true;
    } else {
      return false;
    }
  }

  Widget _buildUserNameInput() {
    return TextField(
      decoration: const InputDecoration(hintText: "请输入登录账号"),
      obscureText: false,
      controller: _usernameController,
      keyboardType: TextInputType.text,
    );
  }

  Widget _buildPasswordInput() {
    return TextField(
      decoration: const InputDecoration(hintText: "请输入密码"),
      controller: _passwordController,
      obscureText: true,
    );
  }

  @override
  Widget build(BuildContext context) => _buildLoginWrapper();
  Widget _buildLoginWrapper() {
    //设置尺寸（填写设计中设备的屏幕尺寸）如果设计基于750dp * 1334dp的屏幕
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(750, 1334),
        minTextAdapt: true,
        orientation: Orientation.portrait);
    // return Scaffold(body: Center(child: _buildLoginInputWrapper()));
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildLoginTopWrapper(),
        _buildLoginInputAndBottomWrapper(),
      ],
    );
  }

  // 输入框容器+底部的容器
  Widget _buildLoginInputAndBottomWrapper() {
    return Container(
        constraints: BoxConstraints.loose(const Size(600, 400)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildLoginInputWrapper(),
              _buildLoginBottomWrapper(),
            ]));
  }

  //登录 输入框 容器
  Widget _buildLoginInputWrapper() {
    return Card(
        child: Container(
      constraints: BoxConstraints.loose(const Size(600, 200)),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildUserNameInput(),
          _buildPasswordInput(),
          Padding(padding: const EdgeInsets.all(8), child: _buildLoginButton()),
        ],
      ),
    ));
  }

  //底部容器
  Widget _buildLoginBottomWrapper() {
    return Container(
      constraints: BoxConstraints.loose(const Size(600, 200)),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 100,left: 60,right: 60),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.black26,width: 1,style: BorderStyle.solid))
                  ),
                  padding: EdgeInsets.only(top: 0),
                    // constraints: BoxConstraints.loose(const Size(600, 10)),
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("AstraZeneca",
                        style: TextStyle(
                            color: Colors.purple,
                            decoration: TextDecoration.none,
                            fontSize: 16)),
                    Icon(
                      Icons.remove_done,
                      color: Colors.orange,
                      size: 28,
                    )
                  ],
                ))),
            Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Container(
                  constraints: BoxConstraints.loose(const Size(600, 100)),
                  child: Text('POWERD BY ID 阿斯利康中国',
                      style: TextStyle(
                          color: Colors.black54,
                          decoration: TextDecoration.none,
                          fontSize: 10))),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLoginTopWrapper() {
    return Container(
      constraints: BoxConstraints.loose(const Size(600, 200)),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('loginTopBg.webp'), fit: BoxFit.cover)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("AstraZeneca",
                style: TextStyle(
                    color: Colors.white, decoration: TextDecoration.none)),
            Icon(
              Icons.remove_done,
              color: Colors.orange,
              size: 48,
            )
          ],
        ),
      ),
    );
  }
}
