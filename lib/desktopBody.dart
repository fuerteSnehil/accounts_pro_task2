import 'package:accounts_pro_task2/myRow.dart';
import 'package:accounts_pro_task2/table.dart';
import 'package:accounts_pro_task2/widgets/cstmTextField.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DesktopBody extends StatefulWidget {
  const DesktopBody({super.key});

  @override
  State<DesktopBody> createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
  String selectedOption = 'Cr';
  FocusNode _focusNode = FocusNode();
  Color backgroundColor = Colors.transparent;
  Color textColor = Colors.black; // Initial text color

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  DateTime? _selectedDate;
// Define a TextEditingController
  TextEditingController _datecontroller = TextEditingController();
// ...

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _datecontroller.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
        print(_datecontroller.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .06,
              width: MediaQuery.of(context).size.width * 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Color.fromARGB(255, 161, 78, 53),
                      child: Center(
                          child: Text(
                        'Receipt',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      color: Colors.green[300],
                      child: Center(
                          child: Text(
                        'Voucher Entry',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              height: MediaQuery.of(context).size.height * .8,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(children: [
                Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: CustomTextFieldWidget(
                            labelText: 'No ',
                            textFieldHeight: 30,
                            textFieldWidth:
                                MediaQuery.of(context).size.width * .1)),
                    Expanded(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'Date:',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width * 0.11,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _datecontroller,
                                      // focusNode: _focusNode,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: Colors.black,
                                      ),
                                      cursorHeight: 21,
                                      cursorColor: Colors.white,
                                      cursorWidth: 1,
                                      textAlignVertical: TextAlignVertical.top,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: backgroundColor,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.calendar_month),
                                    onPressed: () {
                                      _selectDate(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Expanded(flex: 1, child: Text('wed'))
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 45,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Row(children: [
                    const Text('Dr/Cr',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.deepPurple)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .01,
                    ),
                    const Expanded(
                      child: Text('Ledger Name',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.deepPurple)),
                    ),
                    const Expanded(
                      child: Text('Remark',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.deepPurple)),
                    ),
                    const Expanded(
                      child: Text('Debit',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.deepPurple)),
                    ),
                    const Expanded(
                      child: Text('Credit',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.deepPurple)),
                    ),
                  ]),
                ),
                Container(
                  child: MyRow(
                      // flexValues: [2, 2, 2, 2],
                      ),
                )
              ]),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.width * 1,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    CustomTextFieldWidget(
                        labelText: 'Narration',
                        textFieldHeight: 50,
                        textFieldWidth: MediaQuery.of(context).size.width * .4),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        width: MediaQuery.of(context).size.width * .31,
                        height: MediaQuery.of(context).size.height * .3,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Column(
                          children: [
                            const Text('Ledger Information',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.deepPurple)),
                            Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width * .31,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(color: Colors.black),
                                      bottom: BorderSide(color: Colors.black))),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          'Limit',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.deepPurple),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Color.fromARGB(255, 161, 78, 53),
                                      child: Center(
                                        child: Text(
                                          '50,000.00',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          'Bal',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.deepPurple),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Color.fromARGB(255, 161, 78, 53),
                                      child: Center(
                                        child: Text(
                                          '983.00 Dr',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Gurugram',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .01,
                    ),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          helperText: '[0] Dr',
                          helperStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.deepPurple)),
                    )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .01,
                    ),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          helperText: '[0] Cr',
                          helperStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple)),
                    )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .01,
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width * .1, 25),
                                shape: BeveledRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black, width: .3)),
                                backgroundColor: Colors.yellow.shade100),
                            onPressed: () {},
                            child: Text(
                              'Save [F4]',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .002, 
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width * .1, 25),
                                shape: BeveledRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black, width: .3)),
                                backgroundColor: Colors.yellow.shade100),
                            onPressed: () {},
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .002,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width * .1, 25),
                                shape: BeveledRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black, width: .3)),
                                backgroundColor: Colors.yellow.shade100),
                            onPressed: () {},
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
