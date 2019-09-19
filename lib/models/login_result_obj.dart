class LoginResultObj {
  int code;
  String msg;
  Data data;

  LoginResultObj({this.code, this.msg, this.data});

  LoginResultObj.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  UserInfo userInfo;
  String token;
  String expire;

  Data({this.userInfo, this.token, this.expire});

  Data.fromJson(Map<String, dynamic> json) {
    userInfo = json['userInfo'] != null
        ? new UserInfo.fromJson(json['userInfo'])
        : null;
    token = json['token'];
    expire = json['expire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userInfo != null) {
      data['userInfo'] = this.userInfo.toJson();
    }
    data['token'] = this.token;
    data['expire'] = this.expire;
    return data;
  }
}

class UserInfo {
  String id;
  String username;
  String mobile;
  String password;
  String createDate;

  UserInfo(
      {this.id, this.username, this.mobile, this.password, this.createDate});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    mobile = json['mobile'];
    password = json['password'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    data['createDate'] = this.createDate;
    return data;
  }
}
