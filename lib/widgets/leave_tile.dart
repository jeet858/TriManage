import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LeaveTile extends StatefulWidget {
  final String employeeName;

  const LeaveTile({super.key, required this.employeeName});

  @override
  State<LeaveTile> createState() => _LeaveTileState();
}

class _LeaveTileState extends State<LeaveTile> with WidgetsBindingObserver {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // void getData() async {
  //   var docRef = _firestore.collection('employees').doc(widget.employeeName);
  //   docData = await docRef.get();
  //   print(docData.data());
  // }
  //
  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   super.didChangeAppLifecycleState(state);
  //   if (state == AppLifecycleState.resumed) {
  //     setState(() {
  //       getData();
  //     });
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firestore.collection('employees').doc(widget.employeeName).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Loading indicator while fetching data.
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return const Text('No data found.');
        } else {
          var docRef = snapshot.data?.reference;
          Map<String, dynamic>? docData =
              snapshot.data!.data() as Map<String, dynamic>;
          return Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width * 0.8,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(58, 18, 45, 1),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: ResizeImage(NetworkImage(docData['image']),
                      width: 30, height: 30),
                  radius: 30,
                ),
                Text(
                  "Id: ${docRef?.id}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
