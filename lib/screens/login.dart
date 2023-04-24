import 'package:flutter/material.dart';
import 'package:manager/widgets/popup_login_button.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PopupLoginButton(
              name: 'Login',
              color: Colors.amber,
              onSubmit: () {},
            ),
            PopupLoginButton(
              name: 'Register',
              color: Colors.cyan,
              onSubmit: () {},
            )
          ]),
    );
  }
}
