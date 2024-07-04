import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final formKey = GlobalKey<FormState>();
  String email= '';
  String password = '';

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
                  Text(
                     'Login Here',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24.5,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment:CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextFormField(
                            maxLength: 40,
                            decoration: InputDecoration(
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
                                print(email);
                                print(password);
                                Navigator.pushReplacementNamed(context, '/');
                              }
                            },
                            child:  Text ('LogIn'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.brown,
                              foregroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'or signup with',
                                style: TextStyle(
                                  color: Colors.black
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 30.0),

                          ElevatedButton(
                            onPressed: (){},

                            child:  Text ('Log in with Google'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pinkAccent,
                              foregroundColor: Colors.white,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: (){},

                            child:  Text ('Log in with Facebook'),
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
                                ),
                              ),
                              SizedBox(height: 30.0),
                              InkWell(
                                child: Text(
                                  'Sign Up Here',
                                  style: TextStyle(
                                    color: Colors.blue
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
