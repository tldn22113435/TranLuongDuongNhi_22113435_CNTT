import 'package:flutter/material.dart';
import 'package:music_app/pages/Stats.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final double textFontSize = screenSize.width * 0.025;
    final double titleFontSize = screenSize.width * 0.048;
    final double rowPadding = screenSize.width * 0.025;
    final double imageHeight = screenSize.height * 0.174;
    final double iconSize = screenSize.width * 0.07;

    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF06A0B5), Color(0xFF102B2D), Color(0xFF0E0E0E)],
            stops: [0.0, 0.0, 0.4],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildHeader(context, iconSize),
                  SizedBox(height: 20),
                  buildTitle('Continue Listening', titleFontSize),
                  SizedBox(height: 30), // Increased spacing here
                  buildRow(
                      Color(0xFF436369),
                      [
                        {
                          'imagePath': 'assets/images/food1.png',
                          'text': 'Coffee & jazz'
                        },
                        {
                          'imagePath': 'assets/images/hinh2.png',
                          'text': 'RELEASED '
                        },
                      ],
                      imageHeight,
                      rowPadding,
                      textFontSize),
                  SizedBox(height: 20), // Increased spacing here
                  buildRow(
                      Color(0xFF436369),
                      [
                        {
                          'imagePath': 'assets/images/hinh6.png',
                          'text': 'Anything Goes'
                        },
                        {
                          'imagePath': 'assets/images/hinh3.png',
                          'text': 'Anime OSTs'
                        },
                      ],
                      imageHeight,
                      rowPadding,
                      textFontSize),
                  SizedBox(height: 20), // Increased spacing here
                  buildRow(
                      Color(0xFF436369),
                      [
                        {
                          'imagePath': 'assets/images/hinh5.png',
                          'text': "Harry's House"
                        },
                        {
                          'imagePath': 'assets/images/hinh4.png',
                          'text': 'Lo-Fi Beats'
                        },
                      ],
                      imageHeight,
                      rowPadding,
                      textFontSize),
                  SizedBox(height: 30), // Increased spacing here
                  buildTitle('Your Top Mixes', titleFontSize),
                  SizedBox(height: 20), // Increased spacing here
                  buildTopMixes(imageHeight, rowPadding, textFontSize),
                  SizedBox(height: 25), // Increased spacing here
                  buildTitle('Based on your recent listening', titleFontSize),
                  SizedBox(height: 20), // Increased spacing here
                  buildRecentListening(imageHeight, rowPadding),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context, double iconSize) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFF158085), Color(0xFF00DBFC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
            radius: iconSize / 2,
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome back!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: iconSize * 0.5,
                    fontWeight: FontWeight.w700)),
            Text('chandrama',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: iconSize * 0.4,
                    fontWeight: FontWeight.w700)),
          ],
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.bar_chart_outlined,
              size: iconSize, color: Colors.white),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Stats()));
          },
        ),
        IconButton(
          icon: Icon(Icons.notifications_outlined,
              size: iconSize, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.settings_outlined,
              size: iconSize, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildTitle(String text, double fontSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            color: Colors.white),
      ),
    );
  }

  Widget buildTopMixes(
      double imageHeight, double rowPadding, double textFontSize) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          buildMixes(Color(0xFFFF7777), 'assets/images/mixes1.png', 'Pop Mix',
              imageHeight, rowPadding, textFontSize),
          buildMixes(Color(0xFFFFFA77), 'assets/images/mixes2.png', 'Chill Mix',
              imageHeight, rowPadding, textFontSize),
          buildMixes(Color(0xFF77FF95), 'assets/images/mixes3.png', 'Kpop',
              imageHeight, rowPadding, textFontSize),
        ],
      ),
    );
  }

  Widget buildRecentListening(double imageHeight, double rowPadding) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          buildBased('assets/images/based1.png', imageHeight, rowPadding),
          buildBased('assets/images/based2.png', imageHeight, rowPadding),
        ],
      ),
    );
  }
}

Widget buildMixes(Color rectangleColor, String imagePath, String text,
    double imageHeight, double rowPadding, double textFontSize) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: rowPadding),
    child: Stack(
      children: <Widget>[
        Container(
          height: imageHeight,
          width: imageHeight,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.cover)),
        ),
        Positioned(
          top: imageHeight * 0.1,
          left: imageHeight * 0.15,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: textFontSize,
                letterSpacing: 0.04),
          ),
        ),
        Positioned(
          top: 5,
          left: -25,
          child: CircleAvatar(
            minRadius: imageHeight * 0.1,
            backgroundColor: Colors.white,
          ),
        ),
        Positioned(
          bottom: 30,
          right: -50,
          child: CircleAvatar(
            minRadius: imageHeight * 0.25,
            backgroundColor: Colors.white,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 10,
            color: rectangleColor,
          ),
        )
      ],
    ),
  );
}

Widget buildBased(String imagePath, double imageHeight, double rowPadding) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: rowPadding),
    child: Container(
      height: imageHeight * 1.1,
      width: imageHeight * 1.1,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

Widget buildItem(Color menu, String imagePath, String text, double height,
    double width, double fontSize) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: Container(
      height: height,
      width: width,
      child: Row(
        children: <Widget>[
          Container(
            height: height,
            width: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), // Rounded corners on the top-left
                bottomLeft:
                    Radius.circular(10), // Rounded corners on the bottom-left
              ),
            ),
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), // Rounded corners on the top-left
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10), // Rounded corners on the top-left
          bottomRight:
              Radius.circular(10), // Rounded corners on the bottom-left
        ),
        color: menu.withOpacity(0.2),
      ),
    ),
  );
}

Widget buildRow(Color menu, List<Map<String, String>> items, double imageHeight,
    double rowPadding, double textFontSize) {
  return Row(
    children: items.map((item) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: rowPadding),
        child: buildItem(menu, item['imagePath']!, item['text']!,
            imageHeight * 0.3, imageHeight * 1.05, textFontSize),
      );
    }).toList(),
  );
}
