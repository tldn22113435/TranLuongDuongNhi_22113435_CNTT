import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_app/pages/Log_in.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  @override
  Widget build(BuildContext context) {
    Color insideCircle = Color(0xFF121111);
    Color button = Color(0xFF1E1E1E);
    Color borderbutton = Color(0xFFDBE7E8);
    Color mycolor = Color(0xFF06A0B5);

    // Get screen size
    final screenSize = MediaQuery.of(context).size;

    // Dynamic height and width based on screen size
    final double logoHeight = screenSize.height * 0.25;
    final double logoWidth = screenSize.width * 0.8;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: insideCircle,
        statusBarIconBrightness: Brightness.light));

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Container(
            color: insideCircle,
            child: Column(
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 10,
                        top: screenSize.height * 0.02, // Dynamic top position
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: screenSize.width * 0.08,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: 0),
                  height: logoHeight,
                  width: logoWidth,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/musium.png'),
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
                  child: Text("Let's get you in",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize:
                              screenSize.width * 0.11, // Dynamic font size
                          letterSpacing: 2.5),
                      textAlign: TextAlign.center),
                ),
                google(button, borderbutton, screenSize),
                facebook(button, borderbutton, screenSize),
                apple(button, borderbutton, screenSize),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.08,
                      vertical: screenSize.height * 0.01),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.08,
                            vertical: screenSize.height * 0.02),
                        child: Text(
                          'or',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  screenSize.width * 0.05), // Dynamic font size
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: mycolor.withOpacity(0.3),
                          spreadRadius: 4,
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LogIn()));
                      },
                      child: Text(
                        'Log in with a password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              screenSize.width * 0.04, // Dynamic font size
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mycolor,
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.02),
                  child: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                screenSize.width * 0.04, // Dynamic font size
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w500,
                          )),
                      TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                              color: mycolor,
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  screenSize.width * 0.04, // Dynamic font size
                              letterSpacing: 1.5,
                              shadows: [
                                Shadow(
                                    color: mycolor.withOpacity(0.6),
                                    offset: Offset(0, 0),
                                    blurRadius: 30)
                              ]))
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding facebook(Color button, Color borderbutton, Size screenSize) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.05,
          vertical: screenSize.height * 0.01),
      child: ElevatedButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/facebook.png',
                  width: screenSize.width * 0.06,
                  height: screenSize.width * 0.06),
              SizedBox(
                width: screenSize.width * 0.03,
              ),
              Text(
                'Continue With Facebook',
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 0.1,
                    fontSize: screenSize.width * 0.04, // Dynamic font size
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: button,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: borderbutton, width: 0.2)))),
    );
  }

  Padding apple(Color button, Color borderbutton, Size screenSize) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.05,
          vertical: screenSize.height * 0.01),
      child: ElevatedButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.apple,
                size: screenSize.width * 0.06,
                color: Colors.white,
              ),
              SizedBox(
                width: screenSize.width * 0.03,
              ),
              Text(
                'Continue With Apple',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenSize.width * 0.04, // Dynamic font size
                    letterSpacing: 0.1,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: button,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: borderbutton, width: 0.2)))),
    );
  }

  Padding google(Color button, Color borderbutton, Size screenSize) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.05,
          vertical: screenSize.height * 0.01),
      child: ElevatedButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/google.png',
                  width: screenSize.width * 0.06,
                  height: screenSize.width * 0.06),
              SizedBox(
                width: screenSize.width * 0.03,
              ),
              Text(
                'Continue With Google',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenSize.width * 0.04, // Dynamic font size
                    letterSpacing: 0.1,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: button,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: borderbutton, width: 0.2)))),
    );
  }
}
