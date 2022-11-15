import 'package:flutter/material.dart';
import 'package:befit/standards.dart';
import 'package:befit/screens/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    // Hey there
    // Welcome back
    // Username field
    // Password field
    // Forgot your password?
    // Login button
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
                'Welcome back',
                style: Standards.fontStyles["main"],
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.only(top: Standards.bounds["margin"]!),
                child: TextField(
                  // Icon
                  decoration: InputDecoration(
                    hintText: 'Username or Email',
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
              // Forgot password
              Container(
                margin: EdgeInsets.only(top: Standards.bounds["margin"]!),
                child: TextButton(
                  onPressed: () {
                    // TODO: implement forgot password
                    print("Forgot Password Button Pressed {Login}");
                  },
                  child: Text(
                    'Forgot your password?',
                    style: Standards.fontStyles["subtitle"],
                  ),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.login_rounded,
                        color: Standards.colors["whiteColor"],
                      ),
                      VerticalDivider(
                        color: Standards.colors["whiteColor"],
                        width: 10,
                      ),
                      Text(
                        'Login',
                        style: Standards.fontStyles["mainButtonWhite"],
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(
                      () {
                        // Check if Login Credentials are Correct
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
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
                        print('Facebook Login Button Pressed');
                      },
                    ),
                    IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.googlePlusSquare,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        // TODO: implement google login
                        print('Google Login Button Pressed');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
