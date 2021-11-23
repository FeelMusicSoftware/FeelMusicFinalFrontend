class User {
  int? _idUser;
  int? _idPerson;
  String? _name;
  String? _firstSurname;
  String? _secondSurname;
  String? _phone;
  String? _username;
  String? _email;
  String? _password;

  User();

  // User(
  //     this._idUser,
  //     this._idPerson,
  //     this._name,
  //     this._firstSurname,
  //     this._secondSurname,
  //     this._phone,
  //     this._username,
  //     this._email,
  //     this._password
  //     );

  String? get email => _email;

  set email(String? value) {
    _email = value;
  }

  String? get phone => _phone;

  set phone(String? value) {
    _phone = value;
  }

  String? get secondSurname => _secondSurname;

  set secondSurname(String? value) {
    _secondSurname = value;
  }

  String? get firstSurname => _firstSurname;

  set firstSurname(String? value) {
    _firstSurname = value;
  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }

  int? get idPerson => _idPerson;

  set idPerson(int? value) {
    _idPerson = value;
  }

  int? get idUser => _idUser;

  set idUser(int? value) {
    _idUser = value;
  }


  String? get username => _username;

  set username(String? value) {
    _username = value;
  }
  String? get password => _password;

  set password(String? value) {
    _password = value;
  }

  Map<String, dynamic> toJson()=>{
    'idUser': idUser,
    'idPerson': idPerson,
    'name': name,
    'firstSurname': firstSurname,
    'secondSurname': secondSurname,
    'phone': phone,
    'username':username,
    'email':email,
    'password': password
  };

  User.fromJson(Map<String, dynamic> json){
    idUser = json['idUser'];
    idPerson = json['idPerson'];
    name = json['name'];
    firstSurname = json['firstSurname'];
    secondSurname = json['secondSurname'];
    phone = json['phone'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }
  // factory User.fromJson(Map<String, dynamic> parsedJson) {
  //   return new User(
  //       name: parsedJson['name'] ?? "",
  //       age: parsedJson['age'] ?? "");
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     "name": this.name,
  //     "age": this.age
  //   };
  // }
}