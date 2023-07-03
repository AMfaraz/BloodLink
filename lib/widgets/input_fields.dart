import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController inputController;
  final String fieldName;
  final bool isPass;
  final TextInputType fieldType;

  const TextInput(
      {Key? key,
      required this.inputController,
      required this.fieldName,
      this.isPass = false,
      required this.fieldType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const border=OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.5,color: Colors.black,
        )
    );

    return TextField(
      controller: inputController,
      decoration: InputDecoration(
        hintText: fieldName,
        labelText: fieldName,
        labelStyle: const TextStyle(fontWeight: FontWeight.w300,color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
        border: border,
      ),
      obscureText: isPass,
      keyboardType: fieldType,
    );
  }
}
