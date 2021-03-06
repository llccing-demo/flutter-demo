import 'dart:convert';

import './http_request.dart';
import 'package:dio/dio.dart';
import 'models/user.dart';

final Dio req = Request.dioBuilder();

class API {
  static const LOGIN_URL = "/login";

  static login(data) async {
    try {
      var respones = await req.post(LOGIN_URL, data: data);
      var deData = jsonDecode(respones.toString());
      var res = null;
      if (deData.toString()!='{}')res= LoginRes.fromJson(deData);
      return res;
    } catch (e) {
      print(e);
    }
  }
}
