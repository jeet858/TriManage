import 'package:flutter/material.dart';
import 'package:manager/widgets/add_employee.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/employee_tile.dart';

class EmployeeList extends StatefulWidget {
  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList>
    with WidgetsBindingObserver {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> employeeStream;

  void getEmployeeStream() {
    employeeStream = _firestore.collection('employees').snapshots();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmployeeStream();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      setState(() {
        getEmployeeStream();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       EmployeeTile(
      //         name: 'Employee 1',
      //         imageLink:
      //             'https://cdn2.psychologytoday.com/assets/styles/manual_crop_1_91_1_1528x800/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=7lrLYx-B',
      //       )
      //     ],
      //   ),
      // ),
      body: Column(children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            color: Color.fromRGBO(248, 156, 46, 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(bottom: 20, right: 20, top: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(
                  Icons.people_outline,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Employees',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.fade,
                maxLines: 5,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: employeeStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                return Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      return EmployeeTile(
                        // name: document['name'],
                        // mageLink: document['image'],
                        // id: document['id'],
                        data: document,
                      );
                    }).toList(),
                  ),
                );
            }
          },
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddEmployee();
              });
        },
        backgroundColor: const Color.fromRGBO(248, 156, 46, 1),
        child: const Icon(Icons.add),
      ),
    );
  }
}
