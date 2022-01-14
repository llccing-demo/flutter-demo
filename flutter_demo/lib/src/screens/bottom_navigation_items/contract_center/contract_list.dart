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
    return widget.contractList.isNotEmpty ? Expanded(
        flex: 1,
        child:  ListView.builder(
            itemCount: widget.contractList.length,
            // itemExtent: 50.0, //强制高度为50.0
            itemBuilder: (BuildContext context, int index) {
              return _buildRow(widget.contractList[index]);
            })
    ) : Container(margin:EdgeInsets.only(top: ScreenUtil().setHeight(200)), width: ScreenUtil().setWidth(750), child: const Text("暂无合同", textAlign: TextAlign.center,));
    throw UnimplementedError();
  }
  Widget _buildRow(item) {
    return ListTile(
        leading: const Icon(Icons.assignment),
        dense: false, // 是否使用缩小布局
        visualDensity: const VisualDensity(horizontal: -4), // 紧凑程度
        title: Text(item["name"]),
        isThreeLine: false,
        contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        enabled: true,
        subtitle: Text("${item["age"]}"),
        // trailing: Icon(Icons.more_vert, color: Colors.black),
        trailing: IconButton(
          alignment: Alignment.topRight,
          padding:EdgeInsets.only(top: 8.0, left: 0.0, right: 0.0, bottom: 0.0),
          icon: Icon(Icons.more_vert, color: Colors.black),
          onPressed: () {
            _showModalBottomSheet();
          },
        ),
        onTap: () {
          // _showModalBottomSheet();
          Navigator.pushNamed(context, '/contract-detail');
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
