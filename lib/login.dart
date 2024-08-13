import 'dart:convert';

import 'package:financial_advisory/Finance_Model/Finance_model.dart';
import 'package:flutter/material.dart';
import 'package:financial_advisory/HomePage.dart';
import 'package:financial_advisory/signUp.dart';
import 'package:http/http.dart' as http;

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String _errorMsg = "";

  Future<void> _login(String username, String password, BuildContext) async {
    try {
      var url = Uri.parse(
          "http://192.168.1.5:8080/getUser/name_pass?username=$username&password=$password");
      var response = await http.get(url);
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (data != null) {
          if (data.containsKey('username') &&
              data['username'] == username &&
              data.containsKey('password') &&
              data['password'] == password) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else {
            setState(() {
              _errorMsg = "Invalid username or password";
            });
          }
        } else {
          setState(() {
            _errorMsg = "No user found";
          });
        }
      } else {
        setState(() {
          _errorMsg = "Server error, Please try again later";
        });
      }
    } catch (e) {
      setState(() {
        _errorMsg = "An error occurred, Please try again later";
      });
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
          // Positioned.fill(
          //   child: Container(
          //     decoration: const BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage('assets/Login.jpg'),
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          // ),
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.all(padding * 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: padding * 6.0),
                Text(
                  "Welcome Back!",
                  style: textStyle.copyWith(
                      fontSize: fontSize * 2.5,
                      color: inputTextColor,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Enter your credentials to Login",
                  style: textStyle.copyWith(
                      fontSize: fontSize * 0.8,
                      color: inputTextColor,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: padding * 1,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      _buildInputField('Username/Email', _usernameController,
                          textStyle, inputTextColor),
                      _buildPasswordField('Password', _passwordController,
                          textStyle, inputTextColor),
                      SizedBox(height: padding * 1),
                      ElevatedButton(
                        onPressed: _submitForm,
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                              Colors.transparent),
                          side: WidgetStateProperty.all(
                              const BorderSide(color: Colors.white)),
                        ),
                        child: Text('Login',
                            style: TextStyle(
                              color: Colors.tealAccent,
                              fontSize: fontSize * 0.75,
                            )),
                      ),
                      SizedBox(height: padding * 0.6),
                      const Text('or', style: TextStyle(color: Colors.white)),
                      SizedBox(height: padding * 0.6),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                              Colors.transparent),
                          side: WidgetStateProperty.all(
                              const BorderSide(color: Colors.white)),
                        ),
                        child: Text('Sign in with Google',
                            style: TextStyle(
                              color: Colors.cyanAccent,
                              fontSize: fontSize * 0.75,
                            )),
                      ),
                      SizedBox(height: padding * 0.5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Don't have an account? ",
                            style: textStyle.copyWith(
                              color: inputTextColor,
                              fontWeight: FontWeight.normal,
                              fontSize: fontSize * 0.73,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const signUp()));
                            },
                            child: Text(
                              'Sign Up',
                              style: textStyle.copyWith(
                                color: inputTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: fontSize * 0.75,
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

  Widget _buildInputField(String labelText, TextEditingController controller,
      TextStyle textStyle, Color textColor) {
    final screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;

    final double padding = width * 0.06;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding * 0.2),
      child: TextFormField(
        style: textStyle.copyWith(color: textColor),
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: 'Enter your $labelText',
          labelStyle: textStyle.copyWith(color: textColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(padding * 0.4),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$labelText is required';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordField(String labelText, TextEditingController controller,
      TextStyle textStyle, Color textColor) {
    final screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;

    final double padding = width * 0.06;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding * 0.2),
      child: TextFormField(
        style: textStyle.copyWith(color: textColor),
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: 'Enter your $labelText',
          labelStyle: textStyle.copyWith(color: textColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(padding * 0.4),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$labelText is required';
          }
          return null;
        },
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text.trim();
      String password = _passwordController.text.trim();

      _login(username, password, context);
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
