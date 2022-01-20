import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'contract_list.dart';

class ContractCenterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContractCenterWidget();
  }
}

class _ContractCenterWidget extends State<ContractCenterWidget> {
  //定义一个controller
  final TextEditingController _seachController = TextEditingController(text: "haha");
  Future<Response> mockNetworkData(Map<String ,dynamic> query) async {
    // return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
    Response response;
    var dio = Dio();
    // response = await dio.get('/test?id=12&name=wendu');
    response = await dio.get('http://192.168.100.71:3000/mock/12/burning/allHeros', queryParameters: query);
    return response;
  }
  @override
  initState() {
    // TODO: implement initState
    super.initState();
    mockNetworkData({}).then((value) => print(value));
    // print();
  }

  Widget _inputSearch() {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: const BoxDecoration(
        //背景
        color: Color.fromRGBO(200, 200, 200, 1),
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(Radius.circular(24)),
        // //设置四周边框
        // border: new Border.all(width: 1, color: Colors.red),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: TextField(
                controller: _seachController,
                decoration: new InputDecoration(
                    contentPadding: EdgeInsets.only(top: 0.0),
                    hintText: 'Search',
                    border: InputBorder.none),
                  onSubmitted: (v) {
                    // mockNetworkData({});
                    setState(() {});
                  }
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.cancel),
            color: Colors.grey,
            iconSize: 18.0,
            onPressed: () {
              _seachController.clear();
              // onSearchTextChanged('');
            },
          ),
        ],
      ),
    );
  }

  Widget _buttonWap() {
    final List list = [
      {"text": '流程审批'},
      {"text": '我的合同'},
      {"text": '我的列表'},
      {"text": '我的通知'}
    ];
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: list
            .map((e) => InkWell(
                  onTap: () {
                    if (kDebugMode) {
                      print('$e');
                    }
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        width: ScreenUtil().setWidth(100),
                        height: ScreenUtil().setWidth(100),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/mayun.png"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                        ),
                      ),
                      Text(e["text"],
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(30),
                              color: Colors.black87))
                    ],
                  ),
                ))
            .toList());
  }

  Widget _contractTitle() {
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("最新上传",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(32))),
                Text("2小时前",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(28),
                        color: Colors.black54))
              ])
        ])
    );
  }

  Widget _contractList () {
    return FutureBuilder(
        future: mockNetworkData({}),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // 请求已结束
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // 请求失败，显示错误
              return Text("Error: ${snapshot.error}");
            } else {
              Response response = snapshot.data;
              // 请求成功，显示数据
              Map data =  jsonDecode(response.data);
              return ContractListWidget(contractList: data['data']);
            }
          } else {
            // 请求未结束，显示loading
            return const CircularProgressIndicator();
          }
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(minWidth: ScreenUtil().setWidth(750), minHeight: ScreenUtil().setHeight(1334)),
        child: Container(
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setHeight(1334),
            padding: const EdgeInsets.all(16.0),
            // color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  '合同列表',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                _inputSearch(),
                _buttonWap(),
                _contractTitle(),
                _contractList(),
                // ContractListWidget(contractList: [])
              ],
            )
        )
    );
  }
}

