import 'package:flutter/material.dart';
import 'package:music_app/pages/Add_to_playlist.dart';
import 'package:music_app/pages/SleepTimerScreen.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Icon(Icons.favorite_border, color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddToPlaylistScreen(),
                ),
              );
            },
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Container(
            width: 240,
            height: 230,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage('assets/images/song1_image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'grainy days',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'moody.',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 40),
          Expanded(
            child: ListView(
              children: [
                menuItem(Icons.music_note, 'Add to playlist'),
                menuItem(Icons.add_to_photos, 'Add to queue'),
                menuItem(Icons.remove_circle_outline, 'Remove from playlist'),
                menuItem(Icons.local_offer_outlined, 'Modify tags'),
                menuItem(Icons.person_outline, 'View Artist'),
                menuItem(Icons.album, 'View Album'),
                menuItem(Icons.description_outlined, 'Show Credits'),
                menuItem(Icons.download_rounded, 'Download'),
                menuItem(Icons.share, 'Share'),
                menuItem(Icons.qr_code, 'Generate QR Code'),
                menuItem(Icons.bedtime_outlined, 'Sleep Timer', context),
                menuItem(Icons.visibility_off, 'Hide song'),
                menuItem(Icons.radio_button_checked, 'Go to Song Radio'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget menuItem(IconData icon, String title, [BuildContext? context]) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      onTap: () {
        if (title == 'Sleep Timer' && context != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    SleepTimerScreen()), // Điều hướng đến QueueScreen
          );
        } else {}
      },
    );
  }
}
