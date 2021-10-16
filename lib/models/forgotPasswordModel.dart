
// @dart=2.9
class ForgotPasswordResponse {
    
  final String msg;
  final String code;
  final bool error;

  ForgotPasswordResponse({this.msg, this.code, this.error});

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponse(
      msg: json["msg"] != null ? json["msg"] : "",
      code: json["code"] != null ? json["code"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}