import 'package:financial_advisory/Expense_Income.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  DateTime selectDate = DateTime.now();
  String date = 'Select Date';
  String? selectedCategory;
  TextEditingController amt = TextEditingController();
  TextEditingController notes = TextEditingController();

  @override
  void dispose() {
    amt.dispose();
    notes.dispose();
    super.dispose();
  }

  bool validateCategory() {
    if (selectedCategory == null || selectedCategory!.isEmpty) {
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
    } catch (e) {
      return false;
    }
    return true;
  }

  void save() {
    if (validateCategory() && validateAmount()) {
      String amount = amt.text.trim();
      String notesText = notes.text.trim();
      String? category = selectedCategory?.trim();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const expenseIncome(),
        ),
      );
    } else {
      if (!validateCategory()) {
        Fluttertoast.showToast(
          msg: "Please select the Category",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 20.0,
        );
      }
      if (!validateAmount()) {
        Fluttertoast.showToast(
          msg: "Please enter a valid Amount",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 20.0,
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
    if (pick != null && pick != selectDate) {
      setState(() {
        selectDate = pick;
        date = '${pick.day}/${pick.month}/${pick.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 240,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    border: Border(
                      bottom: BorderSide(
                        width: 2.0,
                        color: Colors.black,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(109, 120, 50, 30),
                    child: Text(
                      'Expense Here!',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.transparent),
                    side: WidgetStateProperty.all(const BorderSide(color: Colors.grey)),
                  ),
                  child: Text(
                    date,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 17.0),
                Padding(
                  padding: const EdgeInsets.all(27.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width/3,
                            child: const Text(
                              'Category',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(width: 30.0),
                          Expanded(
                            child: DropdownButton<String>(
                              menuMaxHeight: 450.0,
                              value: selectedCategory,
                              items: <String>[
                                'Legal Fees',
                                'Tax',
                                'Education',
                                'Compensation',
                                'Insurance',
                                'Rent',
                                'Stock',
                                'Office Supplies',
                                'Advertising',
                                'Dues and Subscriptions',
                                'Employee Benefits',
                                'Repairs',
                                'Entertainment',
                                'Food',
                                'Gym',
                                'Furniture',
                                'Payroll',
                                'Travel Expenses',
                                'Others'
                              ].map((String type) {
                                return DropdownMenuItem(
                                  value: type,
                                  child: Text(
                                    type,
                                    style: const TextStyle(
                                      color: Colors.indigoAccent,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  selectedCategory = value;
                                });
                              },
                              dropdownColor: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 35.0),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: const Text(
                              'Amount',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(width: 30.0),
                          Expanded(
                            child: TextField(
                              style: const TextStyle(
                                color: Colors.indigoAccent,
                              ),
                              controller: amt,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              cursorColor: Colors.indigoAccent,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 35.0),
                      TextField(
                        controller: notes,
                        style: const TextStyle(color: Colors.indigoAccent),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        cursorColor: Colors.indigoAccent,
                        decoration: InputDecoration(
                          hintText: 'Enter Note...',
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.8),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      ElevatedButton(
                        onPressed: save,
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.transparent),
                          side: WidgetStateProperty.all(const BorderSide(color: Colors.grey)),
                        ),
                        child: const Text(
                          '   Add Expense   ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
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
}
