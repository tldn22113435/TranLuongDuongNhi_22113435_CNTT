import 'package:flutter/material.dart';
import 'package:music_app/pages/Main_Screen.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  Color insideCircle = Color(0xFF121111);
  Color button = Color(0xFF1E1E1E);
  Color border = Color(0xFFDBE7E8);
  Color mycolor = Color(0xFF06A0B5);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isObscured = true;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Stack(
            children: <Widget>[
              Container(
                color: insideCircle,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 135,
                      width: 250,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/musium.png'),
                              fit: BoxFit.cover)),
                      margin: EdgeInsets.only(top: 10),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text("Login to your account",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 2.5),
                          textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email_outlined,
                                    color: Colors.white30),
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Colors.white),
                                filled: true,
                                fillColor: button,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: border, width: 0.2)),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: _passwordController,
                                obscureText: _isObscured,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock_clock_outlined,
                                        color: Colors.white30),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(color: Colors.white),
                                    filled: true,
                                    fillColor: button,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: border, width: 0.2),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isObscured
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.white30,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscured = !_isObscured;
                                        });
                                      },
                                    )),
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (bool? value) {
                              setState(() {
                                _rememberMe = value ?? false;
                              });
                            },
                            checkColor: mycolor,
                            activeColor: insideCircle,
                            side: BorderSide(color: mycolor, width: 2),
                          ),
                          Text(
                            'Remember Me',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainScreen()));
                          },
                          child: Text(
                            'Log in',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
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
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Forgot the password?',
                        style: TextStyle(
                          color: mycolor,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          letterSpacing: 2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'or continue with',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
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
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 0.1,
                              ),
                            ),
                            child: CircleAvatar(
                              minRadius: 15,
                              backgroundColor: button,
                              child: Image.asset(
                                'assets/images/google.png',
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 0.1,
                              ),
                            ),
                            child: CircleAvatar(
                              minRadius: 15,
                              backgroundColor: button,
                              child: Image.asset(
                                'assets/images/facebook.png',
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 0.1,
                              ),
                            ),
                            child: CircleAvatar(
                                minRadius: 15,
                                backgroundColor: button,
                                child: Icon(Icons.apple,
                                    size: 20, color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.w500,
                              )),
                          TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                  color: mycolor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
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
              Positioned(
                left: 5,
                top: 20,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
