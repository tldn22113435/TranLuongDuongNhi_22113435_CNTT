import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121111),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              // Row to align the back button to the start
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Browse Library',
                            hintStyle: TextStyle(color: Colors.white54),
                            border: InputBorder.none,
                          ),
                          onSubmitted: (value) {
                            // Handle search functionality
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.search, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30), // Space between search bar and the next row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.import_export,
                    color: Colors.blueGrey,
                    size: 28, // Phóng to Icon
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Recently played',
                    style: TextStyle(
                        color: Color(0xFF39C0D4),
                        fontWeight: FontWeight.w700,
                        fontSize: 20), // Phóng to Text
                  )
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
                      playlistItem('assets/images/playlist2.png', 'DAWN FM',
                          'The Weekend',
                          isSquare: true),
                      SizedBox(height: 30),
                      playlistItem('assets/images/ps6.png', 'Water Fountain',
                          'alec benjamin',
                          isSquare: true),
                      SizedBox(height: 30),
                      playlistItem('assets/images/playlist4.png', 'Wiped Out!',
                          'The Neighbourhood',
                          isSquare: true),
                      SizedBox(height: 30),
                      playlistItem('assets/images/ps3.png', 'Baking a Mystery',
                          'Updated Aug 21• Stephanie',
                          isSquare: true),
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

  // Modified playlistItem to accept isSquare parameter
  Widget playlistItem(String imagePath, String title, String subtitle,
      {bool isSquare = false}) {
    return Row(
      children: <Widget>[
        Container(
          width: 90, // Kích thước của hình ảnh
          height: 90,
          decoration: BoxDecoration(
            shape: isSquare
                ? BoxShape.rectangle
                : BoxShape.circle, // Thay đổi hình dạng
            borderRadius: isSquare
                ? BorderRadius.circular(12.0)
                : null, // Bo góc nếu là hình vuông
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 20), // Tăng khoảng cách giữa các cột
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
