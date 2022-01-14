import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_demo/http/API.dart';
import 'package:flutter_demo/src/screens/login/components/top_section.dart';

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
        onPressed: () async {
          Navigator.pushReplacementNamed(context, '/home');

          if (_checkLogin(_usernameController.text, _passwordController.text)) {
            var userInfo = {
              'username': _usernameController.text,
              'password': _passwordController.text
            };
            var res = await API.login(userInfo);
            print(res.username);
            // if (res.status&&res.status == 200) {
            //   Navigator.pushReplacementNamed(context, '/home');
            // } else {}
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: Text("警告"),
                      content: Text("请先输入账号,密码!"),
                      actions: [],
                    ));
            print('fail');
          }
        },
      );
  bool _checkLogin(username, password) {
    if (username != '' && password != '') {
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
    return Container(
        height: ScreenUtil().setHeight(1334),
        width: ScreenUtil().setWidth(750),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            // _buildLoginTopWrapper(),//
            TopSection(),
            // _buildLoginInputAndBottomWrapper(),
          ],
        ));
  }

  // 输入框容器+底部的容器
  Widget _buildLoginInputAndBottomWrapper() {
    return Container(
        constraints: BoxConstraints.loose(const Size(600, 400)),
        height: ScreenUtil().setHeight(799),
        width: ScreenUtil().setWidth(750),
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
                padding: EdgeInsets.only(top: 100, left: 60, right: 60),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                color: Colors.black26,
                                width: 1,
                                style: BorderStyle.solid))),
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
}
