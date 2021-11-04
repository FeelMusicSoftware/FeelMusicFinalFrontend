
import 'dart:convert';

import 'package:feel_music_final/Models/LoginRequest.dart';
import 'package:feel_music_final/Models/User.dart';
import 'package:feel_music_final/Models/UserMail.dart';
import 'package:feel_music_final/Repositories/url.dart';
import 'package:http/http.dart' as http;
import 'package:feel_music_final/Repositories/url.dart' as api;

import 'Token.dart';
class UserRepository {

  Future<bool> signIn(UserMail userMail )async {
    try{
      var url= directionUrl + "user/signin";
      print("entro a repo de sigin");
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(userMail.toJson())
      );
      if(response.statusCode==200){
        var tok=json.decode(response.body)["token"];
        print("DoneConfirmUser SIIIIIIIIII");
        await Token().setToken(tok);
        return true;
      }
      else{
        print(response.body);
        return false;
      }
    }
    catch(e){
      print(" blallalsl");
      return false;
    }
  }
  Future<bool>createAccount(User user) async{
    try {
      String url = directionUrl + "user";
      // User user1 = User();
      print("llego al repositorio del addUser");

      var res = await http.post(Uri.parse(url), //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(user.toJson()));
      var user2 = jsonDecode(res.body);
      print(user2);
      // user1 = User.fromJson(user2);
      if (res.statusCode == 200) {
        print("DoneCreateUser");
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
      return false;
    }
  }
  // Future<User> obtainUserProfile(int userId) async {
  //   try {
  //
  //     String url = directionUrl + "user/" + userId.toString();
  //     User user = User();
  //     var res = await http.get(url, //ip for virtualized devices
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8',
  //         });
  //     var user2 = jsonDecode(res.body);
  //     user = User.fromJson(user2);
  //     if (res.statusCode == 200) {
  //       // print("obtencion de datos del usuario");
  //       return user;
  //     } else {
  //       return null;
  //     }
  //   } catch (error) {
  //     print(error);
  //     return null;
  //   }
  // }

  // Future<User> confirmUser(ConfirmUser confirmUser) async {
  //   try {
  //     String url = directionUrl + "user/login";
  //     User user = User();
  //     var res = await http.post(url, //ip for virtualized devices
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8',
  //         },
  //         body: jsonEncode(confirmUser.toJsonUp()));
  //     var user2 = jsonDecode(res.body);
  //     user = User.fromJson(user2);
  //     if (res.statusCode == 200) {
  //       // print("DoneConfirmUser");
  //       return user;
  //     } else {
  //       return null;
  //     }
  //   } catch (error) {
  //     print(error);
  //     return null;
  //   }
  // }

  // Future<User> addUser(User user) async {
  //   try {
  //     String url = directionUrl + "user";
  //     User user1 = User();
  //     print("llego al repositorio del addUser");
  //     var res = await http.post(url, //ip for virtualized devices
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8',
  //         },
  //         body: jsonEncode(user.toJson()));
  //     var user2 = jsonDecode(res.body);
  //     user1 = User.fromJson(user2);
  //     if (res.statusCode == 200) {
  //       print("DoneCreateUser");
  //       return user1;
  //     } else {
  //       return null;
  //     }
  //   } catch (error) {
  //     print(error);
  //     return null;
  //   }
  // }


  Future<bool> signup(User user,LoginRequest loginRequest)async {
     try{
       var url= directionUrl + "user/signup";
       final response = await http.post(Uri.parse(url),
           headers: <String, String>{
             'Content-Type': 'application/json; charset=UTF-8',
           },
           body: jsonEncode(loginRequest.toJson())
       );
       if(response.statusCode==200){
         var urlSignup=directionUrl + "person";
         var body=json.decode(response.body);
         final res = await http.post(Uri.parse(urlSignup),
             headers: <String, String>{
               'Content-Type': 'application/json; charset=UTF-8',
               'Authorization':body["token"],
             },
             body: jsonEncode(user.toJson())
         );
         if(res.statusCode==200){
           return true;
         }
         else{
           return false;
         }
       }
       else{
         return false;
       }
     }
     catch(e){
       print(e);
       return false;
     }
   }

  Future<User?> databyUserId()async {
    try{
      User user=User();
      var url= directionUrl + "user/profile";
      var token=await Token().getToken();
      final response = await http.get(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': token??''
          }
      );
      var element = jsonDecode(response.body);
      user.idUser=element['idUser'];
      user.idPerson=element['idPerson'];
      user.name=element['name'];
      user.firstSurname=element['firstSurname'];
      user.secondSurname=element['secondSurname'];
      user.phone=element['phone'];
      user.username=element['username'];
      user.email=element['email'];
      user.password=element['password'];
      print(user.idUser);
      if(response.statusCode==200){
        return user;
      }
      else{
        return null;
      }
    }
    catch(e){
      print(e);
      return null;

    }
  }

  Future<bool?> updateUser(User user)async {
    try{
      var url= directionUrl + "user";
      var token=await Token().getToken();
      final response = await http.put(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            //'Authorization': token??''
          },
          body: jsonEncode(user.toJson())
      );
      print(response.statusCode);
      if(response.statusCode==200){
        print("Done Update");
        //var resPub = jsonDecode(response.body);
        //var idUser=resPub["idUser"];
      }
      else{
        return false;
      }
    }
    catch(e){
      print(e);
    }
  }
}
