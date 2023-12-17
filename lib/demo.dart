import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Custom Table'),
//         ),
//         body: CustomTable(),
//       ),
//     );
//   }
// }

class CustomTable extends StatefulWidget {
  @override
  _CustomTableState createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
List<List<String>> tableData = List.generate(5, (index) => List.filled(3, ''));

// Set default values for dropdown cells
// for ({int i= 0}; i < tableData.length; i++) {
//   tableData[i][0] = 'Option 1';
// }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Table Rows
          for (int i = 0; i < tableData.length; i++)
            Row(
              children: [
                // Dropdown in the first cell
                _buildCell(
                  width: 100,
                  child: DropdownButton<String>(
                    value: tableData[i][0],
                    onChanged: (newValue) {
                      setState(() {
                        tableData[i][0] = newValue!;
                      });
                    },
                    items: ['Option 1', 'Option 2']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                // Input fields in other cells
                for (int j = 1; j < tableData[i].length; j++)
                  _buildCell(
                    width: j == 1 ? 150 : 200,
                    child: TextFormField(
                      onChanged: (newValue) {
                        setState(() {
                          tableData[i][j] = newValue;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildCell({required double width, required Widget child}) {
    return Container(
      width: width,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      child: Center(child: child),
    );
  }
}
