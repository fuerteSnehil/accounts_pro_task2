// import 'package:flutter/material.dart';

// class YourWidget extends StatefulWidget {
//   @override
//   _YourWidgetState createState() => _YourWidgetState();
// }

// class _YourWidgetState extends State<YourWidget> {
//   // Add your variables and controllers here

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // Your existing code
//           Row(
//             children: [
//               Expanded(
//                 flex: 3,
//                 child: CustomTextFieldWidget(
//                   labelText: 'No ',
//                   textFieldHeight: 30,
//                   textFieldWidth: MediaQuery.of(context).size.width * .1,
//                 ),
//               ),
//               Expanded(
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(4.0),
//                       child: Text(
//                         'Date:',
//                         style: TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.deepPurple,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(4.0),
//                       child: Container(
//                         height: 30,
//                         width: MediaQuery.of(context).size.width * 0.11,
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: TextField(
//                                 controller: _datecontroller,
//                                 // Add your text field properties
//                               ),
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.calendar_month),
//                               onPressed: () {
//                                 _selectDate(context);
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width * 1,
//             height: 45,
//             decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//             child: Row(
//               children: [
//                 const Text('Dr/Cr',
//                     style: TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.deepPurple)),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * .01,
//                 ),
//                 const Expanded(
//                   child: Text('Ledger Name',
//                       style: TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.deepPurple)),
//                 ),
//                 const Expanded(
//                   child: Text('Remark',
//                       style: TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.deepPurple)),
//                 ),
//                 const Expanded(
//                   child: Text('Debit',
//                       style: TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.deepPurple)),
//                 ),
//                 const Expanded(
//                   child: Text('Credit',
//                       style: TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.deepPurple)),
//                 ),
//               ],
//             ),
//           ),

//           // Add DataTable for the table with inputable cells
//           DataTable(
//             columns: [
//               DataColumn(
//                 label: Text('First Cell'),
//               ),
//               DataColumn(
//                 label: Text('Ledger Name'),
//               ),
//               DataColumn(
//                 label: Text('Remark'),
//               ),
//               DataColumn(
//                 label: Text('Debit'),
//               ),
//               DataColumn(
//                 label: Text('Credit'),
//               ),
//             ],
//             rows: [
//               DataRow(cells: [
//                 // First cell with dropdown
//                 DataCell(
//                   DropdownButton<String>(
//                     // Add your dropdown options
//                     items: ['Option 1', 'Option 2']
//                         .map((String value) => DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value),
//                             ))
//                         .toList(),
//                     onChanged: (String? value) {
//                       // Handle dropdown selection
//                     },
//                     // Add your dropdown value
//                     value: 'Option 1',
//                   ),
//                 ),
//                 // Add your other inputable cells
//                 DataCell(TextField()),
//                 DataCell(TextField()),
//                 DataCell(TextField()),
//                 DataCell(TextField()),
//               ]),
//               // Add more DataRow entries as needed
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // Add your functions here
// }
