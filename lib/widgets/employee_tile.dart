import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manager/screens/employee.dart';
import 'package:manager/widgets/edit_employee.dart';

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
    DocumentReference documentReference = data.reference;
    documentReference.delete();
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
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color.fromRGBO(248, 156, 46, 1),
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 1,
              color: Color.fromRGBO(194, 194, 194, 100),
            )
          ],
        ),
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.025,
          bottom: MediaQuery.of(context).size.width * 0.025,
        ),
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
                    style: const TextStyle(
                        color: Color.fromRGBO(248, 156, 46, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
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
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return EditEmployee(data: data);
                          });
                    },
                    icon: const Icon(
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
