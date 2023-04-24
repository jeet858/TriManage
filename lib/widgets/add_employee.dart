import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddEmployee extends StatelessWidget {
  AddEmployee({Key? key}) : super(key: key);

  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final emailController = TextEditingController();

  final addressController = TextEditingController();

  final phoneController = TextEditingController();

  final pinController = TextEditingController();

  final idController = TextEditingController();

  final _fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 350,
        color: Colors.white,
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: const InputDecoration(hintText: 'Employee id'),
            ),
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(hintText: 'First Name'),
            ),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(hintText: 'Last Name'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(hintText: 'Address'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      hintText: 'Phone no.',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black12, style: BorderStyle.solid),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: TextField(
                    controller: pinController,
                    decoration: const InputDecoration(
                      hintText: 'Pin Code',
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _fireStore.collection('employees').add({
                  'id': idController.text,
                  'name':
                      '${firstNameController.text} ${lastNameController.text}',
                  'email': emailController.text,
                  'address': addressController.text,
                  'pincode': pinController.text,
                  'phone': phoneController.text,
                  'image':
                      'https://www.tu-ilmenau.de/unionline/fileadmin/_processed_/0/0/csm_Person_Yury_Prof_Foto_AnLI_Footgrafie__2_.JPG_94f12fbf25.jpg'
                });
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
