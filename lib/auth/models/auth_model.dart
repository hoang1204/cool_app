import 'dart:convert';

AuthModel AuthModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

List<AuthModel> AuthModelsFromJson(String str) => List<AuthModel>.from(
      json.decode(str).map(
            (x) => AuthModel.fromJson(x),
          ),
    );

class AuthModel {
  int? memberId;
  String? memberName;
  String? email;
  String? password;
  String? phone;
  String? address;
  String? status;

  AuthModel(
      {this.memberId,
      this.memberName,
      this.email,
      this.password,
      this.phone,
      this.address,
      this.status});

  AuthModel.fromJson(Map<String, dynamic> json) {
    memberId = json['member_id'];
    memberName = json['member_name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    address = json['address'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['member_id'] = this.memberId;
    data['member_name'] = this.memberName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['status'] = this.status;
    return data;
  }
}
