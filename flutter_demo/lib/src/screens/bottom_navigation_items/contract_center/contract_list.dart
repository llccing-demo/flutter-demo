import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContractListWidget extends StatefulWidget {
  const ContractListWidget({Key? key, required this.contractList}) : super(key: key);
  final List contractList;
  @override
  State<StatefulWidget> createState() => _ContractListWidget();
  
}
class _ContractListWidget extends State<ContractListWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.contractList.length > 0 ? Expanded(
        flex: 1,
        child:  ListView.builder(
            itemCount: widget.contractList.length,
            // itemExtent: 50.0, //强制高度为50.0
            itemBuilder: (BuildContext context, int index) {
              return _buildRow({"text": "标题11la"});
            })
    ) : Container(margin:EdgeInsets.only(top: ScreenUtil().setHeight(200)), width: ScreenUtil().setWidth(750), child: const Text("暂无合同", textAlign: TextAlign.center,));
    throw UnimplementedError();
  }
  Widget _buildRow(item) {
    return ListTile(
        leading: const Icon(Icons.assignment),
        dense: false, // 是否使用缩小布局
        visualDensity: VisualDensity(horizontal: -4), // 紧凑程度
        title: Text(item["text"]),
        isThreeLine: false,
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        enabled: true,
        subtitle: Text("2121"),
        trailing: const Icon(Icons.more_vert, color: Colors.black),
        onTap: () {
          _showModalBottomSheet();
        });
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
}
