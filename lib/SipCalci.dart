import 'package:flutter/material.dart';
import 'dart:math';

class Sip extends StatefulWidget {
  const Sip({super.key});

  @override
  State<Sip> createState() => _SipState();
}

class _SipState extends State<Sip> {
  TextEditingController investment = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController duration = TextEditingController();
  double result = 0.0;

  @override
  void dispose(){
    investment.dispose();
    rate.dispose();
    duration.dispose();
    super.dispose();
  }

  void calculate(){
    double initialAmt = double.tryParse(investment.text) ?? 0.0;
    double returnRate = double.tryParse(rate.text) ?? 0.0;
    double durationValue = double.tryParse(duration.text) ?? 0.0;

    if (initialAmt <= 0 || returnRate <= 0 || durationValue <= 0) {
      setState(() {
        result = 0.0;
      });
      return;
    }

    double monthlyRate = returnRate / 12 / 100;
    int totalMonths = (durationValue * 12).toInt();

    double futureValue = 0.0;
    if (monthlyRate != 0) {
      futureValue = initialAmt *
          (((pow(1 + monthlyRate, totalMonths)) - 1) / monthlyRate) *
          (1 + monthlyRate);
    } else {
      futureValue = initialAmt * totalMonths;
    }

    setState(() {
      result = futureValue;
    });
  }


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;

    final double fontSize = width * 0.05;
    final double padding = width * 0.06;

    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'SIP Calculator',
            style: TextStyle(
              fontSize: fontSize * 1.6,
              fontWeight: FontWeight.w700,
            ),
            selectionColor: Colors.white,
          ),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: SafeArea(
            child: Column(
              children: [
                const Image(image: AssetImage('assets/Calculator.png')),
                Padding(
                  padding: EdgeInsets.all(padding * 1.0,),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width/3,
                            child: Text(
                              'Initial Investment Amount',
                              style: TextStyle(
                                color: const Color(0xFF228B22),
                                fontWeight: FontWeight.w600,
                                fontSize: fontSize * 1.0,
                              ),
                            ),
                          ),
                          SizedBox(width: padding * 1.3,),
                          Expanded(
                            child: TextField(
                              controller: investment,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              cursorColor: Colors.lightGreenAccent,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(padding * 0.9,),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF228B22),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(padding * 0.9),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: padding * 1.5,),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width/3,
                            child: Text(
                              'Rate of Return(%)',
                              style: TextStyle(
                                color: const Color(0xFF228B22),
                                fontWeight: FontWeight.w600,
                                fontSize: fontSize * 1.0,
                              ),
                            ),
                          ),
                          SizedBox(width: padding * 1.3,),
                          Expanded(
                            child: TextField(
                              controller: rate,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              cursorColor: Colors.lightGreenAccent,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(padding * 0.9,),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF228B22),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(padding * 0.9),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: padding * 1.5,),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width/3,
                            child: Text(
                              'Duration',
                              style: TextStyle(
                                color: const Color(0xFF228B22),
                                fontWeight: FontWeight.w600,
                                fontSize: fontSize * 1.0,
                              ),
                            ),
                          ),
                          SizedBox(width: padding * 1.3,),
                          Expanded(
                            child: TextField(
                              controller: duration,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              cursorColor: Colors.lightGreenAccent,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(padding * 0.9,),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF228B22),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(padding * 0.9),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: padding * 1.5,),
                      Row(
                        children  : [
                          Expanded(
                            child: ElevatedButton(
                              style:  ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF013220)
                              ),
                              onPressed: (){
                                calculate();
                              },
                              child: Text(
                                'Calculate',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: fontSize * 0.75,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: padding * 0.6,),
                      Text(
                        'Future Value : ${result.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: fontSize * 0.95,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
