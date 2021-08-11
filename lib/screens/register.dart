import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lazy_do/constants/theme.dart';
import 'package:lazy_do/screens/verify.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email = '', _password = '', _firstName = '', _lastName = '';
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorData.primaryColor,
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SvgPicture.asset('assets/svg/logo.svg'),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorData.white_color,
              ),
              margin: EdgeInsets.only(left: 20, right: 20, top: 50),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'First Name',
                  contentPadding: EdgeInsets.only(left: 10),
                ),
                onChanged: (value) {
                  setState(
                    () {
                      _firstName = value.trim();
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorData.white_color,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Last Name',
                  contentPadding: EdgeInsets.only(left: 10),
                ),
                onChanged: (value) {
                  setState(
                    () {
                      _lastName = value.trim();
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
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                auth
                    .createUserWithEmailAndPassword(
                        email: _email, password: _password)
                    .then(
                      (value) => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => VerfiyScreen(email: _email),
                        ),
                      ),
                    );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorData.white_color,
                ),
                height: 40,
                width: 90,
                child: Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
