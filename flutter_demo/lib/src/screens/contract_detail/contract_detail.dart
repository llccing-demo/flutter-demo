import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;
import 'package:flutter_demo/src/screens/contract_detail/dom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ContractDetail extends StatefulWidget {
  const ContractDetail({Key? key}) : super(key: key);

  @override
  _ContractDetailState createState() => _ContractDetailState();
}

class _ContractDetailState extends State<ContractDetail> {
  _buildHtmlList() {
    List<Widget> _columnChildren = [];

    for (var i = 0; i < domArray.length; i++) {
      var textHtml = domArray[i];
      _columnChildren.add(Column(
        children: [
          Html(data: textHtml),
          const SizedBox(height: 10),
          Row(
            children: const [Text('标记时间'), Text('标记人'), Text('标记')],
          ),
        ],
      ));
    }

    return Column(children: _columnChildren);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('合同详情'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const Text('我是合同标题'),
          _buildHtmlList(),
        ],
      )),
    );
  }
}
