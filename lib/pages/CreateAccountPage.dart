import 'package:feel_music_final/Models/User.dart';
import 'package:feel_music_final/Models/UserMail.dart';
import 'package:feel_music_final/Repositories/UserRepository.dart';
import 'package:flutter/material.dart';

import '../Colors.dart';
import 'BottomNavBar.dart';
import 'login_page.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _secondlastName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  User _user=new User();
  // TextEditingController _gender = TextEditingController();
  TextEditingController _cellphone = TextEditingController();
  UserRepository userRepository=UserRepository();
  bool confirmUser=false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: color4,
          body: SingleChildScrollView(
            child: Container(
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: size.width*0.1,),
                  // Container(
                  //   height: size.width*0.5,
                  //   width: size.width*0.5,
                  //   margin: EdgeInsets.only(left: size.width*0.01,top: size.width*0.014,bottom: size.width*0.014,right: size.width*0.01),
                  //   // padding: EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.all(Radius.circular(60)),
                  //     image:DecorationImage(
                  //       // image: AssetImage("assets/images/img1.jpg"),
                  //         image: AssetImage("assets/images/final.jpg"),
                  //         fit: BoxFit.fill
                  //     ),
                  //     // borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)),
                  //     // color: _color,
                  //   ),
                  // ),
                  SizedBox(height: size.width*0.1,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: size.height * 0.07,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[500]!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(26.0),
                      ),
                      child: Center(
                        child: TextField(
                          controller: _firstName,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              child: Icon(
                                Icons.person,
                                size: 30,
                              ),
                            ),
                            hintText: "Nombre",
                            // hintStyle: kBodyText,
                          ),
                          // obscureText: true,
                          cursorColor: color1,
                          style: TextStyle(color: color1),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: size.height * 0.07,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[500]!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(26.0),
                      ),
                      child: Center(
                        child: TextField(
                          controller: _lastName,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              child: Icon(
                                Icons.person,
                                size: 30,
                              ),
                            ),
                            hintText: "Primer Apellido",
                            // hintStyle: kBodyText,
                          ),
                          // obscureText: true,
                          cursorColor: color1,
                          style: TextStyle(color: color1),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: size.height * 0.07,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[500]!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(26.0),
                      ),
                      child: Center(
                        child: TextField(
                          controller: _secondlastName,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              child: Icon(
                                Icons.person,
                                size: 30,
                              ),
                            ),
                            hintText: "Segundo Apellido",
                            // hintStyle: kBodyText,
                          ),
                          // obscureText: true,
                          cursorColor: color1,
                          style: TextStyle(color: color1),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: size.height * 0.07,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[500]!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(26.0),
                      ),
                      child: Center(
                        child: TextField(
                          controller: _cellphone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              child: Icon(
                                Icons.phone_android,
                                size: 30,
                              ),
                            ),
                            hintText: "Teléfono",
                            // hintStyle: kBodyText,
                          ),
                          // obscureText: true,
                          cursorColor: color1,
                          style: TextStyle(color: color1),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: size.height * 0.07,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[500]!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(26.0),
                      ),
                      child: Center(
                        child: TextField(
                          controller: _username,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              child: Icon(
                                Icons.drive_file_rename_outline,
                                size: 30,
                              ),
                            ),
                            hintText: "Nombre de Usuario",
                            // hintStyle: kBodyText,
                          ),
                          // obscureText: true,
                          cursorColor: color1,
                          style: TextStyle(color: color1),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: size.height * 0.07,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[500]!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(26.0),
                      ),
                      child: Center(
                        child: TextField(
                          controller: _email,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              child: Icon(
                                Icons.email,
                                size: 30,
                              ),
                            ),
                            hintText: "Email",
                            // hintStyle: kBodyText,
                          ),
                          // obscureText: true,
                          cursorColor: color1,
                          style: TextStyle(color: color1),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: size.height * 0.07,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[500]!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(26.0),
                      ),
                      child: Center(
                        child: TextField(
                          controller: _password,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              child: Icon(
                                Icons.lock,
                                size: 30,
                              ),
                            ),
                            hintText: "Contraseña",
                            // hintStyle: kBodyText,
                          ),
                          cursorColor: color1,
                          style: TextStyle(color: color1),
                          obscureText: true,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: size.width*0.03,),
                  // Text("¿Olvidaste tu contraseña?",style: TextStyle(color: color5),),
                  SizedBox(height: size.width*0.04,),
                  Container(
                    height: size.height * 0.07,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26.0), color: color5),
                    child: FlatButton(
                      onPressed: ()  async{
                        // Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
                        setState(() {
                          _user.idUser=1;
                          _user.idPerson=1;
                          _user.name=_firstName.text;
                          _user.firstSurname=_lastName.text;
                          _user.secondSurname=_secondlastName.text;
                          _user.phone=_cellphone.text;
                          _user.username=_username.text;
                          _user.email=_email.text;
                          _user.password=_password.text;

                        });
                        confirmUser=await userRepository.createAccount(_user);
                        print(_user.email);
                        print(confirmUser);
                        if(confirmUser){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>BottomNavbar()));
                        }
                        else{
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
                        }
                        // _confirmUser.userName = _username.text;
                        // _confirmUser.password = _password.text;
                        // BlocProvider.of<NavigationBloc>(context)
                        //     .add(ConfirmUserEvent(_confirmUser));
                      },
                      child: Text(
                        "Confirmar",
                        style: TextStyle(
                            color: color1,
                            fontSize: size.height * 0.025,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: size.width*0.15,),
                  // SizedBox(height: size.width*0.04,),
                  // Container(
                  //   height: size.height * 0.07,
                  //   width: size.width * 0.8,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(26.0), color: color12),
                  //   child: FlatButton(
                  //     onPressed: () {
                  //       Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
                  //       // _confirmUser.userName = _username.text;
                  //       // _confirmUser.password = _password.text;
                  //       // BlocProvider.of<NavigationBloc>(context)
                  //       //     .add(ConfirmUserEvent(_confirmUser));
                  //     },
                  //     child: Text(
                  //       "Cancelar",
                  //       style: TextStyle(
                  //           color: color1,
                  //           fontSize: size.height * 0.025,
                  //           fontWeight: FontWeight.bold),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: size.width*0.15,),
                ],
              ),
            ),
          ),
        )
    );
  }
}
