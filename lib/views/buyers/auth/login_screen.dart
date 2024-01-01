

import 'package:clickncart/controllers/auth_controller.dart';
import 'package:clickncart/utils/show_snackBar.dart';
import 'package:clickncart/views/buyers/auth/register_screen.dart';
import 'package:clickncart/views/buyers/main_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  late String email;

  late String password;

  _loginUsers() async{
        if(_formKey.currentState!.validate()) {
                String res = await _authController.loginUsers(email, password);

                if (res == 'success' ) {
                  return Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return MainScreen();
                      }));
                } else {
                      return showSnack(context, res);
                }

        } else {
              return showSnack(context, 'Fields must not be empty ');
        }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login Costomer''s account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    validator:  (value) {
                        if (value!.isEmpty) {
                            return 'Please Enter Email ID ';
                        } else {
                                return null;
                        }
                    },
                    onChanged: ((value) {
                      email = value;
                    }),
                    decoration: InputDecoration(
                      labelText: 'Enter Email Address,'
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    validator:  (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Password ';
                      } else {
                        return null;
                      }
                    },
                    onChanged: ((value) {
                      password = value;
                    }),
                    decoration: InputDecoration(
                        labelText: 'Enter password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {
                        _loginUsers();
                    },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange.shade700,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text('Login',
                       style: TextStyle(
                         letterSpacing: 5,
                         color: Colors.white,
                       ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Need an account'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return RegisterScreen();
                        }));
                      },
                        child: Text(
                        'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                            fontSize: 20,
                          ),
                    ),
                    ),

                  ],
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
