import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker1 extends StatefulWidget {
  const DatePicker1({super.key});

  @override
  State<DatePicker1> createState() => _DatePicker1State();
}

class _DatePicker1State extends State<DatePicker1> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Your date of birth"),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Select birt date"),
              onPressed: () async {
                final DateTime? pickerDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050),
                );
                if (pickerDate != null) {
                  setState(() {});
                  selectedDate = pickerDate;
                }
              },
            ),
            SizedBox(height: 15),
            Text(
              selectedDate == null
                  ? "Choose a date first"
                  : "Date of birth: ${DateFormat('EEEE, dd MMMM yyyy', "id_ID").format(selectedDate!)}",
            ),
          ],
        ),
      ),
    );
  }
}
