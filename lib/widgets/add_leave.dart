import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddLeave extends StatefulWidget {
  final DocumentSnapshot leaveDataSnapshot;
  final String date;

  const AddLeave(
      {super.key, required this.leaveDataSnapshot, required this.date});

  @override
  State<AddLeave> createState() => _AddLeaveState();
}

class _AddLeaveState extends State<AddLeave> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<String>> fetchDocumentNames() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('employees').get();
    List<String> employeeNames = snapshot.docs.map((doc) => doc.id).toList();
    return employeeNames;
  }

  Future<void> fetchLeaveData() async {
    bool exists = false;
    DocumentReference leaveRef =
        _firestore.collection('leaves').doc(widget.date);
    DocumentSnapshot leaveData = await leaveRef.get();
    if (leaveData.exists && leaveData.data() != null) {
      var data = leaveData.data() as Map<String, dynamic>;
      var array = data['arr'] as List;
      for (int i = 0; i < array.length; i++) {
        if (array[i] == selectedDocument) {
          exists = true;
        }
      }
      if (!exists) {
        var data = leaveData.data() as Map<String, dynamic>;
        var arr = data['arr'] as List;
        arr.add(selectedDocument);
        leaveRef.set({'arr': arr});
      } else {
        await alertDialog();
      }
    } else {
      List arr = [selectedDocument];
      leaveRef.set({'arr': arr});
    }
  }

  Future alertDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 80,
            child: Column(
              children: [
                const Text('Employee is already on leave'),
                MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close, color: Colors.white),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  var selectedDocument = '';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchDocumentNames(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text("Snapshot has error");
        } else if (!snapshot.hasData) {
          return const Text('No data found.');
        } else {
          List<String>? employeeNames = snapshot.data;
          return AlertDialog(
            content: DropdownButton(
              hint: const Text('Select a employee'),
              onChanged: (value) {
                setState(() {
                  selectedDocument = value!;
                });
                fetchLeaveData();
                Navigator.pop(context);
              },
              items: employeeNames?.map((String name) {
                return DropdownMenuItem<String>(
                  value: name,
                  child: Text(name),
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }
}
