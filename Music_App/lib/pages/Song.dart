import 'package:flutter/material.dart';
import 'package:music_app/pages/Menu.dart';
import 'package:music_app/pages/Playlist.dart';
import 'package:music_app/pages/Queue.dart';

class SongScreen extends StatelessWidget {
  final Color button = Color(0xFF8A9A9D);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF121111),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PLAYING FROM PLAYLIST:',
                            style: TextStyle(
                              fontSize:
                                  screenWidth * 0.03, // Responsive font size
                              color: Colors.white54,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Lofi Loft',
                                style: TextStyle(
                                  color: Color(0xFFA6F3FF),
                                  fontSize: screenWidth * 0.04,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_drop_down,
                                    color: Colors.white),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PlaylistScreen()),
                                  );
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert, size: screenWidth * 0.09),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MenuScreen()),
                          );
                        },
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                // Artwork
                Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  height: screenHeight * 0.45, // Responsive height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        screenWidth * 0.03), // Responsive border radius
                    image: DecorationImage(
                      image: AssetImage('assets/images/song1_image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Song Title and Artist
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'grainy days',
                        style: TextStyle(
                          fontSize: screenWidth * 0.08, // Responsive font size
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                          height: screenHeight * 0.01), // Responsive spacing
                      Row(
                        children: [
                          Text(
                            'moody.',
                            style: TextStyle(
                              fontSize:
                                  screenWidth * 0.05, // Responsive font size
                              color: button,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.share),
                            onPressed: () {},
                            color: Colors.white54,
                            iconSize:
                                screenWidth * 0.04, // Responsive icon size
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {},
                            color: Color(0xFF39C0D4),
                            iconSize:
                                screenWidth * 0.04, // Responsive icon size
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                // Progress Bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Slider(
                              value: 0.5,
                              onChanged: (value) {},
                              activeColor: Colors.white,
                              inactiveColor: Colors.white24,
                              max: 1,
                              min: 0,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.055),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('0:00', style: TextStyle(color: Colors.white)),
                            Text('3:10', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // Playback Controls
                // Playback Controls
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.005),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.shuffle),
                        onPressed: () {},
                        color: Colors.white54,
                        iconSize: screenWidth * 0.04, // Responsive icon size
                      ),
                      IconButton(
                        icon: Icon(Icons.skip_previous),
                        onPressed: () {},
                        color: Colors.white,
                        iconSize: screenWidth * 0.05, // Responsive icon size
                      ),
                      // Giảm khoảng cách giữa các biểu tượng
                      SizedBox(width: screenWidth * 0.01),
                      Container(
                        padding: EdgeInsets.all(
                            screenWidth * 0.01), // Responsive padding
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.cyan,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.play_arrow_outlined),
                          onPressed: () {},
                          iconSize: screenWidth * 0.08, // Responsive icon size
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      IconButton(
                        icon: Icon(Icons.skip_next),
                        onPressed: () {},
                        color: Colors.white,
                        iconSize: screenWidth * 0.05, // Responsive icon size
                      ),
                      IconButton(
                        icon: Icon(Icons.equalizer),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QueueScreen(),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {},
                        color: Colors.white,
                        iconSize: screenWidth * 0.04, // Responsive icon size
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.155), // Responsive padding
                  child: IconButton(
                    alignment: Alignment.centerRight,
                    icon: Icon(Icons.download),
                    onPressed: () {},
                    color: Colors.white,
                    iconSize: screenWidth * 0.05, // Responsive icon size
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: Text(
                    'LYRICS',
                    style: TextStyle(
                      fontSize: screenWidth * 0.036, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: Colors.white54,
                    ),
                  ),
                ),
                // Lyrics
                Container(
                  margin: EdgeInsets.all(screenWidth * 0.05),
                  padding:
                      EdgeInsets.all(screenWidth * 0.04), // Responsive padding
                  decoration: BoxDecoration(
                    color: Color(0xFF25BCC3),
                    borderRadius: BorderRadius.circular(
                        screenWidth * 0.05), // Responsive border radius
                  ),
                  child: Text(
                    "You never look at the sky \n"
                    "Cause you think it's too high\n"
                    "You never look at the stars \n"
                    "Cause you think they're too far \n"
                    "But they're showing the lights to the way back home \n"
                    "When you don't know where to go \n",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.045, // Responsive font size
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
