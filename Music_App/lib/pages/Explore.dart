import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    Color first = Color(0xFF0E0E0E);
    Color second = Color(0xFF102B2D);
    Color third = Color(0xFF06A0B5);

    List<Map<String, dynamic>> items1 = [
      {
        'imagePath': 'assets/images/explore1.png',
        'text': 'Kpop',
        'color': Colors.lightGreen
      },
      {
        'imagePath': 'assets/images/explore2.jpg',
        'text': 'Indie',
        'color': Colors.purple
      },
    ];
    List<Map<String, dynamic>> items2 = [
      {
        'imagePath': 'assets/images/explore3.png',
        'text': 'R&B',
        'color': Color(0xFF4A558F)
      },
      {
        'imagePath': 'assets/images/explore4.png',
        'text': 'Pop',
        'color': Color(0xFFBD6220)
      },
    ];

    List<Map<String, dynamic>> items3 = [
      {
        'imagePath': 'assets/images/explore5.png',
        'text': 'Made for you',
        'color': Color(0xFF1E82AC)
      },
      {
        'imagePath': 'assets/images/hinh2.png',
        'text': 'RELEASED',
        'color': Color(0xFF76259C)
      },
    ];
    List<Map<String, dynamic>> items4 = [
      {
        'imagePath': 'assets/images/explore6.png',
        'text': 'Music Charts',
        'color': Color(0xFF25319C)
      },
      {
        'imagePath': 'assets/images/explore7.png',
        'text': 'Podcasts',
        'color': Color(0xFF9C2542)
      },
    ];
    List<Map<String, dynamic>> items5 = [
      {
        'imagePath': 'assets/images/explore8.png',
        'text': 'Bollywood',
        'color': Color(0xFF9C7425)
      },
      {
        'imagePath': 'assets/images/explore2.jpg',
        'text': 'Pop Fusion',
        'color': Color(0xFF479775)
      },
    ];

    // Lấy kích thước màn hình
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [third, second, first],
          stops: [0.0, 0.0, 0.4],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(
                screenWidth * 0.04), // Padding theo tỉ lệ màn hình
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/images/logo1.png'),
                        width: screenWidth * 0.15, // Tỉ lệ hình ảnh
                        height: screenWidth * 0.15,
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Text(
                        'Search',
                        style: TextStyle(
                            color: third,
                            fontSize: screenWidth * 0.07, // Tỉ lệ font chữ
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Container(
                    height:
                        screenHeight * 0.06, // Tỉ lệ chiều cao cho TextField
                    margin: EdgeInsets.symmetric(
                        vertical:
                            screenHeight * 0.02), // Tỉ lệ margin trên/dưới
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Song, Artists, Podcasts & More',
                        hintStyle: TextStyle(
                            color: Colors.grey), // Màu của văn bản gợi ý
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey, // Màu của biểu tượng tìm kiếm
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none, // Loại bỏ đường viền
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05,
                            vertical: screenHeight *
                                0.02), // Thêm khoảng cách nội dung
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                    child: Text(
                      'Your Top Genres',
                      style: TextStyle(
                        fontSize: screenWidth * 0.06, // Tỉ lệ font chữ
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(height: screenHeight * 0.02),
                      buildRow(items1, screenWidth),
                      SizedBox(height: screenHeight * 0.01),
                      buildRow(items2, screenWidth)
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                    child: Text(
                      'Browse All',
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(height: screenHeight * 0.02),
                      buildRow(items3, screenWidth),
                      SizedBox(height: screenHeight * 0.01),
                      buildRow(items4, screenWidth),
                      SizedBox(height: screenHeight * 0.01),
                      buildRow(items5, screenWidth)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildItem(Color menu, String imagePath, String text, Color color,
    double screenWidth) {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
      child: Container(
        height: screenWidth * 0.28,
        width: screenWidth * 0.4,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: screenWidth * 0.04,
                left: screenWidth * 0.03,
                child: Container(
                  width: screenWidth * 0.25,
                  height: screenWidth * 0.13,
                  child: Text(
                    text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.045,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700),
                  ),
                )),
            Positioned(
              bottom: -screenWidth * 0.02,
              right: -screenWidth * 0.02,
              child: Center(
                child: Transform.rotate(
                  angle: 30 * 3.1415927 / 180,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    child: Image.asset(imagePath,
                        height: screenWidth * 0.25,
                        width: screenWidth * 0.25,
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenWidth * 0.015),
          color: color, // Sử dụng màu sắc từ items
        ),
      ));
}

Widget buildRow(List<Map<String, dynamic>> items, double screenWidth) {
  return Row(
    children: items.map((item) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
        child: buildItem(item['color']!, item['imagePath']!, item['text']!,
            item['color']!, screenWidth),
      );
    }).toList(),
  );
}
