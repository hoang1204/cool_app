import 'dart:convert';

AuthModel AuthModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

List<AuthModel> AuthModelsFromJson(String str) => List<AuthModel>.from(
      json.decode(str).map(
            (x) => AuthModel.fromJson(x),
          ),
    );

class AuthModel {
  int? member_id;
  String? member_name;
  String? email;
  String? password;
  String? phone;
  String? address;
  String? status;

  AuthModel(
      {this.member_id,
      this.member_name,
      this.email,
      this.password,
      this.phone,
      this.address,
      this.status});

  AuthModel.fromJson(Map<String, dynamic> json) {
    member_id = json['data']['member_id'];
    member_name = json['data']['member_name'];
    email = json['data']['email'];
    password = json['data']['password'];
    phone = json['data']['phone'];
    address = json['data']['address'];
    status = json['data']['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['member_id'] = this.member_id;
    data['member_name'] = this.member_name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['status'] = this.status;
    return data;
  }
}
