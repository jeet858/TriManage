import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manager/widgets/salary_tile.dart';
import '../widgets/add_employee.dart';

class SalaryList extends StatefulWidget {
  const SalaryList({Key? key}) : super(key: key);

  @override
  State<SalaryList> createState() => _SalaryListState();
}

class _SalaryListState extends State<SalaryList> with WidgetsBindingObserver {
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
                  Icons.currency_rupee_outlined,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Salaries',
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
                      return SalaryTile(
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
