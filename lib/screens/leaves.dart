import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Leaves extends StatefulWidget {
  const Leaves({Key? key}) : super(key: key);

  @override
  State<Leaves> createState() => _LeavesState();
}

class _LeavesState extends State<Leaves> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
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
                        margin: const EdgeInsets.only(
                            bottom: 20, right: 20, top: 10),
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
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          DateFormat('MMM, d').format(DateTime.now()),
                          style: const TextStyle(
                              fontSize: 24,
                              color: Color.fromRGBO(58, 18, 45, 1),
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            // StreamBuilder(
            //   stream: getPdfUrls().asStream(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasError) {
            //       return Text('Error: ${snapshot.error}');
            //     }
            //     switch (snapshot.connectionState) {
            //       case ConnectionState.waiting:
            //         return SizedBox(
            //           height: MediaQuery.of(context).size.height,
            //           child: const Center(
            //             child: CircularProgressIndicator(),
            //           ),
            //         );
            //       default:
            //         final pdfUrls = snapshot.data!;
            //         return ListView(
            //           shrinkWrap: true,
            //           children: pdfUrls.map((element) {
            //             return RecruitmentFiles(
            //                 link: element['link'], name: element['name']);
            //           }).toList(),
            //         );
            //     }
            //   },
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(58, 18, 45, 1),
        onPressed: () async {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
