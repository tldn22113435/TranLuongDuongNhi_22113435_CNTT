import 'package:flutter/material.dart';

class Podcasts_Shows extends StatefulWidget {
  const Podcasts_Shows({super.key});

  @override
  State<Podcasts_Shows> createState() => _Podcasts_ShowsState();
}

class _Podcasts_ShowsState extends State<Podcasts_Shows> {
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
                    'Your Liked Podcasts',
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
                    'A - Z',
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
                      playlistItem('assets/images/ps1.png', 'Anything Goes',
                          'Updated Aug 31 • Emma Chamberlain'),
                      SizedBox(height: 30),
                      playlistItem('assets/images/ps2.png', 'Ask Me Another',
                          'Updated Aug 18 • NPR Studios'),
                      SizedBox(height: 30),
                      playlistItem('assets/images/ps3.png', 'Baking a Mystery',
                          'Updated Aug 21• Stephanie Soo'),
                      SizedBox(height: 30),
                      playlistItem('assets/images/ps4.png', 'Extra Dynamic',
                          'Updated Aug 10 • ur mom ashley'),
                      SizedBox(height: 30),
                      playlistItem('assets/images/ps5.png', 'Teenager Therapy',
                          'Updated Aug 21• iHeart Studios'),
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
          width: 90, // Adjust image size if necessary
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          // This will prevent overflow by allowing text to wrap
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
