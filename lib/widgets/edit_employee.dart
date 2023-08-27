import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditEmployee extends StatelessWidget {
  EditEmployee({Key? key, required this.data}) : super(key: key);

  final DocumentSnapshot data;

  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final emailController = TextEditingController();

  final addressController = TextEditingController();

  final phoneController = TextEditingController();

  final pinController = TextEditingController();

  final positionController = TextEditingController();

  final reviewController = TextEditingController();

  final _fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    firstNameController.text = data['name'].toString().split(" ")[0];
    lastNameController.text = data['name'].toString().split(" ")[1];
    emailController.text = data['email'];
    addressController.text = data['address'];
    phoneController.text = data['phone'];
    pinController.text = data['pincode'];
    reviewController.text = data['review'];
    positionController.text = data['position'];
    return AlertDialog(
      content: Container(
        height: 500,
        color: Colors.white,
        child: Column(
          children: [
            const Text('Add Employee'),
            const SizedBox(height: 15),
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
            TextField(
              controller: positionController,
              decoration: const InputDecoration(hintText: 'Position'),
            ),
            TextField(
              controller: reviewController,
              decoration: const InputDecoration(hintText: 'Review'),
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
              onPressed: () async {
                data.reference.update({
                  'name':
                      '${firstNameController.text} ${lastNameController.text}',
                  'email': emailController.text,
                  'address': addressController.text,
                  'position': positionController.text,
                  'review': reviewController.text,
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
