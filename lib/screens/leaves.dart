import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manager/widgets/add_leave.dart';
import 'package:manager/widgets/leave_tile.dart';
import 'package:table_calendar/table_calendar.dart';

class Leaves extends StatefulWidget {
  const Leaves({Key? key}) : super(key: key);

  @override
  State<Leaves> createState() => _LeavesState();
}

class _LeavesState extends State<Leaves> with WidgetsBindingObserver {
  var _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  var _calenderFormat = CalendarFormat.week;
  var docName = DateFormat('d-MM-y').format(DateTime.now());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> employeeStream;
  late DocumentReference leaveRef;
  late Stream<DocumentSnapshot> leaveData;
  late List leaveList;
  bool loaded = false;

  void getLeaveStream(String date) async {
    var leaveRef = _firestore.collection('leaves').doc(date);
    leaveData = leaveRef.snapshots();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      setState(() {
        getLeaveStream(docName);
      });
    }
  }

  @override
  void initState() {
    getLeaveStream(docName);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: Color.fromRGBO(58, 18, 45, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(15),
                      margin:
                          const EdgeInsets.only(bottom: 20, right: 20, top: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(
                        Icons.assignment_outlined,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Leaves',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        DateFormat('MMM, d').format(_selectedDay),
                        style: const TextStyle(
                            fontSize: 24,
                            color: Color.fromRGBO(58, 18, 45, 1),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        DateFormat('yyyy').format(_selectedDay),
                        style: const TextStyle(
                            fontSize: 24,
                            color: Color.fromRGBO(58, 18, 45, 1),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          TableCalendar(
            focusedDay: _focusedDay,
            onFormatChanged: (format) {
              setState(() {
                _calenderFormat = format;
              });
            },
            firstDay: DateTime.utc(2023, 5, 26),
            lastDay: DateTime.utc(2025, 10, 5),
            calendarFormat: _calenderFormat,
            currentDay: DateTime.now(),
            calendarStyle: CalendarStyle(
              selectedDecoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(58, 18, 45, 1),
              ),
              todayTextStyle: const TextStyle(color: Colors.blue),
              isTodayHighlighted: true,
              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.blue),
              ),
            ),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                docName = DateFormat('d-MM-y').format(selectedDay);
                getLeaveStream(docName);
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
            },
          ),
          StreamBuilder<DocumentSnapshot>(
            stream: leaveData,
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                default:
                  var data = snapshot.data;
                  if (!data!.exists) {
                    return const Text('No leave is scheduled today');
                  }
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!['arr'].length,
                      itemBuilder: (context, index) {
                        return LeaveTile(
                            employeeName:
                                snapshot.data!['arr'][index].toString());
                      },
                    ),
                  );
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(58, 18, 45, 1),
        onPressed: () async {
          String date = DateFormat('d-MM-y').format(_selectedDay);
          DocumentReference documentReference =
              _firestore.collection('leaves').doc(date);
          DocumentSnapshot snapshot = await documentReference.get();
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddLeave(
                  leaveDataSnapshot: snapshot,
                  date: date,
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
