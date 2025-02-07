import 'package:flutter/material.dart';

class Playlists extends StatefulWidget {
  const Playlists({super.key});

  @override
  State<Playlists> createState() => _PlaylistsState();
}

class _PlaylistsState extends State<Playlists> {
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // IconButton đã bị loại bỏ khỏi đây
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFF39C0D4),
                    radius: 35, // Phóng to CircleAvatar
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border, color: Colors.black),
                      iconSize: 30, // Phóng to Icon
                    ),
                  ),
                  SizedBox(width: 20), // Tăng khoảng cách giữa các cột
                  Text(
                    'Your Liked Playlists',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20, // Phóng to Text
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 30), // Tăng khoảng cách giữa các dòng
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
                    'Recently added',
                    style: TextStyle(
                        color: Color(0xFF39C0D4),
                        fontWeight: FontWeight.w700,
                        fontSize: 20), // Phóng to Text
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30),
                      playlistItem('assets/images/playlist1.png', 'Superache',
                          'Conan Gray'),
                      SizedBox(height: 30),
                      playlistItem('assets/images/playlist2.png', 'DAWN FM',
                          'The Weekend'),
                      SizedBox(height: 30),
                      playlistItem('assets/images/playlist3.png', 'Planet Her',
                          'Doja Cat'),
                      SizedBox(height: 30),
                      playlistItem('assets/images/playlist4.png', 'Wiped Out!',
                          'The Neighbourhood'),
                      SizedBox(height: 30),
                      playlistItem('assets/images/playlist5.png', 'Bloom',
                          'Troye Sivan'),
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
          width: 90, // Phóng to hình ảnh
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
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
