import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void fetchData(String email, String password)async{
    try{
    Response response = await post(Uri.parse('https://reqres.in/api/register'),
    body: {
      'email': email,
      'password': password,
    }
    );
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        debugPrint(data['token']);
        debugPrint('Success');
      }
    }
    catch(e){
      debugPrint('Unsuccessful');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'Email',
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: 'Password',
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              fetchData(emailController.text.toString(),passwordController.text.toString());
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text('Sign Up')),
            ),
          ),
        ],
      ),
    );
  }
}
