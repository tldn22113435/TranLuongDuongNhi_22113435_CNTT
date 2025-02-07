import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  int selectedIndex = 0;

  final List<Map<String, String>> tracks = [
    {
      'rank': '#1',
      'title': 'Swim',
      'artist': 'Chase Atlantic',
      'image': 'assets/images/stats1.png'
    },
    {
      'rank': '#2',
      'title': 'Time',
      'artist': 'NF',
      'image': 'assets/images/stats3.png'
    },
    {
      'rank': '#3',
      'title': 'Movies',
      'artist': 'Conan Gray',
      'image': 'assets/images/stats4.png'
    },
    {
      'rank': '#4',
      'title': 'lowkey',
      'artist': 'Niki',
      'image': 'assets/images/stats5.png'
    },
    {
      'rank': '#5',
      'title': 'Hurt',
      'artist': 'NewJeans',
      'image': 'assets/images/stats6.png'
    },
    {
      'rank': '#6',
      'title': 'ILLUSION',
      'artist': 'aespa',
      'image': 'assets/images/stats7.png'
    },
    {
      'rank': '#7',
      'title': 'Pink Venom',
      'artist': 'BlackPink',
      'image': 'assets/images/stats1.png'
    },
    {
      'rank': '#8',
      'title': 'moods',
      'artist': '11 playlists',
      'image': 'assets/images/stats3.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFF121111),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: Column(
          children: <Widget>[
            Text('Top',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700)),
            Text('Past 30 Days',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 10,
                    color: Colors.grey))
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.auto_awesome_mosaic_outlined, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 4, // Number of tabs
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildTextButton(0, 'Tracks'),
                SizedBox(width: 20),
                buildTextButton(1, 'Artists'),
                SizedBox(width: 20),
                buildTextButton(2, 'Albums'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  buildTracksList(), // Content for the 'Tracks' tab
                  Center(
                      child: Text('Artists Content',
                          style: TextStyle(color: Colors.white))),
                  Center(
                      child: Text('Albums Content',
                          style: TextStyle(color: Colors.white))),
                  Center(
                      child: Text('Other Content',
                          style: TextStyle(color: Colors.white))),
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              child: TabBar(
                labelColor: Color(0xFF39C0D4),
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tab(text: '30 days'),
                  Tab(text: '6 months'),
                  Tab(text: '1 Year'),
                  Tab(text: 'LifeTime'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextButton(int index, String label) {
    bool isSelected = selectedIndex == index;
    return Column(
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Color(0xFF39C0D4) : Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
        Container(
          height: 2,
          width: 100,
          color: isSelected ? Color(0xFF39C0D4) : Colors.transparent,
        ),
      ],
    );
  }

  Widget buildTracksList() {
    return ListView.builder(
      itemCount: tracks.length,
      itemBuilder: (context, index) {
        final track = tracks[index];
        return Container(
          margin: EdgeInsets.only(top: 16, left: 18, right: 18),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  track['rank']!,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(width: 25),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(track['image']!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(width: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    track['title']!,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: Colors.white),
                  ),
                  Text(
                    track['artist']!,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
