class ForgotPassword {
  String user;
  String key;

  ForgotPassword({required this.user,required this.key});

  factory ForgotPassword.fromJson(Map<String, dynamic> json){
    return ForgotPassword(
      user: json["id"],
      key: json["key"]
    );
  }
}