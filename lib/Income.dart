import 'package:financial_advisory/Expense_Income.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class income extends StatefulWidget {
  const income({super.key});

  @override
  State<income> createState() => _incomeState();
}

class _incomeState extends State<income> {
  DateTime selectDate = DateTime.now();
  String date = 'Select Date';
  String? selectedCategory;
  TextEditingController amt = TextEditingController();
  TextEditingController notes = TextEditingController();

  @override
  void initState(){
    super.initState();
    amt;
    notes;
    selectedCategory;
  }

  @override
  void dispose(){
    amt.dispose();
    notes.dispose();
    super.dispose();
  }

  bool validateCategory(){
    if(selectedCategory == null || selectedCategory!.isEmpty){
      return false;
    }
    return true;
  }

  bool validateAmount() {
    if (amt.text.isEmpty) {
      return false;
    }

    try {
      double amount = double.parse(amt.text);
      if (amount <= 0) {
        return false;
      }
    }
    catch (e) {
      return false;
    }
    return true;
  }

  void save(){
    final screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;

    final double fontSize = width * 0.05;

    if(validateAmount() && validateCategory()) {
      String Amount = amt.text.trim();
      String Notes = notes.text.trim();
      String? Category = selectedCategory?.trim();

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const expenseIncome()
        )
      );
    }else{
      if(!validateCategory()){
        Fluttertoast.showToast(
          msg: "Please select the Category",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: fontSize * 1.0,
        );
      }
      if(!validateAmount()){
        Fluttertoast.showToast(
          msg: "Please enter a valid Amount",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: fontSize * 1.0,
        );
      }
    }
  }


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pick = await showDatePicker(
      context: context,
      initialDate: selectDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if(pick != null && pick != selectDate){
      setState(() {
        selectDate = pick;
        date = '${pick.day}/${pick.month}/${pick.year}';
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

    return Scaffold(
      backgroundColor: Colors.black45,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: padding * 10.5,
                  decoration : BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(padding * 0.5),
                      bottomRight: Radius.circular(padding * 0.5),
                    ),
                    border: Border(
                      bottom: BorderSide(
                        width: width * 0.001,
                        color: Colors.black,
                        style: BorderStyle.solid
                      )
                    )
                  ),
                   child: Padding(
                    padding: EdgeInsets.only(left: padding * 4.48, top: padding * 5.2),
                    child: Text(
                      'Income Here!',
                      style: TextStyle(
                        fontSize: fontSize * 2.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: padding * 0.7,),
                SizedBox(
                  height: padding * 2.0,
                  width: padding * 5.0,
                  child: ElevatedButton(
                    onPressed: () => _selectDate(context),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.transparent),
                      side: WidgetStateProperty.all(const BorderSide(color: Colors.grey)),
                    ),
                    child: Text(date,
                      style: TextStyle(
                        fontSize: fontSize * 0.75,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
                SizedBox(height: padding * 1.2,),
                Padding(
                  padding: EdgeInsets.all(padding * 1.5,),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width/3,
                            child: Text(
                              'Category',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: fontSize * 1.0,
                                color: Colors.grey
                              ),
                            ),
                          ),
                          SizedBox(width: padding * 1.9),
                          Expanded(
                            child: DropdownButton<String>(
                              menuMaxHeight: height * 0.5,
                              value: selectedCategory,
                              items: <String>[
                                'Salary',
                                'Wages',
                                'Rental Income',
                                'Business',
                                'Capital Gains',
                                'House Property',
                                'Dividends',
                                'Stock',
                                'SIP',
                                'Commission',
                                'Family Pension',
                                'Property Rental',
                                'Partnerships',
                                'Other'
                              ].map((String type){
                                return DropdownMenuItem(
                                  value: type,
                                  child: Text(type,
                                    style: TextStyle(
                                      color: Colors.indigoAccent,
                                      fontSize: fontSize * 0.75,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value){
                                if(value != null){
                                  setState(() {
                                    selectedCategory = value;
                                  });
                                }
                              },
                              dropdownColor: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: padding * 1.5),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width/3,
                            child: Text(
                              'Amount',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: fontSize * 1.0,
                                  color: Colors.grey
                              ),
                            ),
                          ),
                          SizedBox(width: padding * 1.8),
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                color: Colors.indigoAccent,
                                fontSize: fontSize * 0.85,
                              ),
                              controller: amt,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              cursorColor: Colors.indigoAccent,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: width,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: padding * 1.5),
                      TextField(
                        controller: notes,
                        style: TextStyle(
                          color: Colors.indigoAccent,
                          fontSize: fontSize * 0.85
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        cursorColor: Colors.indigoAccent,
                        decoration: InputDecoration(
                          hintText: 'Enter Note...',
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.8),
                            fontSize: fontSize * 0.8,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(padding * 0.9,),
                          ),
                        )
                      ),
                      SizedBox(height: padding * 1.0),
                      ElevatedButton(
                        onPressed: () {
                          save();
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.transparent),
                          side: WidgetStateProperty.all(const BorderSide(color: Colors.grey)),
                        ),
                        child: Text(
                          '   Add Income   ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize * 0.7,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}
