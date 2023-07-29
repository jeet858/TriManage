import 'package:flutter/material.dart';
import 'package:manager/widgets/bottom_navigationbar.dart';

class Fleet extends StatelessWidget {
  const Fleet({Key? key}) : super(key: key);

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
                  color: const Color.fromRGBO(226, 74, 67, 1),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.36),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Truck.png',
                          width: 100,
                          height: 100,
                          scale: 0.5,
                        ),
                        const SizedBox(width: 20),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Smart',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                              Text(
                                'Fleet',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 60,
                                    fontWeight: FontWeight.w900),
                              ),
                            ]),
                      ]),
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
                  child: Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.7, //HEADSUP this this line is responsible for bottom scrollview height
                        width: double.infinity,
                      ),
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
