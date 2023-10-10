class LoginResponseModel {
  String? accessToken;
  String? refreshToken;

  LoginResponseModel({this.accessToken, this.refreshToken});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access'];
    refreshToken = json['refresh'];
  }
}
