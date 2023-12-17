import 'package:flutter/material.dart';

class MyRow extends StatefulWidget {
  const MyRow({Key? key}) : super(key: key);

  @override
  _MyRowState createState() => _MyRowState();
}

class _MyRowState extends State<MyRow> {
  String selectedOption = 'Cr';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          child: DropdownButton<String>(
            value: selectedOption,
            onChanged: (String? newValue) {
              setState(() {
                selectedOption = newValue!;
              });
            },
            items: <String>['Cr', 'Dr']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: EditableTable(
            selectedOption: selectedOption,
            onSelectedOptionChanged: (newValue) {
              setState(() {
                selectedOption = newValue;
              });
            },
          ),
        ),
      ],
    );
  }
}

class EditableTable extends StatefulWidget {
  final String selectedOption;
  final Function(String) onSelectedOptionChanged;

  const EditableTable({
    required this.selectedOption,
    required this.onSelectedOptionChanged,
  });

  @override
  _EditableTableState createState() => _EditableTableState();
}

class _EditableTableState extends State<EditableTable> {
  List<List<String>> tableData = [
    ['', '', '', ''] 
  ];

  bool shouldAddNewRow = false; // Track whether a new row should be added

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: List.generate(
        tableData.length,
        (rowIndex) => TableRow(
          children: List.generate(
            tableData[rowIndex].length,
            (cellIndex) => TableCell(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 7),
                        child: TextField(
                          cursorHeight: 21,
                          textAlignVertical: TextAlignVertical.top,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              tableData[rowIndex][cellIndex] = value;
                            });

                            if (cellIndex == tableData[rowIndex].length - 1 &&
                                value.isNotEmpty) {
                              shouldAddNewRow = true;
                              setState(() {
                                tableData.add(List.filled(
                                    tableData[rowIndex].length, ''));
                                shouldAddNewRow = false;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
