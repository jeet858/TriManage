import 'package:flutter/material.dart';
import 'package:manager/constants/text_decoration.dart';

class BottomApp extends StatelessWidget {
  const BottomApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromRGBO(76, 110, 71, 1),
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              minWidth: MediaQuery.of(context).size.width * 0.20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.home_filled,
                    color: Colors.white,
                  ),
                  Text(
                    'Home',
                    style: kTextStyle.copyWith(fontSize: 14),
                  )
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              minWidth: MediaQuery.of(context).size.width * 0.20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.calendar_today_rounded,
                    color: Colors.white,
                  ),
                  Text(
                    'Attendance',
                    style: kTextStyle.copyWith(fontSize: 14),
                  )
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              minWidth: MediaQuery.of(context).size.width * 0.20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.miscellaneous_services,
                    color: Colors.white,
                  ),
                  Text(
                    'Services',
                    style: kTextStyle.copyWith(fontSize: 14),
                  )
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              minWidth: MediaQuery.of(context).size.width * 0.20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  Text(
                    'Settings',
                    style: kTextStyle.copyWith(fontSize: 14),
                  )
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              minWidth: MediaQuery.of(context).size.width * 0.20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.door_back_door_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    'Sign Out',
                    style: kTextStyle.copyWith(fontSize: 14),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
