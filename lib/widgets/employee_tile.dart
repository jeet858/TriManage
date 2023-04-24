import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manager/screens/employee.dart';

class EmployeeTile extends StatelessWidget {
  // final String name;
  //
  // final String imageLink;
  //
  // final String id;

  final DocumentSnapshot data;
  const EmployeeTile({
    Key? key,
    // required this.id,
    // required this.name,
    // required this.imageLink,
    required this.data,
  }) : super(key: key);

  void deleteEmployee() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('employees');
    QuerySnapshot querySnapshot =
        await collectionReference.where('id', isEqualTo: data['id']).get();
    List<DocumentSnapshot> docs = querySnapshot.docs;
    for (var element in docs) {
      DocumentReference docRef = element.reference;
      docRef.delete();
    }
  }

  void getEmployeeDetail() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('employees');
    QuerySnapshot querySnapshot =
        await collectionReference.where('id', isEqualTo: data['id']).get();
    List<DocumentSnapshot> docs = querySnapshot.docs;
    docs.forEach((element) {
      print(element['id']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Employee(
                      data: data,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.05,
        ),
        color: Colors.lightBlueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      backgroundImage: ResizeImage(NetworkImage(data['image']),
                          width: 30, height: 30),
                      radius: 30,
                    ),
                  ),
                  Text(
                    data['name'],
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      deleteEmployee();
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  const IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
