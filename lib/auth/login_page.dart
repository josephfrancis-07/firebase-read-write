import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/auth/register_page.dart';
import 'package:flutter/material.dart';

import '../home_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              height: size.height,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.20,
                  ),
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: 'Email Address'),
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Password'),
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      height: 35,
                      width: 100,
                      child: MaterialButton(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        color: Colors.blue,
                        onPressed: () async {
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                            if (user != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return HomePage();
                                  },
                                ),
                              );
                            } else {
                              return Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return LoginPage();
                                },
                              ));
                            }
                          } catch (e) {
                            print(e);
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return LoginPage();
                              },
                            ));
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: size.height * 0.09,
                  ),
                  Center(
                    child: SizedBox(
                      height: 35,
                      width: 100,
                      child: MaterialButton(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RegisterPage();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
