
import 'package:clickncart/controllers/auth_controller.dart';
import 'package:clickncart/utils/show_snackBar.dart';
import 'package:clickncart/views/buyers/auth/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController _authController = AuthController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  late String email;

  late String fullName;

  late String phoneNumber;

  late String password;

  bool _isLoading = false;

  _signUpUser() async{
        setState(() {
              _isLoading = true;
        });
          if(_formkey.currentState!.validate()){
               await _authController.signUpUsers(email, fullName, phoneNumber, password).whenComplete(()  {
                      setState(() {
                            _formkey.currentState!.reset();
                            _isLoading = false;
                      });
               });
               return showSnack(context, 'Congratulations Registred Successfully');

          } else {
                setState(() {
                      _isLoading = false;
                });
                return showSnack(context, 'Fields must not be empty');
          }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
                key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Create Customer''s account',
                style: TextStyle(fontSize: 20,
                ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please Enter Email';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value){
                      email = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter email',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please Enter Full Name';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value){
                      fullName = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter Full name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please Enter Phone Number';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value){
                      phoneNumber = value;
                    },
                    decoration: InputDecoration(
                      labelText: ' Enter Phone no',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    obscureText: true,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please Enter Password';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value){
                      password = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter Password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      _signUpUser();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width -40,height: 50, decoration: BoxDecoration(
                          color: Colors.deepPurple.shade500,
                          borderRadius: BorderRadius.circular(10),

                    ),
                      child: Center(

                        child: _isLoading ? CircularProgressIndicator(
                              color: Colors.indigoAccent.shade700,
                        ): Text('Register',
                          style: TextStyle(color: Colors.deepOrange,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 4,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already Have an Account?   '),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return LoginScreen();
                      }));
                    }, child: Text(

                      'Login',
                      style: TextStyle(
                        color: Colors.pink.shade900,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
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
