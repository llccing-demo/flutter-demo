import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContractCenterWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ContractCenterWidget();
  }
}

class _ContractCenterWidget extends State<ContractCenterWidget> {
  //定义一个controller
  final TextEditingController _seachController = TextEditingController();
  Widget _inputSearch () {
    return Container(
      margin: const EdgeInsets.only(top: 10,bottom: 20),
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
          const Icon(Icons.search, color: Colors.grey,),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: TextField(
                controller: _seachController,
                decoration: new InputDecoration(
                    contentPadding: EdgeInsets.only(top: 0.0),
                    hintText: 'Search', border: InputBorder.none),
                // onChanged: onSearchTextChanged,
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
  Widget _buttonWap () {
    final List list = [{"text": '流程审批'}, {"text": '我的合同'}, {"text": '我的列表'}, {"text": '我的通知'}];
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: list.map((e) => InkWell(
          onTap: () {
            if (kDebugMode) {
              print('$e');
            }
          },
          child: Column(children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            width: ScreenUtil().setWidth(100),
            height: ScreenUtil().setWidth(100),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/mayun.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
            ),
          ),
          Text(e["text"], style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.black87))
        ],),) ).toList()
    );
  }
  Widget _contractTitle () {
    return Container(
        margin: const EdgeInsets.only(top:20, bottom:20),
        child: Column(children:[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("最新上传", style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(32))),
              Text("2小时前", style: TextStyle(fontSize: ScreenUtil().setSp(28), color: Colors.black54))]
          )
        ]
      )
    );
  }
  Widget _contractList () {
    return Expanded(
      flex: 1,
      child: ListView.builder(
          itemCount: 15,
          // itemExtent: 50.0, //强制高度为50.0
          itemBuilder: (BuildContext context, int index) {
            return _buildRow({"text": "标题la"});
          }
      )
    );
  }
  Widget _buildRow (item) {
    return ListTile(
        leading: const Icon(Icons.assignment),
        dense: false, // 是否使用缩小布局
        visualDensity: VisualDensity(horizontal: -4), // 紧凑程度
        title: Text(item["text"]),
        isThreeLine: false,
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        enabled: true,
        subtitle: Text("2121"),
        trailing: const Icon(
          Icons.more_vert,
          color: Colors.black
        ),
        onTap: () {
          _showModalBottomSheet();
        }
    );
  }
// 弹出底部菜单列表模态对话框
  Future<int?> _showModalBottomSheet() {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(
            minWidth: 750,
            minHeight: 1334
        ),
        child: Container(
            width: 750,
            height: 1334,
            padding: const EdgeInsets.all(16.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('合同列表', style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                _inputSearch(),
                _buttonWap(),
                _contractTitle(),
                _contractList()
              ],)
        )
    );
  }
}

class listType {
  late String _name;
}
