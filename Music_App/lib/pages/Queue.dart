import 'package:flutter/material.dart';
import 'package:music_app/pages/Equalizer.dart';
import 'package:music_app/pages/Playlist.dart';

class QueueScreen extends StatefulWidget {
  @override
  _QueueScreenState createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueueScreen> {
  List<bool> _selectedItems = List<bool>.filled(9, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disables the back button
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PLAYING FROM PLAYLIST:',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Lofi Loft',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.cyan,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlaylistScreen()),
                        );
                      },
                      child: Icon(Icons.arrow_drop_down_outlined,
                          color: Colors.white54),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'now playing :',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/song1_image.png',
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'grainy days',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'moody.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'next in queue :',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedItems = List<bool>.filled(9, false);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.cyan, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'CLEAR QUEUE',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.cyan,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Expanded(
                  child: ListView(
                    children: [
                      _buildQueueItem(0, 'Beguille', 'NIKI'),
                      _buildQueueItem(1, 'Stardust', 'Nyx'),
                      _buildQueueItem(2, 'Forever', 'moody.'),
                      SizedBox(height: 30),
                      Text(
                        'next in \'Lofi Loft\' :',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      _buildQueueItem(3, 'Coffee', 'Kainbeats'),
                      _buildQueueItem(4, 'raindrops', 'rainyyxx'),
                      _buildQueueItem(5, 'Tokyo', 'SmYang'),
                      _buildQueueItem(6, 'Lullaby', 'iamfinenow'),
                      _buildQueueItem(7, 'Hazel Eyes', 'moody.'),
                      _buildQueueItem(8, 'Sleepy', 'neononi'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Bottom transparent gradient section
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.0),
                  ],
                  stops: [0.0, 0.6],
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // Remove selected items
                        _selectedItems = List<bool>.filled(9, false);
                      });
                    },
                    child: Text(
                      'REMOVE',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Add selected items to queue
                      // Implement your logic here
                    },
                    child: Text(
                      'ADD TO QUEUE',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQueueItem(int index, String title, String artist) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItems[index] = !_selectedItems[index];
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(
              _selectedItems[index]
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: _selectedItems[index] ? Colors.cyan : Colors.white70,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    artist,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EqualizerScreen(),
                  ),
                ); // Chuyển đến trang QueueScreen
              },
            ), // Changed to three-bar icon
          ],
        ),
      ),
    );
  }
}
