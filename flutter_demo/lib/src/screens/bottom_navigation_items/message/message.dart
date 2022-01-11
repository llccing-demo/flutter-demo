import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

const BASE_URL = "http://localhost:7777";
void getHttp() async {
  try {
    // var response = await Dio().get('http://www.google.com');
    var response = await Dio().get("/test?id=12&name=wendu");
    print(response);
  } catch (e) {
    print(e);
  }
}

loginReq(username,password) async {
  try {
    var dio =  Dio();
    var params = {
      "username":username,
      "password":password
    };
    var url ='/login';
    var respones = await dio.post(BASE_URL+url,queryParameters: params);
    return respones.data;
  } catch (e) {
    print(e);
  }
}

class MessageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: TextButton(
        onPressed: () {
          getHttp();
        },
        child: const Text('ajax请求'),
      ),
    );
  }
}
