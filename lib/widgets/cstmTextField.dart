import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String labelText;
  final double textFieldHeight;
  final double textFieldWidth;

  const CustomTextFieldWidget({
    Key? key,
    required this.labelText,
    required this.textFieldHeight,
    required this.textFieldWidth,
  }) : super(key: key);

  @override
  _CustomTextFieldWidgetState createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  FocusNode _focusNode = FocusNode();
  Color backgroundColor = Colors.transparent;
  Color textColor = Colors.black; // Initial text color

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(widget.labelText + ' :',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.deepPurple)),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            height: widget.textFieldHeight,
            width: widget.textFieldWidth,
            child: Focus(
              onFocusChange: (hasFocus) {
                setState(() {
                  backgroundColor =
                      hasFocus ? Colors.black : Colors.transparent;
                  textColor = hasFocus ? Colors.white : Colors.black;
                });
              },
              child: TextField(
                focusNode: _focusNode,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
                cursorHeight: 21,
                cursorColor: Colors.white,
                cursorWidth: 1,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  
                  filled: true,
                  fillColor: backgroundColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
