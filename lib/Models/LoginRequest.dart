// ignore: file_names
class LoginRequest{
  int? _idUser;
  int? _idPerson;
  String? _username;
  String? _email;
  String? _password;
  String? _token;

  String? get email => _email;

  set email(String? value) {
    _email = value;
  } //LoginRequest();\

  String? get password => _password;

  set password(String? value) {
    _password = value;
  }

  String? get token => _token;

  set token(String? value) {
    _token = value;
  }


  int? get idUser => _idUser;

  set idUser(int? value) {
    _idUser = value;
  }



  int? get idPerson => _idPerson;

  set idPerson(int? value) {
    _idPerson = value;
  }

  String? get username => _username;

  set username(String? value) {
    _username = value;
  }
  LoginRequest();
  // LoginRequest(this._email,this._password,this._username,this._idPerson,this._idUser,this._token);
  Map toJson()=>{
    'idUser': idUser,
    'idPerson': idPerson,
    'username':username,
    'email':email,
    'password': password,
    'token':token
  };
  LoginRequest.fromJson(Map<String, dynamic> json) {
    idUser = json['idUser'];
    idPerson = json['idPerson'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    token=json['token'];
  }
}