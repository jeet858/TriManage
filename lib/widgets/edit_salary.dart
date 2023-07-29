import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditSalary extends StatelessWidget {
  final DocumentSnapshot data;
  EditSalary({Key? key, required this.data}) : super(key: key);

  final salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    salaryController.text = data['salary'].toString();
    return AlertDialog(
      content: Container(
        height: 200,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text('Edit Salary'),
                const SizedBox(height: 15),
                TextField(
                  controller: salaryController,
                  decoration: const InputDecoration(hintText: 'Salary'),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                data.reference.update({'salary': salaryController.text});
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
