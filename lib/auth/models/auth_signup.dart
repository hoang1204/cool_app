class AuthSignUp {
  String? member_name;
  String? email;
  String? password;

  AuthSignUp({this.member_name, this.email, this.password});

  AuthSignUp.fromJson(Map<String, dynamic> json) {
    member_name = json['member_name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['member_name'] = this.member_name;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
