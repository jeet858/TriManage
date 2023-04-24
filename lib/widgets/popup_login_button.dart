import 'package:flutter/material.dart';
import 'package:manager/constants/text_decoration.dart';
import 'package:manager/screens/home.dart';
import 'custom_button.dart';

class PopupLoginButton extends StatelessWidget {
  final String name;
  final Color color;
  final Function onSubmit;
  PopupLoginButton(
      {Key? key,
      required this.name,
      required this.color,
      required this.onSubmit})
      : super(key: key);
  //HeadsUp this widget requires a function called onSubmit which gets passed to the custom button's onPressed function in the popupwindow
  final _mailTextEditingController = TextEditingController();
  final _passTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                alignment: Alignment.center,
                title: Text(
                  name,
                  style: kLoginTextStyle,
                  textAlign: TextAlign.center,
                ),
                content: SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      TextField(
                        decoration: kLoginInputDecoration.copyWith(
                            hintText: 'Enter Email'),
                        controller: _mailTextEditingController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: kLoginInputDecoration.copyWith(
                            hintText: 'Enter Password'),
                        controller: _passTextEditingController,
                      ),
                      CustomButton(
                        name: name,
                        color: color,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()));
                          onSubmit;
                        },
                      )
                    ],
                  ),
                ),
              );
            });
      },
      child: Container(
        width: 200,
        height: 40,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: color),
        alignment: Alignment.center,
        child: Text(
          name,
          style: kTextStyle,
        ),
      ),
    );
  }
}
