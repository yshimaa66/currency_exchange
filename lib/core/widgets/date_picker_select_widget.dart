import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerSelectWidget extends StatefulWidget {
  final Function(String)? onPressed;
  final String? label;

  const DatePickerSelectWidget(
      {required this.label, required this.onPressed, Key? key})
      : super(key: key);

  @override
  State<DatePickerSelectWidget> createState() => _DatePickerSelectWidgetState();
}

class _DatePickerSelectWidgetState extends State<DatePickerSelectWidget> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text(selectedDate != null
            ? DateFormat('yyyy-MM-dd').format(selectedDate!).toString()
            : widget.label!),
        onPressed: () {
          selectDate(context);
        },
      ),
    );
  }

  selectDate(BuildContext context) async {
    selectedDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate!,
        firstDate: DateTime(2020, 8),
        lastDate: DateTime(2101));

    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      widget.onPressed!(
          DateFormat('yyyy-MM-dd').format(selectedDate!).toString());
    }
  }
}
