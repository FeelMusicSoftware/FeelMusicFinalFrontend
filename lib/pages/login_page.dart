import 'package:feel_music_final/Models/User.dart';
import 'package:feel_music_final/Models/UserMail.dart';
import 'package:feel_music_final/Pages/create_account_page.dart';
import 'package:feel_music_final/Repositories/Token.dart';
import 'package:feel_music_final/Repositories/user_repository.dart';
import 'package:flutter/material.dart';

import '../Colors.dart';
import 'BottomNavBar.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  UserMail userMail=UserMail();
  bool _confirm=false;
  UserRepository userRepository=new UserRepository();
  User user=User();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
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
                  Container(
                    height: size.width*0.5,
                    width: size.width*0.5,
                    margin: EdgeInsets.only(left: size.width*0.01,top: size.width*0.014,bottom: size.width*0.014,right: size.width*0.01),
                    // padding: EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                      image:DecorationImage(
                        // image: AssetImage("assets/images/img1.jpg"),
                          image: AssetImage("assets/images/final.jpg"),
                          fit: BoxFit.fill
                      ),
                      // borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)),
                      // color: _color,
                    ),
                  ),
                  SizedBox(height: size.width*0.1,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: size.height * 0.075,
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
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: size.height * 0.075,
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
                          obscureText: true,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.width*0.03,),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>CreateAccountPage()));
                      },
                      child: Text("¿No tienes una cuenta?",style: TextStyle(color: color5),)
                  ),
                  SizedBox(height: size.width*0.04,),
                  Container(
                    height: size.height * 0.075,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26.0), color: color5),
                    child: FlatButton(
                      onPressed: ()async {
                        setState(() {
                          userMail.email=_email.text;
                          userMail.password=_password.text;
                        });
                        _confirm= await userRepository.signIn(userMail);
                        if(_confirm){
                          user = (await userRepository.databyUserId())!;
                          await GlobalUser.save(user);
                          // User profile=await GlobalUser.read();
                          // print("da objeto global");
                          // print(profile.name);
                          Navigator.of(context).pushNamedAndRemoveUntil('/screen2', (Route<dynamic> route) => false);

                          // Navigator.push(context, MaterialPageRoute(builder: (_)=>BottomNavbar()));
                        }
                        else{
                          print("Correo o password erroneo");
                        }
                        // else{
                        //   Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
                        // }

                        // _confirmUser.userName = _username.text;
                        // _confirmUser.password = _password.text;
                        // BlocProvider.of<NavigationBloc>(context)
                        //     .add(ConfirmUserEvent(_confirmUser));
                      },
                      child: Text(
                        "Iniciar Sesión",
                        style: TextStyle(
                            color: color1,
                            fontSize: size.height * 0.025,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  // SizedBox(height: size.width*0.04,),
                  // Container(
                  //   height: size.height * 0.075,
                  //   width: size.width * 0.8,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(26.0), color: color12),
                  //   child: FlatButton(
                  //     onPressed: () {
                  //       Navigator.push(context, MaterialPageRoute(builder: (_)=>CreateAccountPage()));
                  //       // _confirmUser.userName = _username.text;
                  //       // _confirmUser.password = _password.text;
                  //       // BlocProvider.of<NavigationBloc>(context)
                  //       //     .add(ConfirmUserEvent(_confirmUser));
                  //     },
                  //     child: Text(
                  //       "Crear Cuenta",
                  //       style: TextStyle(
                  //           color: color1,
                  //           fontSize: size.height * 0.025,
                  //           fontWeight: FontWeight.bold),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        )
    );
  }
}