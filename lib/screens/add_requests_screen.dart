import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/colors.dart';
import '../widgets/input_fields.dart';
import '../widgets/drop_down_widget.dart';
import '../resources/utilmethods.dart';

class AddRequestScreen extends StatefulWidget {
  const AddRequestScreen({Key? key}) : super(key: key);

  @override
  State<AddRequestScreen> createState() => _AddRequestScreenState();
}

class _AddRequestScreenState extends State<AddRequestScreen> {
  TextEditingController nameController = TextEditingController();

  final List<String> bloodValues = [
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-"
  ];

  final List<String> genderValues = ["Male", "Female", "Others"];

  final List<String> urgencyValues = ["Very Urgent", "Urgent", "Normal"];

  String DOB = DateFormat("dd-MM-yyyy").format(DateTime.now());

  String? bloodType = "A+";
  String? gender = "Male";
  String urgency = "Normal";
  String? name;
  int age = 0;

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (picked != null) {
      setState(() {
        DOB = DateFormat("dd-MM-yyyy").format(picked);
        final _formatter = DateFormat("dd-MM-yyyy");
        age = ageCalculator(_formatter.parse(DOB));
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
  }

  void onBloodTypeSelect(Object? selectedvalue) {
    setState(() {
      bloodType = selectedvalue.toString();
    });
  }

  void onGenderTypeSelect(Object? selectedValue) {
    setState(() {
      gender = selectedValue.toString();
    });
  }

  void onUrgencyTypeSelect(Object? selectedValue) {
    setState(() {
      urgency = selectedValue.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextInput(
                inputController: nameController,
                fieldName: "Patient",
                fieldType: TextInputType.name),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DropDownWidget(
                    itemsList: bloodValues
                        .map((String value) =>
                            DropdownMenuItem(value: value, child: Text(value)))
                        .toList(),
                    onSelect: onBloodTypeSelect,
                    selectValue: bloodType),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    _selectDate(context);
                  },
                  icon: const Icon(Icons.arrow_downward_outlined),
                  label: Text(DOB),
                ),
                const SizedBox(
                  width: 5,
                ),
                DropDownWidget(
                    itemsList: genderValues
                        .map((String value) =>
                            DropdownMenuItem(value: value, child: Text(value)))
                        .toList(),
                    onSelect: onGenderTypeSelect,
                    selectValue: gender),
              ],
            ),
            DropDownWidget(
                itemsList: urgencyValues
                    .map((String value) =>
                        DropdownMenuItem(value: value, child: Text(value)))
                    .toList(),
                onSelect: onUrgencyTypeSelect,
                selectValue: urgency),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                print(nameController.text);
                print(bloodType);
                print(gender);
                print(urgency);

                print(age);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text("Request",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18)),
            )
          ],
        ),
      ),
    );
  }
}
