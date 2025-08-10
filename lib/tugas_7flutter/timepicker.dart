import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePicker1 extends StatefulWidget {
  const TimePicker1({super.key});

  @override
  State<TimePicker1> createState() => _TimePicker1State();
}

class _TimePicker1State extends State<TimePicker1> {
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Reminder Time"),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Select reminder time"),
              onPressed: () async {
                final TimeOfDay? pickerDate = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickerDate != null) {
                  setState(() {});
                  selectedTime = pickerDate;
                }
              },
            ),
            SizedBox(height: 15),
            Text(
              selectedTime == null
                  ? "Set a time first"
                  : "Reminder set at: ${selectedTime!.format(context)}",
            ),
          ],
        ),
      ),
    );
  }
}
