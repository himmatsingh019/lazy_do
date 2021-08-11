import 'package:flutter/material.dart';
import 'package:lazy_do/constants/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '', _password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorData.primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: SvgPicture.asset('assets/svg/logo.svg'),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorData.white_color,
              ),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                validator: (value) =>
                    value!.isEmpty ? 'Enter a valid Email' : null,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  contentPadding: EdgeInsets.only(left: 10),
                ),
                onChanged: (value) {
                  setState(
                    () {
                      _email = value.trim();
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorData.white_color,
              ),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                validator: (value) =>
                    value!.length < 6 ? 'Password must be 8 chars long' : null,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  hintText: 'Password',
                ),
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorData.white_color,
                ),
                height: 40,
                width: 90,
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New to LazyDo?',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    ' Click here',
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0.6,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
