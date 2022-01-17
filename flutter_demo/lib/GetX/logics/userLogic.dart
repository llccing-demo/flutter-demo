import 'package:get/get.dart';
import 'package:flutter_demo/http/models/user.dart';
class UserLogic extends GetxController {
  //init value of defined variableds
  final userInfo = LoginRes('',0,'').obs;
  seCurrenUser(userInfoPara) => {
    userInfo.value = userInfoPara,
  };

  LoginRes etCurrentUser() => userInfo.value;
}
