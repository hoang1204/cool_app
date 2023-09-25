class AuthSignUp {
  String? member_Name;
  String? email;
  String? password;

  AuthSignUp({this.member_Name, this.email, this.password});

  AuthSignUp.fromJson(Map<String, dynamic> json) {
    member_Name = json['member_name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['member_name'] = this.member_Name;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
