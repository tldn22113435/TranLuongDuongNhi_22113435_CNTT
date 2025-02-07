import 'package:flutter/material.dart';
import 'package:music_app/pages/Albums.dart';
import 'package:music_app/pages/Artists.dart';
import 'package:music_app/pages/Folders.dart';
import 'package:music_app/pages/Playlists.dart';
import 'package:music_app/pages/Podcasts_Shows.dart';
import 'package:music_app/pages/Search.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  int selectedIndex = -1;

  final List<Widget> pages = [
    Folders(),
    Playlists(),
    Artists(),
    Albums(),
    Podcasts_Shows(),
    Center(child: Text('Artists Page', style: TextStyle(color: Colors.white))),
    Center(child: Text('Albums Page', style: TextStyle(color: Colors.white))),
    Center(
        child: Text('Podcasts & Shows Page',
            style: TextStyle(color: Colors.white))),
  ];

  Widget buildTextButton(int index, String label) {
    bool isSelected = selectedIndex == index;
    return TextButton(
      onPressed: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Colors.white,
            letterSpacing: 0.8),
      ),
      style: TextButton.styleFrom(
          side: BorderSide(color: Colors.white, width: 1.5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: isSelected ? Color(0xFF39C0D4) : Color(0xFF121111)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121111),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              // Phần tiêu đề và nút tìm kiếm
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/logo1.png'),
                    width: 70,
                    height: 70,
                  ),
                  SizedBox(width: 15),
                  Text(
                    'Your Library',
                    style: TextStyle(
                      color: Color(0xFF06A0B5),
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Search()),
                      );
                    },
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Ẩn dòng "Recently played" khi chọn mục khác
              if (selectedIndex == -1) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.import_export,
                      color: Colors.blueGrey,
                      size: 28,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Recently played',
                      style: TextStyle(
                        color: Color(0xFF39C0D4),
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
              ],
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildTextButton(0, 'Folders'),
                    SizedBox(width: 25),
                    buildTextButton(1, 'Playlists'),
                    SizedBox(width: 25),
                    buildTextButton(2, 'Artists'),
                    SizedBox(width: 25),
                    buildTextButton(3, 'Albums'),
                    SizedBox(width: 25),
                    buildTextButton(4, 'Podcasts & Shows'),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Expanded(
                child: selectedIndex == -1
                    ? SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/library1.png'),
                                  radius: 35,
                                ),
                                SizedBox(width: 20),
                                Text(
                                  'Conan Gray',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 25),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/library2.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '3:00am vibes',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '18 songs',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 25),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/library3.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Wiped Out!',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'The Neighbourhood',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 25),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/library4.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Neo Pop',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '12 songs',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 25),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/playlist5.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Funky Beats',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '24 songs',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : pages[selectedIndex],
              )
            ],
          ),
        ),
      ),
    );
  }
}
