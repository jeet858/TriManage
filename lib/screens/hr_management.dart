import 'package:flutter/material.dart';
import 'package:manager/screens/all_applications.dart';
import 'package:manager/screens/employee_list.dart';
import 'package:manager/screens/faqs.dart';
import 'package:manager/screens/leaves.dart';
import 'package:manager/screens/recruitments.dart';
import 'package:manager/screens/salary_list.dart';
import 'package:manager/widgets/service_tile.dart';

class HR extends StatelessWidget {
  const HR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  color: const Color.fromRGBO(248, 156, 46, 1),
                  // decoration: const BoxDecoration(
                  //   gradient: LinearGradient(
                  //     colors: <Color>[
                  //       Color.fromRGBO(58, 18, 45, 1),
                  //       Color.fromRGBO(58, 18, 45, 0.8),
                  //     ],
                  //     begin: Alignment.topCenter,
                  //     end: Alignment.bottomCenter,
                  //   ),
                  // ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.support_agent_sharp,
                        size: 100,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Smart',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          Text(
                            'HR',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 80,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.55),
                padding: const EdgeInsets.only(top: 50),
                height: MediaQuery.of(context).size.height * 0.55,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height *
                      //       .8, //HEADSUP this this line is responsible for bottom scrollview height
                      //   width: double.infinity,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            child: ServiceTile(
                              name: 'Employees',
                              icon: Icons.people_outline,
                              iconColor: const Color(0xfff9994b),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => EmployeeList()),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            child: ServiceTile(
                              name: 'All Applications',
                              icon: Icons.assignment_outlined,
                              iconColor: const Color.fromRGBO(58, 18, 45, 1),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => AllApplications()),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            child: ServiceTile(
                              name: 'Salaries',
                              icon: Icons.currency_rupee_outlined,
                              iconColor: const Color(0xfff9994b),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => SalaryList()),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            child: ServiceTile(
                              name: 'Recruitments',
                              icon: Icons.fact_check_outlined,
                              iconColor: const Color.fromRGBO(58, 18, 45, 1),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => Recruitments()),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            child: ServiceTile(
                              name: 'FAQs',
                              icon: Icons.question_answer_outlined,
                              iconColor: const Color(0xfff9994b),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => FAQ()),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            child: ServiceTile(
                              name: 'Leaves',
                              icon: Icons.leave_bags_at_home_outlined,
                              iconColor: const Color.fromRGBO(58, 18, 45, 1),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Leaves(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
