//登录 返回结果
class LoginRes {
  String username;
  int age;
  String badge;
  LoginRes(this.username, this.age, this.badge);

  LoginRes.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        age = json['age'],
        badge = json['badge'];

  // Map<String, dynamic> toJson() =>
  //     {"username": username, "age": age, "badge": badge};
}
