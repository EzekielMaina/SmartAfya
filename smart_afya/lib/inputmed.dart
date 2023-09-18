import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class AddMedicineInputForm extends StatefulWidget {
  const AddMedicineInputForm({Key? key}) : super(key: key);

  @override
  _AddMedicineInputFormState createState() => _AddMedicineInputFormState();
}

class _AddMedicineInputFormState extends State<AddMedicineInputForm> {
  final _formKey = GlobalKey<FormState>();
  int? _timesToTake;
  List<TimeOfDay> _selectedTimes = [];
  TimeOfDay? _reminderTime;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Medicine'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Times to take'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a number';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
              onSaved: (value) {
                _timesToTake = int.parse(value!);
              },
            ),
            SizedBox(height: 16),
            Text('Selected times: ${_selectedTimes.join(', ')}'),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _timesToTake ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Time ${index + 1}'),
                    trailing: TimePickerSpinner(
                      is24HourMode: false,
                      normalTextStyle: TextStyle(fontSize: 18),
                      highlightedTextStyle:
                          TextStyle(fontSize: 22, color: Colors.blue),
                      spacing: 50,
                      itemHeight: 40,
                      isForce2Digits: true,
                      onTimeChange: (time) {
                        setState(() {
                          _selectedTimes[index] = TimeOfDay.fromDateTime(time);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
                'Reminder time: ${_reminderTime?.format(context) ?? 'Not set'}'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  setState(() {
                    _selectedTimes = List.generate(
                        _timesToTake!, (_) => TimeOfDay(hour: 0, minute: 0));
                  });
                }
              },
              child: Text('Save'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final time = await showTimePicker(
                    context: context,
                    initialTime: _reminderTime ?? TimeOfDay.now());
                if (time != null) {
                  setState(() {
                    _reminderTime = time;
                  });
                }
              },
              child: Text('Select reminder time'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // TODO: Add medicine to database or state
            Navigator.of(context).pop();
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
