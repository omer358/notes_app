class SignUpRequest {
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? password;
  String? confirmPassword;

  SignUpRequest(
      {this.firstName,
      this.lastName,
      this.username,
      this.email,
      this.password,
      this.confirmPassword});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
