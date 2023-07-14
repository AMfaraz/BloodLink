import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  final List<DropdownMenuItem<Object>> itemsList;
  final void Function(Object?) onSelect;
  final dynamic selectValue;

  const DropDownWidget(
      {Key? key,
      required this.itemsList,
      required this.onSelect,
      required this.selectValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButton(
        iconSize: 30,
        style: const TextStyle(fontSize: 20, color: Colors.black),
        items: itemsList,
        onChanged: onSelect,
        value: selectValue,
      ),
    );
  }
}
