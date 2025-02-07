import 'package:flutter/material.dart';

class SleepTimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 300),
          Center(
            child: Text(
              'Stop audio in',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 60), // Thêm khoảng cách dưới tiêu đề
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 50),
              children: [
                sleepTimerOption('End of Track'),
                sleepTimerOption('60 seconds'),
                sleepTimerOption('5 minutes'),
                sleepTimerOption('10 minutes'),
                sleepTimerOption('15 minutes'),
                sleepTimerOption('30 minutes'),
                sleepTimerOption('1 hour'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget sleepTimerOption(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
