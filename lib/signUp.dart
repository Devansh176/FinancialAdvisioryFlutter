import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:financial_advisory/HomePage.dart';
import 'login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;



class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

    Future<void> _signUp(String username, String email, String password, BuildContext context) async {
      final screenSize = MediaQuery.of(context).size;
      final double height = screenSize.height;
      final double width = screenSize.width;

      final double fontSize = width * 0.05;
      final double padding = width * 0.06;

      try {
        var url = "http://192.168.1.5:8080/postUser";
        var response = await http.post(
            Uri.parse(url),
            headers: <String, String>{
              "Content-Type": "application/json"
            },
            body: jsonEncode(<String, String>{
              "name": username,
              "email": email,
              "password": password,
            })
        );
        if(response.statusCode == 200) {
          Fluttertoast.showToast(
            msg: "Successful signUp",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: fontSize * 0.5,
          );
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
        } else {
          Fluttertoast.showToast(
            msg: "Sign up Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: fontSize * 0.5,
          );
        }
      }on Exception catch(e){
        print(e);
        Fluttertoast.showToast(
          msg: "Error Occurred",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: fontSize * 0.5,
        );
      }
    }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;

    final double fontSize = width * 0.05;
    final double padding = width * 0.06;

    TextStyle textStyle = Theme.of(context).textTheme.titleMedium!;
    Color inputTextColor = Colors.white;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Financial Advisor",
          style: TextStyle(
            fontSize: fontSize * 1.2,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.cyan,
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Login.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.all(padding * 1.3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: padding * 2.0),
                Text(
                  "Sign Up!",
                  style: textStyle.copyWith(fontSize: fontSize * 3, color: inputTextColor, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Create your Account",
                  style: textStyle.copyWith(fontSize: fontSize * 0.85, color: inputTextColor, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: padding * 1.0,),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      _buildInputField('Username', _usernameController, textStyle, inputTextColor),
                      _buildInputField('Email', _emailController, textStyle, inputTextColor),
                      _buildPasswordField('Password', _passwordController, textStyle, inputTextColor),
                      _buildPasswordField('Confirm Password', _confirmPasswordController, textStyle, inputTextColor),
                      SizedBox(height: padding * 1.0),
                      ElevatedButton(
                        onPressed: (){
                          _submitForm();
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
                          side: WidgetStateProperty.all(const BorderSide(color: Colors.white)),
                        ),
                        child: Text('Sign Up', style: TextStyle(color: Colors.tealAccent,fontSize: fontSize * 0.75),),
                      ),
                      SizedBox(height: padding * 0.6),
                      const Text('or', style: TextStyle(color: Colors.white)),
                      SizedBox(height: padding * 0.6),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
                          side: WidgetStateProperty.all(const BorderSide(color: Colors.white)),
                        ),
                        child: Text('Sign in with Google', style: TextStyle(color: Colors.cyanAccent,fontSize: fontSize * 0.75)),
                      ),
                      SizedBox(height: padding * 0.5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Already have an account? ",
                            style: textStyle.copyWith(
                              color: inputTextColor,
                              fontWeight: FontWeight.normal,
                              fontSize: fontSize * 0.75,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const loginPage()));
                            },
                            child: Text(
                              'Login',
                              style: textStyle.copyWith(
                                color: inputTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: fontSize * 0.78,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String labelText, TextEditingController controller, TextStyle textStyle, Color textColor) {
    final screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;

    final double padding = width * 0.06;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding * 0.22),
      child: TextFormField(
        style: textStyle.copyWith(color: textColor),
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: 'Enter a $labelText',
          labelStyle: textStyle.copyWith(color: textColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(padding * 0.4),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$labelText is required';
          }
          if(labelText == "Email" && !value.endsWith('@gmail.com')){
            return 'Email must be a @gmail.com address';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordField(String labelText, TextEditingController controller, TextStyle textStyle, Color textColor) {
    final screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;

    final double padding = width * 0.06;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding * 0.22),
      child: TextFormField(
        style: textStyle.copyWith(color: textColor),
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: 'Enter a $labelText',
          labelStyle: textStyle.copyWith(color: textColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(padding * 0.4),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$labelText is required';
          }
          if (labelText == 'Password' && !isValidPassword(value)) {
            return 'Password must be at least 8 characters long, contain at least one capital letter, one number, and one special character';
          }
          return null;
        },
      ),
    );
  }

  bool isValidPassword(String password) {
    final passwordRegExp = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return passwordRegExp.hasMatch(password);
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text.trim();
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();
      String confirmPassword = _confirmPasswordController.text.trim();


      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Passwords do not Match")));
        return;
      }

      if(!email.endsWith("@gmail.com")){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Email must be @gmail.com address")));
      }

      _signUp(username, email, password, context);
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
