import 'package:flutter/material.dart';
import 'package:theme_provider/Screens/intro_screen.dart';

import '../app_properties.dart';

class WelcomeBack extends StatefulWidget {
  const WelcomeBack({super.key});

  @override
  State<WelcomeBack> createState() => _WelcomeBackState();
}

class _WelcomeBackState extends State<WelcomeBack> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget welcomeBack = const Text(
      'Welcome Back Roberto',
      style: TextStyle(
          color: Colors.white,
          fontSize: 34.0,
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            )
          ]),
    );
    Widget subTitle = const Padding(
        padding: EdgeInsets.only(right: 56.0),
        child: Text(
          'Login to your account using\nregistered email',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            letterSpacing: 1.5,
          ),
        ));
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/splash.jpg'), fit: BoxFit.cover)),
          ),
          Container(
            decoration: const BoxDecoration(
              color: transparentYellow,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(
                  flex: 3,
                ),
                welcomeBack,
                SizedBox(
                  height: 20,
                ),
                subTitle,
                const Spacer(
                  flex: 2,
                ),
                loginForm(),
                const Spacer(
                  flex: 2,
                ),
                forgotPassword(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loginButton() => Positioned(
        left: MediaQuery.of(context).size.width / 4,
        bottom: 40,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IntroScreen(),
                ));
          },
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(236, 60, 3, 1),
                      Color.fromRGBO(234, 60, 3, 1),
                      Color.fromRGBO(216, 78, 16, 1),
                    ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    offset: Offset(0, 5),
                    blurRadius: 10.0,
                  )
                ],
                borderRadius: BorderRadius.circular(9.0)),
            child: const Center(
                child: Text("Log In",
                    style: TextStyle(
                        color: Color(0xfffefefe),
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0))),
          ),
        ),
      );
  Widget loginForm() => SizedBox(
        height: 240,
        child: Stack(
          children: <Widget>[
            Container(
              height: 160,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 32.0, right: 12.0),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextField(
                      controller: email,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextField(
                      controller: password,
                      style: const TextStyle(fontSize: 16.0),
                      obscureText: true,
                    ),
                  ),
                ],
              ),
            ),
            loginButton(),
          ],
        ),
      );

  Widget forgotPassword() => const Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Forgot your password? ",
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Color.fromRGBO(255, 255, 255, 0.6),
              ),
            ),
            InkWell(
              child: Text(
                "Reset Password",
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      );
}
