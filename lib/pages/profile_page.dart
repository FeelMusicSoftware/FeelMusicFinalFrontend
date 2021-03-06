// ignore: file_names
import 'package:feel_music_final/Colors.dart';
import 'package:feel_music_final/Models/User.dart';
import 'package:feel_music_final/Models/UserMail.dart';
import 'package:feel_music_final/Pages/BottomNavBar.dart';
import 'package:feel_music_final/Repositories/Token.dart';
import 'package:feel_music_final/Repositories/user_repository.dart';
import 'package:feel_music_final/pages/loading_page.dart';
import 'package:feel_music_final/pages/login_page.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  //User? user;
  //ProfilePage(this.user);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  User user=User();
  TextEditingController name = TextEditingController();
  TextEditingController firstSurname = TextEditingController();
  TextEditingController secondSurname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  UserRepository userRepository = UserRepository();
  Size? size;
  MostrarDatosUsuario()async{
    setState(() {
      name.text= user.name.toString();
      firstSurname.text=user.firstSurname.toString();
      secondSurname.text=user.secondSurname.toString();
      phone.text=user.phone.toString();
      username.text=user.username.toString();
      email.text=user.email.toString();
      password.text=user.password.toString();
    });
  }

  //SharedPreferences userProfile;
  _initSharedPreferences() async{
    //userProfile = await SharedPreferences.getInstance();
    user = (await userRepository.databyUserId())!;
    MostrarDatosUsuario();
  }

  @override
  void initState(){

    super.initState();
    _initSharedPreferences();
    // print("Sidebar");

  }
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: size!.height * 0.08,
      //   backgroundColor: color3,
      //   elevation: 5,
      //   title: Text(
      //     "FeelMusic",
      //     style: TextStyle(fontSize: size!.height * 0.036,color: color1),
      //   ),
      //   centerTitle: true,
      // ),
      body: user.name!=null?SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size!.height*0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: color4.withOpacity(1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: size!.height*0.07),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          //height: 150,
                          //width: 150,
                          height: size!.height*0.18,
                          width: size!.height*0.18,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/user.png")
                              //image: user.email==null || user.imagePath=="vacio"?(AssetImage("assets/user.png")):(NetworkImage(api.url+"image/"+seller.imagePath))
                            ),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                          height: 6,
                        ),
                        Container(
                          height: size!.height*0.04,
                          child: Center(
                            child: Text(
                              "${user.username}",
                              //"alejo",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: color1,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: ()async{
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context){
                                      return AlertDialog(
                                        title: Center(
                                          child: Text("Actualizar Perfil"),
                                        ),
                                        content: SingleChildScrollView(
                                          child: Container(
                                            width: 300,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 9.0),
                                                Container(
                                                  width: 290,
                                                  height: 48,
                                                  child: TextField(
                                                    controller: name,
                                                    cursorColor: color3,
                                                    decoration: InputDecoration(
                                                      hintText: "Nombre",
                                                      labelText: "Nombre",
                                                      labelStyle: TextStyle(color: color3, fontSize: 16),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(7)),
                                                          borderSide: BorderSide(
                                                              color: color3,
                                                              width: 2
                                                          )
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(7)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 9.0),
                                                Container(
                                                  width: 290,
                                                  height: 48,
                                                  child: TextField(
                                                    controller: firstSurname,
                                                    cursorColor: color3,
                                                    decoration: InputDecoration(
                                                      hintText: "Primer Apellido",
                                                      labelText: "Primer Apellido",
                                                      labelStyle: TextStyle(color: color3, fontSize: 16),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(7)),
                                                          borderSide: BorderSide(
                                                              color: color3,
                                                              width: 2
                                                          )
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(7)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 9.0),
                                                Container(
                                                  width: 290,
                                                  height: 48,
                                                  child: TextField(
                                                    controller: secondSurname,
                                                    cursorColor: color3,
                                                    decoration: InputDecoration(
                                                      hintText: "Segundo Apellido",
                                                      labelText: "Segundo Apellido",
                                                      labelStyle: TextStyle(color: color3, fontSize: 16),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(7)),
                                                          borderSide: BorderSide(
                                                              color: color3,
                                                              width: 2
                                                          )
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(7)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 5.0),
                                                Container(
                                                  width: 290,
                                                  height: 48,
                                                  child: TextField(
                                                    controller: phone,
                                                    cursorColor: color3,
                                                    decoration: InputDecoration(
                                                      hintText: "Nro. Celular",
                                                      labelText: "Nro. Celular",
                                                      labelStyle: TextStyle(color: color3, fontSize: 16),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(7)),
                                                          borderSide: BorderSide(
                                                              color: color3,
                                                              width: 2
                                                          )
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(7)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 8.0),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text("Datos de Cuenta",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                                                  ],
                                                ),
                                                SizedBox(height: 9.0),
                                                Container(
                                                  width: 290,
                                                  height: 48,
                                                  child: TextField(
                                                    controller: username,
                                                    cursorColor: color3,
                                                    decoration: InputDecoration(
                                                      hintText: "Nombre de Usuario",
                                                      labelText: "Nombre de Usuario",
                                                      labelStyle: TextStyle(color: color3, fontSize: 16),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(7)),
                                                          borderSide: BorderSide(
                                                              color: color3,
                                                              width: 2
                                                          )
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(7)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 5.0),
                                                Container(
                                                  width: 290,
                                                  height: 48,
                                                  child: TextField(
                                                    controller: email,
                                                    cursorColor: color3,
                                                    keyboardType: TextInputType.emailAddress,
                                                    decoration: InputDecoration(
                                                      hintText: "Email",
                                                      labelText: "Email",
                                                      labelStyle: TextStyle(color: color3, fontSize: 16),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(7)),
                                                          borderSide: BorderSide(
                                                              color: color3,
                                                              width: 2
                                                          )
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(7)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                /*
                                                    SizedBox(height: 9.0),
                                                    Container(
                                                      width: 290,
                                                      height: 48,
                                                      child: TextField(
                                                        //obscureText: _obscureText,
                                                        keyboardType: TextInputType.text,
                                                        cursorColor: color3,
                                                        decoration: InputDecoration(
                                                          hintText: "Password",
                                                          labelText: "Password",
                                                          labelStyle: TextStyle(color: color3, fontSize: 16),
                                                          enabledBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.all(Radius.circular(7)),
                                                              borderSide: BorderSide(
                                                                  color: color3,
                                                                  width: 2
                                                              )
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.all(Radius.circular(7)),
                                                          ),
                                                        ),
                                                        //controller: password,
                                                      ),
                                                    ),
                                                    */
                                              ],
                                            ),
                                          ),
                                        ),
                                        actions: [
                                          FlatButton(
                                            child: Text("Aceptar", style: TextStyle(color: color3, fontSize: 18),),
                                            onPressed: (){
                                              bool check = Submit();
                                              if(check){
                                                userRepository.updateUser(user);
                                                //Navigator.of(context).pop();
                                                //Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavbar()));
                                                Navigator.of(context).pushNamedAndRemoveUntil('/screen2', (Route<dynamic> route) => false);
                                                print("Se Guardo los datos ");
                                              }else{
                                                print("No Se Guardo los datos ");
                                              }
                                            },
                                          ),
                                          FlatButton(
                                            child: Text("Cancelar", style: TextStyle(color: Colors.red, fontSize: 18),),
                                            onPressed: (){
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                              child: Container(
                                height: size!.width*0.13,
                                width: size!.width*0.25,
                                child: Column(
                                  children: [
                                    Icon(Icons.edit,color: color1,size: size!.width*0.08,),
                                    Text("Editar Perfil",style: TextStyle(color: color1,fontSize: size!.width*0.035),),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            GestureDetector(
                               onTap: ()async{
                                 await Token().delToken();
                                 Navigator.of(context).pushNamedAndRemoveUntil('/screen1', (Route<dynamic> route) => false);
                               },
                               child: Container(
                                 height: size!.width*0.13,
                                   width: size!.width*0.25,
                                   child: Column(
                                     children: [
                                       Icon(Icons.exit_to_app,color: color12,size: size!.width*0.08,),
                                       Text("Salir",style: TextStyle(color: color1,fontSize: size!.width*0.035),),
                                     ],
                                   ),
                                 ),
                            ),
                            /*
                            IconButton(
                                onPressed: ()async{
                                  await Token().delToken();
                                  Navigator.of(context).pushNamedAndRemoveUntil('/screen1', (Route<dynamic> route) => false);
                                },
                                icon: Icon(Icons.exit_to_app,color: color12,size: size!.width*0.09,)
                            )
                            */
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    width: 2,
                    height: 25,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 55,
                      ),
                      Text("Nombre:",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only( left: size!.width*0.1, right: size!.width*0.1),
                    child: Container(
                      height: size!.height*0.04,
                      child: Center(
                        child: Text(
                          "${user.name}",
                          //"Jorge Luis",
                          style: TextStyle(
                              fontSize: 22,
                              color: color3,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 55,
                      ),
                      Text("Apellido Paterno:",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: size!.height*0.04,
                    child: Center(
                      child: Text(
                        "${user.firstSurname}",
                        //"alejo",
                        style: TextStyle(
                            fontSize: 22,
                            color: color3,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 55,
                      ),
                      Text("Apellido Materno:",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: size!.height*0.04,
                    child: Center(
                      child: Text(
                        "${user.secondSurname}",
                        //"gutierrez",
                        style: TextStyle(
                            fontSize: 22,
                            color: color3,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 55,
                      ),
                      Text("Nro de Celula:",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: size!.height*0.04,
                    child: Center(
                      child: Text(
                        "${user.phone}",
                        //"jorge123",
                        style: TextStyle(
                            fontSize: 22,
                            color: color3,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 55,
                      ),
                      Text("Email:",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                    ],
                  ),
                  Container(
                    height: size!.height*0.04,
                    child: Center(
                      child: Text(
                        "${user.email}",
                        //"jor@gmail.com",
                        style: TextStyle(
                            fontSize: 20,
                            color: color3,
                            fontStyle: FontStyle.italic
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ):LoadingPage(),
    );

  }
  bool Submit(){
    bool aux = false;
    if(name.text.isNotEmpty && firstSurname.text.isNotEmpty && secondSurname.text.isNotEmpty && phone.text.isNotEmpty && username.text.isNotEmpty && email.text.isNotEmpty){
      //if(firstName.text.isNotEmpty){
      aux = true;
      user.name=name.text;
      user.firstSurname=firstSurname.text;
      user.secondSurname=secondSurname.text;
      user.phone=phone.text;
      user.username=username.text;
      user.email=email.text;
      user.password=password.text;
      //print("paswword en usuario: ");
      //print(user.password);
      //print("paswword datos: ");
      //print(password.text);

    }else{
      aux = false;
    }
    return aux;
  }
}
