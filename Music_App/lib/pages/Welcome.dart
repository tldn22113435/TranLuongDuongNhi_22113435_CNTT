import 'package:flutter/material.dart';
import 'package:music_app/pages/Sign_in.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double iconSize = screenSize.width * 0.1;
    final double topPadding = screenSize.height * 0.01;
    final double containerHeight = screenSize.height * 0.36;
    final double buttonWidth = screenSize.width * 0.86;
    final double buttonHeight = screenSize.width * 0.13;
    final double horizontalPadding = screenSize.width * 0.15;
    Color myColor = Color(0xFF39C0D4);
    Color backgroundColor = Color(0xC53FE3FA);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  image: DecorationImage(
                    image: AssetImage('assets/images/girl1.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              // Circle 1 (Outermost, lightest color)
              Positioned(
                top: screenSize.height * 0.02,
                left: screenSize.width * 0.05,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.cyan.withOpacity(0.5), // Lightest shade
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              // Circle 2 (Middle, darker color)
              Positioned(
                top: screenSize.height * 0.07,
                right: screenSize.width * 0.1,
                child: Container(
                  width: 80,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.cyan.withOpacity(0.7), // Medium shade
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              // Circle 3 (Innermost, darkest color)
              Positioned(
                top: screenSize.height * 0.33,
                right: screenSize.width * 0.04,
                child: Container(
                  width: 100,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.cyan.withOpacity(0.9), // Darkest shade
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: containerHeight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: topPadding,
                          left: horizontalPadding,
                          right: horizontalPadding,
                        ),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(text: 'From the '),
                              TextSpan(
                                text: 'latest',
                                style: TextStyle(color: myColor),
                              ),
                              TextSpan(text: ' to the '),
                              TextSpan(
                                text: 'greatest',
                                style: TextStyle(color: myColor),
                              ),
                              TextSpan(
                                  text: ' hits, play your favorite tracks on '),
                              TextSpan(
                                text: 'musium',
                                style: TextStyle(color: myColor),
                              ),
                              TextSpan(text: ' now!'),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.remove, color: myColor, size: iconSize),
                          Icon(Icons.remove,
                              color: Colors.white, size: iconSize),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: myColor.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: Offset(0, 0),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()),
                              );
                            },
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: myColor,
                              minimumSize: Size(buttonWidth, buttonHeight),
                              padding: EdgeInsets.symmetric(horizontal: 30),
                            ),
                          ),
                        ),
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
