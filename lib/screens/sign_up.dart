import 'package:flutter/material.dart';
import 'package:befit/standards.dart';
import 'package:befit/screens/bmi_calculator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:befit/screens/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String username = '';
  String password = '';
  String email = '';
  bool terms = false;

  TextEditingController textareaDOB = TextEditingController();
  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1980),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
    }
  }

  @override
  void initState() {
    textareaDOB.text = 'Date of Birth';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Hey there
    // Welcome back
    // Username field
    // Email field
    // DOB field
    // Password field
    // Terms and conditions
    // Register button
    return Scaffold(
      appBar: null,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(Standards.bounds["margin"]!),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Hey there',
                style: Standards.fontStyles["subtitle"],
                textAlign: TextAlign.center,
              ),
              Text(
                'Create an Account',
                style: Standards.fontStyles["main"],
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.only(top: Standards.bounds["margin"]!),
                child: TextField(
                  // Icon
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: Standards.fontStyles["subtitle"],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          Standards.bounds["borderRadius"]!),
                    ),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: Standards.bounds["margin"]!),
                child: TextField(
                  // Icon
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: Standards.fontStyles["subtitle"],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          Standards.bounds["borderRadius"]!),
                    ),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: Standards.bounds["margin"]!),
                child: TextField(
                  controller: textareaDOB,
                  decoration: InputDecoration(
                    hintText: 'Date of Birth',
                    hintStyle: Standards.fontStyles["subtitle"],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          Standards.bounds["borderRadius"]!),
                    ),
                    prefixIcon: const Icon(
                      Icons.date_range,
                      color: Colors.grey,
                    ),
                  ),
                  readOnly: true,
                  onTap: () {
                    _selectDate(context);
                    textareaDOB.text =
                        '${currentDate.day}/${currentDate.month}/${currentDate.year}';
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: Standards.bounds["margin"]!),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: Standards.fontStyles["subtitle"],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          Standards.bounds["borderRadius"]!),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: Standards.bounds["margin"]!),
                child: CheckboxListTile(
                  title: Text(
                    'I agree to the Terms and Conditions',
                    style: Standards.fontStyles["subtitle"],
                  ),
                  value: terms,
                  onChanged: (value) {
                    setState(() {
                      terms = value!;
                    });
                  },
                ),
              ),
              Expanded(child: Container()),
              Container(
                margin: EdgeInsets.only(top: Standards.bounds["margin"]!),
                // Rounded button
                child: ElevatedButton(
                  // Rounded button
                  style: ElevatedButton.styleFrom(
                    primary: Standards.colors["primaryColorDark"],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          Standards.bounds["borderRadius"]!),
                    ),
                  ),
                  // Text with icon
                  child: Text(
                    'Register',
                    style: Standards.fontStyles["mainButtonWhite"],
                  ),

                  onPressed: () {
                    setState(
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BMI(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              // Divider with text
              Container(
                  margin: EdgeInsets.only(top: Standards.bounds["margin"]!),
                  child: Row(children: const <Widget>[
                    Expanded(child: Divider()),
                    Text('Or'),
                    Expanded(child: Divider()),
                  ])),
              // Facebook and Google Icon button
              Container(
                margin: EdgeInsets.only(top: Standards.bounds["margin"]!),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.facebookSquare,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        // TODO: implement facebook login
                        print('Register using Facebook Button Pressed');
                      },
                    ),
                    IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.googlePlusSquare,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        // TODO: implement google login
                        print('Register using Google Login Button Pressed');
                      },
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: Standards.fontStyles["subtitle"],
                  children: [
                    TextSpan(
                      text: 'Login',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                        },
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
