import 'package:flutter/material.dart';
import 'package:music_app/pages/Main_Screen.dart';
import 'package:music_app/pages/Playlist.dart';

class FolderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MainScreen(initialIndex: 2), // Chuyển đến Library
              ),
            );
          },
          color: Colors.white,
        ),
        title: Text(
          'Moods',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sort By',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white54,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Recently played',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.cyan,
                          ),
                        ),
                        Icon(
                          Icons.import_export,
                          color: Colors.white54,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 40), // Adjusted height
                Expanded(
                  child: ListView(
                    children: [
                      addNewPlaylist(),
                      folderItem(context, 'current favorites', '20 songs',
                          'assets/images/song7_image.png'),
                      folderItem(context, '3:00am vibes', '18 songs',
                          'assets/images/song8_image.png'),
                      folderItem(context, 'Lofi Loft', '63 songs',
                          'assets/images/song_image.png'), // This item will navigate to PlaylistScreen
                      folderItem(context, 'rain on my window', '32 songs',
                          'assets/images/song9_image.png'),
                      folderItem(context, 'Anime OSTs', '20 songs',
                          'assets/images/song10_image.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
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
        currentIndex: 2, // Đặt `Library` là mục được chọn
        selectedItemColor: Color(0xFF06A0B5),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(initialIndex: index),
            ),
          );
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  Widget addNewPlaylist() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 12.0), // Adjusted vertical padding
      child: Row(
        children: [
          Container(
            height: 70, // Increased size
            width: 70, // Increased size
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.cyan,
            ),
            child: Icon(
              Icons.add,
              color: Colors.black,
              size: 36, // Increased icon size
            ),
          ),
          SizedBox(width: 20), // Increased width
          Text(
            'Add New Playlist',
            style: TextStyle(
              fontSize: 20, // Increased font size
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget folderItem(
      BuildContext context, String title, String subtitle, String imagePath) {
    return InkWell(
      onTap: () {
        if (title == 'Lofi Loft') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PlaylistScreen()),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.more_vert,
              color: Colors.white54,
            ),
          ],
        ),
      ),
    );
  }
}
