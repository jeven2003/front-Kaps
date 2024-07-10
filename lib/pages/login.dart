import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Services/user.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final formKey = GlobalKey<FormState>();
  String email= '';
  String password = '';

  Widget buttonContent = Text('Log in');

  Widget loadingDisplay = CircularProgressIndicator();

  Future<bool> login(User user)async{
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/v1/Auth/login'),
      headers: <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8'
    },
      body: jsonEncode(<String, dynamic>{
        'usernameorEmail' : user.email,
        'password' : user.password,
      })
    );
    if(response.statusCode == 200){
      return true;
    }
      return false;
    //print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Text(
                     'Login Here',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24.5,
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment:CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextFormField(
                            maxLength: 40,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                                label: Text('Email'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )
                            ),
                            validator: (value){
                              if (value == null || value.isEmpty){
                                return 'Please provide an Email';
                              }
                              if (value.length <2){
                                return 'Email should at least 30 characters long';
                              }
                              return null;
                            },
                            onSaved: (value){
                              email = value!;
                            },
                          ),
                          SizedBox(height: 30.0),
                          TextFormField(
                            maxLength: 40,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_clock_rounded),
                                label: Text('Password'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )
                            ),
                            validator: (value){
                              if (value == null || value.isEmpty){
                                return 'Please provide a Password';
                              }
                              if (value.length <7){
                                return 'Password should contain 8 character long';
                              }
                              return null;
                            },
                            onSaved: (value){
                              password = value!;
                            },
                          ),
                          SizedBox(height: 30.0),
                          ElevatedButton(
                            onPressed: (){
                              if(formKey.currentState!.validate()){
                                formKey.currentState!.save();
                                User user = User(
                                  username: '',
                                  email:email,
                                  password:password,
                                );
                                /*if(login(user)){
                                  Navigator.pushReplacementNamed(context, '/dashboard');
                                }*/
                                setState(() {
                                  buttonContent = FutureBuilder(
                                      future: login(user),
                                      builder: (context, snapshots){
                                        if(snapshots.connectionState == ConnectionState.waiting){
                                          return loadingDisplay;
                                  }
                                        if (snapshots.hasData){
                                  }
                                        return Text('Log In');
                                  }
                                  );
                                });
                                  Navigator.pushReplacementNamed(context, '/');
                              }
                            },
                            child: buttonContent,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.brown,
                              foregroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 35.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Text(
                                'or signup with',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 35.0),

                          ElevatedButton(
                            onPressed: (){},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.g_mobiledata),
                                SizedBox(width: 10.0,),
                                Text('Login with Google')
                              ],
                            ),

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pinkAccent,
                              foregroundColor: Colors.white,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: (){},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.facebook),
                                SizedBox(width: 10.0,),
                                Text('Login with Facebook')
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Dont have an account? ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 30.0),
                              InkWell(
                                child: Text(
                                  'Sign Up Here',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                onTap: () => Navigator.popAndPushNamed(context, '/signup'),
                              ),
                            ],
                          )
                        ]
                    ),
                  )

                ]
            )
        ),
      ),
    );
  }
}
