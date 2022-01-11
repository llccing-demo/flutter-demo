import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;
import 'package:flutter_demo/src/screens/contract_detail/dom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

String htmlData = domStr;

dom.Document document = htmlparser.parse(htmlData);

class ContractDetail extends StatefulWidget {
  const ContractDetail({Key? key}) : super(key: key);

  @override
  _ContractDetailState createState() => _ContractDetailState();
}

class _ContractDetailState extends State<ContractDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('合同详情'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Html(data: htmlData),
      ),
    );
  }
}
