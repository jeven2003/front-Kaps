import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled2/Services/user.dart';
import 'package:http/http.dart' as http;


class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  bool _obscure = true;
  IconData _obscureIcon = Icons.visibility_off;

  createAccount(User user)async{
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/v1/Auth/register/user'),
      headers : <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'username' : user.username,
        'email' : user.email,
        'password' : user.password,
      }),
    );
    print(response.body);
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
                'Lets get Started',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
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
                        label: Text('Name'),
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty){
                          return 'Please provide a Name';
                        }
                        if (value.length <2){
                          return 'Name should at least 3 letters long';
                        }
                        return null;
                      },
                      onSaved: (value){
                        name = value!;
                      },
                    ),
                    SizedBox(height: 30.0),
                    TextFormField(
                      maxLength: 40,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          label: Text('Email'),
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty){
                          return 'Please provide a Email';
                        }
                        if (value.length <2){
                          return 'Name should at least 3 letters long';
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
                      obscureText: _obscure,
                      decoration: InputDecoration(
                          label: Text('Password'),
                          prefixIcon: Icon(Icons.lock_rounded),
                          suffixIcon: IconButton(
                            icon: Icon(_obscureIcon),
                            onPressed: (){
                              setState(() {
                                _obscure = !_obscure;
                                if(_obscure) {
                                  _obscureIcon = Icons.visibility_off;
                                }else{
                                  _obscureIcon = Icons.visibility;
                                }
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )

                      ),
                      validator: (value){
                        if (value == null || value.isEmpty){
                          return 'Please provide Password';
                        }
                        if (value.length <8){
                          return 'Password should contains 8 characters';
                        }
                       if (value.length >20){
                         return 'Password must be 20 characters long only';
                       }
                        return null;
                      },
                      onSaved: (value){
                        password = value!;
                      },
                    ),
                    SizedBox(height: 45.0),
                    ElevatedButton(
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            formKey.currentState!.save();
                            User user = User(
                              username: name,
                              email: email,
                              password: password,
                            );
                            createAccount(user);
                          }
                        },

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.login),
                          SizedBox(width: 10.0,),
                          Text('Sign Up')
                        ],
                      ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          foregroundColor: Colors.white,
                        ),
                    ),
                    SizedBox(height: 60.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 30.0),
                        InkWell(
                          child: Text(
                            'Please Login',
                            style: TextStyle(
                                color: Colors.blue,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          onTap: () => Navigator.popAndPushNamed(context, '/login'),
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
