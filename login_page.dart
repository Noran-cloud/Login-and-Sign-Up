import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rwad/signup_page.dart';

class Login extends StatefulWidget {
   Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
var _formkey = GlobalKey<FormState>();
var _emailController = TextEditingController();
var _passwordController = TextEditingController();
bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            key: _formkey,
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Text('Welcome',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                  Text('Sign In to continue',style: TextStyle(fontSize: 17),),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if(value == null || value.isEmpty)
                      return 'Please, Enter your email!';
                      if(!value.contains('@'))
                      return 'Please,Enter valid email';
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      enabledBorder: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField( 
                    controller: _passwordController,
                    obscureText: isSecure,
                    validator: (value) {
                      if(value == null || value.isEmpty)
                      return 'Please,Enter your password';
                      if(value.length < 6)
                      return 'Your password should be 6 or more characters';
                    },
                    decoration: InputDecoration( 
                      hintText: 'Password',
                      enabledBorder: OutlineInputBorder(),
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          isSecure = !isSecure;
                        });
                      }, icon: isSecure? Icon(Icons.visibility_off) : Icon(Icons.visibility)),
                    ), 
                  ),
            
                  SizedBox(height: 30,),
                  ElevatedButton( 
                    style: ElevatedButton.styleFrom( 
                      minimumSize: Size(double.infinity, 50), 
                      backgroundColor: Colors.blue[800],
                      ),
                    onPressed: (){
                      if(_formkey.currentState?.validate() == true)
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email: ${_emailController.text}      Password: ${_passwordController.text}')));
                    }, 
                    child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      child: Text('Forgot Password?',style: TextStyle(color: Colors.grey),),
                    ),
              
                    Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account? ',style: TextStyle(color: Colors.grey)),
                        GestureDetector(child: Text('Sign Up',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17)),onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
                        },)
                      ],
                    )
                    
              ],
            ),
          ),
        ),
      ),
    );
  }
}