//@dart=2.9
class User {
  String _username;
  String _token;
  String _lastName01;
  String _name02;
  String _lastName02;
  String _name01;
  String _rpas;
  String _nickname;
  String _photo;
  String _id;
  String _email;


  // User(this._username, this._token, this._lastName01, this._name02, this._lastName02, this._name01, this._rpas, this._nickname, this._photo, this._id, this._email);
  User();

  set username(String username){
    this._username = username;
  }
  set token(String token){
    this._token = token;
  }
  set lastName01(String lastName01){
    this._lastName01 = lastName01;
  }
  set name02(String name02){
    this._name02 = name02;
  }
  set lastName02(String lastName02){
    this._lastName02 = lastName02;
  }
  set name01(String name01){
    this._name01 = name01;
  }
  set rpas(String rpas){
    this._rpas = rpas;
  }  
  set nickname(String nickname){
    this._nickname = nickname;
  }
  set photo(String photo){
    this._photo = photo;
  }
  set id(String id){
    this._id = id;
  }
  set email(String email){
    this._email = email;
  }


  String get username {
    return _username;
  } 
  String get token {
    return _token;
  } 
  String get lastName01 {
    return _lastName01;
  } 
  String get name02 {
    return _name02;
  } 
  String get lastName02 {
    return _lastName02;
  } 
  String get name01 {
    return _name01;
  } 
  String get rpas {
    return _rpas;
  } 
  String get nickname {
    return _nickname;
  } 
  String get photo {
    return _photo;
  } 
  String get id {
    return _id;
  }
  String get email {
    return _email;
  } 







}