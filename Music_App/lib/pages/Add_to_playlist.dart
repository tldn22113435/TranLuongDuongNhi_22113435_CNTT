import 'package:flutter/material.dart';
import 'package:music_app/pages/Create_new.dart';
import 'package:music_app/pages/Playlist.dart';
import 'package:music_app/pages/Song.dart';

class AddToPlaylistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SongScreen()),
            );
          },
        ),
        title: Text(
          'Add to Playlist',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 32.0,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateNewPlaylistScreen(),
                    ),
                  );
                },
                child: Text(
                  'New Playlist',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.white),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Find Playlist',
                        hintStyle: TextStyle(color: Colors.white54),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: ListView(
                children: [
                  playlistItem(
                    context,
                    'current favorites',
                    '20 songs',
                    'assets/images/song7_image.png',
                    onTap: () {},
                  ),
                  SizedBox(height: 16),
                  playlistItem(
                    context,
                    '3:00am vibes',
                    '18 songs',
                    'assets/images/song8_image.png',
                    onTap: () {
                      // Handle item tap if needed
                    },
                  ),
                  SizedBox(height: 16),
                  playlistItem(
                    context,
                    'Lofi Loft',
                    '63 songs',
                    'assets/images/song_image.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlaylistScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  playlistItem(
                    context,
                    'rain on my window',
                    '32 songs',
                    'assets/images/song9_image.png',
                    onTap: () {
                      // Handle item tap if needed
                    },
                  ),
                  SizedBox(height: 16),
                  playlistItem(
                    context,
                    'Anime OSTs',
                    '20 songs',
                    'assets/images/song10_image.png',
                    onTap: () {
                      // Handle item tap if needed
                    },
                  ),
                  SizedBox(height: 16),
                  playlistItem(
                    context,
                    '3:00am vibes',
                    '21 songs',
                    'assets/images/song11_image.png',
                    onTap: () {
                      // Handle item tap if needed
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget playlistItem(
      BuildContext context, String title, String subtitle, String imagePath,
      {Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
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
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.more_vert, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
