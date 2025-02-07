import 'package:flutter/material.dart';

class Artists extends StatefulWidget {
  const Artists({super.key});

  @override
  State<Artists> createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121111),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Thêm chữ "Sort By"
                  Text(
                    'Sort By',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Tiêu đề "Recently added"
                  Row(
                    children: <Widget>[
                      SizedBox(width: 10),
                      Text(
                        'Recently added',
                        style: TextStyle(
                            color: Color(0xFF39C0D4),
                            fontWeight: FontWeight.w700,
                            fontSize: 20), // Phóng to Text
                      ),
                      Icon(
                        Icons.import_export,
                        color: Colors.blueGrey,
                        size: 28, // Phóng to Icon
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      playlistItem(
                          'assets/images/Artists1.png', 'Conan Gray', ''),
                      SizedBox(height: 30),
                      playlistItem(
                          'assets/images/Artists2.png', 'Chase Atlantic', ''),
                      SizedBox(height: 30),
                      playlistItem(
                          'assets/images/Artists3.png', 'beabadoobee', ''),
                      SizedBox(height: 30),
                      playlistItem(
                          'assets/images/Artists4.png', 'New Jeans', ''),
                      SizedBox(height: 30),
                      playlistItem('assets/images/Artists5.png', 'keshi', ''),
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

  Widget playlistItem(String imagePath, String title, String subtitle) {
    return Row(
      children: <Widget>[
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 22, // Phóng to Text
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 17, // Phóng to Text
                fontWeight: FontWeight.w700,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
