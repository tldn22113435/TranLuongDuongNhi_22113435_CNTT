import 'package:flutter/material.dart';
import 'package:music_app/pages/Welcome.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Stack(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/musium.png'),
                  height: double.infinity,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 1,
                  right: 20.0,
                  left: 20.0,
                  child: Image(
                    image: AssetImage('assets/images/luna.png'),
                    height: 200,
                    width: 150,
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
