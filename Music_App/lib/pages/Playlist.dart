import 'package:flutter/material.dart';
import 'package:music_app/pages/Folder.dart';
import 'package:music_app/pages/Main_Screen.dart';
import 'package:music_app/pages/Song.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  int _selectedIndex = 2; // Set to 2 to highlight the Library tab

  void _onBottomNavItemTapped(int index) {
    if (index != _selectedIndex) {
      // Check if the index is different from the current
      setState(() {
        _selectedIndex = index; // Update the selected index
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(initialIndex: index),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFF121111),
      appBar: AppBar(
        backgroundColor: Color(0xFF121111),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        FolderScreen())); // Return to previous screen
          },
          color: Colors.white,
        ),
        title: Text(
          'FROM "PLAYLISTS"',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFFFFFFFF),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // More actions
            },
            color: Colors.white,
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/song_image.png'), // Your image asset
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Lofi Loft',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),
                Text(
                  'soft, chill, dreamy, lo-fi beats',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white54,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      playlistItem(context, 'grainy days', 'moody.',
                          'assets/images/song1_image.png'),
                      playlistItem(context, 'Coffee', 'Kainbeats',
                          'assets/images/song2_image.png'),
                      playlistItem(context, 'raindrops', 'rainyxxx',
                          'assets/images/song3_image.png'),
                      playlistItem(context, 'Tokyo', 'SmYang',
                          'assets/images/song4_image.png'),
                      playlistItem(context, 'Lullaby', 'iamfinenow',
                          'assets/images/song5_image.png'),
                      playlistItem(context, 'Hazel Eyes', 'moody.',
                          'assets/images/song6_image.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.7), // Màu đen với độ mờ
              spreadRadius: 10, // Phạm vi lan tỏa của bóng
              blurRadius: 20, // Độ mờ của bóng
              offset: Offset(0, -3), // Vị trí đổ bóng (di chuyển lên trên)
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(1), // Đen đậm phía dưới
              Colors.black.withOpacity(0.0), // Trong suốt phía trên
            ],
          ),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_outlined),
              label: 'Library',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF06A0B5),
          unselectedItemColor: Colors.grey,
          onTap: _onBottomNavItemTapped,
          backgroundColor:
              Colors.transparent, // Làm trong suốt BottomNavigationBar
          elevation: 0,
        ),
      ),
    );
  }

  Widget playlistItem(
      BuildContext context, String title, String artist, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4),
              Text(
                artist,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SongScreen()));
            },
          )
        ],
      ),
    );
  }
}
