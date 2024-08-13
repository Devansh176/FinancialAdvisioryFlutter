import 'package:financial_advisory/Expense.dart';
import 'package:financial_advisory/Income.dart';
import 'package:flutter/material.dart';

class expenseIncome extends StatefulWidget {
  const expenseIncome({super.key});

  @override
  State<expenseIncome> createState() => _expenseIncomeState();
}

class _expenseIncomeState extends State<expenseIncome> {
  late DateTime selectedDate1;
  late DateTime selectedDate2;
  late String date1;
  late String date2;

  @override
  void initState(){
    super.initState();
    selectedDate1 = DateTime.now();
    selectedDate2 = DateTime.now();
    date1 = formatDate(selectedDate1);
    date2 = formatDate(selectedDate2);
  }

  String formatDate(DateTime date){
    return '${date.day}/${date.month}/${date.year}';
  }

  Future<void> _selectInitialDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate1,
      firstDate: DateTime(2010, 8),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate1) {
      setState(() {
        selectedDate1 = picked;
        date1 = formatDate(picked);
      });
    }
  }

  Future<void> _selectFinalDate(BuildContext context) async {
    final DateTime? pickedd  = await showDatePicker(
        context: context,
        initialDate: selectedDate2,
        firstDate: DateTime(2010,4),
        lastDate: DateTime(2100),
    );
    if(pickedd != null && pickedd != selectedDate2){
      setState(() {
        selectedDate2 = pickedd;
        date2 = formatDate(pickedd);
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
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Expenses and Income',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: fontSize * 1.6,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: padding * 1.7,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding * 1.59,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Initial Date',
                  style: TextStyle(
                    fontSize: fontSize * 0.95,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '<-->',
                  style: TextStyle(
                    fontSize: fontSize * 0.95,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Final Date',
                  style: TextStyle(
                    fontSize: fontSize * 0.95,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding * 1.1,vertical: padding * 0.1,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => _selectInitialDate(context),
                  child: Text(date1),
                ),
                ElevatedButton(
                  onPressed: () => _selectFinalDate(context),
                  child: Text(date2),
                ),
              ],
            ),
          ),
          SizedBox(
            height: padding * 0.07,
            child: Container(
              color: Colors.black,
              margin: EdgeInsets.symmetric(horizontal: padding * 1.0),
            ),
          ),
        ],
      ),
      bottomSheet: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const income()
                  )
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.transparent),
                side: WidgetStateProperty.all(const BorderSide(color: Colors.white))
              ),
              child: Text('Income',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: fontSize * 0.75,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: (){},
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.transparent),
                  side: WidgetStateProperty.all(const BorderSide(color: Colors.white))
              ),
              child: Text('Transaction',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: fontSize * 0.75,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Expense()
                  )
                );
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.transparent),
                  side: WidgetStateProperty.all(const BorderSide(color: Colors.white))
              ),
              child: Text('Expense',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: fontSize * 0.75,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
