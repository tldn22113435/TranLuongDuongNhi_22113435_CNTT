import 'package:flutter/material.dart';

class CreateNewPlaylistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 120),
              Center(
                child: Text(
                  'New Playlist',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Give your playlist a title',
                  hintStyle: TextStyle(color: Colors.white54),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white54),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Privacy',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      0.35, // Tăng chiều rộng
                  child: DropdownButtonFormField<String>(
                    dropdownColor: Colors.black,
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 14), // Giảm kích thước font
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    value: 'Public',
                    items: [
                      DropdownMenuItem<String>(
                        value: 'Public',
                        child: Row(
                          children: [
                            Icon(Icons.public, color: Colors.white70),
                            SizedBox(width: 8),
                            Text('Public',
                                style: TextStyle(color: Colors.cyan)),
                          ],
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Private',
                        child: Row(
                          children: [
                            Icon(Icons.lock, color: Colors.white70),
                            SizedBox(width: 8),
                            Text('Private',
                                style: TextStyle(color: Colors.cyan)),
                          ],
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      // Handle privacy change
                    },
                  ),
                ),
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      shadowColor: Colors.white.withOpacity(0.3),
                      elevation: 10,
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 32.0),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      shadowColor: Colors.cyan.withOpacity(0.6),
                      elevation: 10,
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 32.0),
                    ),
                    onPressed: () {
                      // Handle creating new playlist
                    },
                    child: Text(
                      'Create',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
