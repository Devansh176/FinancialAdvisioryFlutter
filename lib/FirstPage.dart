import 'package:financial_advisory/login.dart';
import 'package:financial_advisory/signUp.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;

    final double boxHeight = height * 0.24;
    final double fontSize = width * 0.05;
    final double padding = width * 0.06;
    final double iconSize = height * 0.3;

    return Scaffold(
      backgroundColor: const Color(0xFF0E103D),
      appBar: AppBar(
        title: Text(
          "\nFinancial Advisor",
          style: TextStyle(
            fontSize: fontSize * 1.7,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.cyan,
        backgroundColor: const Color(0xFF0E103D),
      ),
      body: Stack(
        children: [
          Positioned(
            top: padding * 12.5,
            left: padding * 3.67,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  ' Hello..!!',
                  style: TextStyle(
                    fontSize: fontSize * 2.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyanAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: padding * 0.4),
                Text(
                  'Welcome to our Advisor\nwhere you will manage your expenses',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.cyanAccent,
                    fontSize: fontSize * 0.8,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: padding * 1.0),
                SizedBox(
                  height: boxHeight * 0.25,
                  width: boxHeight * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const loginPage(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.transparent),
                      side: WidgetStateProperty.all(const BorderSide(color: Colors.cyanAccent)),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: fontSize * 1.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.tealAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: padding * 0.35),
                SizedBox(
                  height: boxHeight * 0.25,
                  width: boxHeight * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const signUp(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.transparent),
                      side: WidgetStateProperty.all(const BorderSide(color: Colors.cyanAccent)),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: fontSize * 1.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.tealAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
