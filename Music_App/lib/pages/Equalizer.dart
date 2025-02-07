import 'package:flutter/material.dart';

class EqualizerScreen extends StatefulWidget {
  @override
  _EqualizerScreenState createState() => _EqualizerScreenState();
}

class _EqualizerScreenState extends State<EqualizerScreen> {
  double bassBoost = 23;
  double effect3D = 69;

  List<double> sliderValues = [3, 2, 3, 3, 2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 16),
                Text(
                  'Equalizer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            // Device selection dropdown
            Container(
              width: double
                  .infinity, // Extend the width to fill the available space
              height: 40, // Set a specific height for the container
              padding: EdgeInsets.symmetric(horizontal: 20), // Increase padding
              margin: EdgeInsets.symmetric(
                  vertical:
                      1), // Optional: Add margin for spacing around the container
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(
                    12), // Optional: Slightly larger border radius
                border: Border.all(
                  color: Colors.white,
                  width: 0.5, // Increase border width if needed
                ),
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Space out the items
                children: [
                  Row(
                    children: [
                      Icon(Icons.phone_iphone,
                          color: Colors.cyanAccent), // Phone icon on the left
                      SizedBox(width: 10),
                      Text(
                        'Built-in Speakers',
                        style: TextStyle(color: Colors.cyanAccent),
                      ),
                    ],
                  ),
                  Icon(Icons.keyboard_arrow_down,
                      color: Colors.cyanAccent), // Arrow icon on the right
                ],
              ),
            ),

            SizedBox(height: 10),
            Text(
              'PRESENTS',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  PresetButton(label: 'Custom', isSelected: false),
                  SizedBox(width: 10), // Add space between buttons if needed
                  PresetButton(label: 'Normal', isSelected: false),
                  SizedBox(width: 10),
                  PresetButton(label: 'Pop', isSelected: true),
                  SizedBox(width: 10),
                  PresetButton(label: 'Classic', isSelected: false),
                  SizedBox(width: 10),
                  PresetButton(label: 'Heavy Metal', isSelected: false),
                ],
              ),
            ),

            SizedBox(height: 20),
            // Sliders
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(sliderValues.length, (index) {
                return Column(
                  children: [
                    Text(
                      '${sliderValues[index].toInt()}',
                      style: TextStyle(color: Colors.white),
                    ),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Slider(
                        value: sliderValues[index],
                        min: 0,
                        max: 5,
                        divisions: 5,
                        activeColor: Colors.cyanAccent,
                        inactiveColor: Colors.grey[700],
                        onChanged: (double value) {
                          setState(() {
                            sliderValues[index] = value;
                          });
                        },
                      ),
                    ),
                    Text(
                      '${(5 - sliderValues[index]).toInt()}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                );
              }),
            ),
            SizedBox(height: 20),
            // Bass Boost and 3D Effect knobs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DialWidget(
                  label: 'Bass Boost',
                  value: bassBoost,
                  onChanged: (value) {
                    setState(() {
                      bassBoost = value;
                    });
                  },
                ),
                DialWidget(
                  label: '3D Effect',
                  value: effect3D,
                  onChanged: (value) {
                    setState(() {
                      effect3D = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PresetButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const PresetButton({
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? Colors.cyanAccent
            : Colors.transparent, // Transparent background when not selected
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
              color:
                  Colors.white.withOpacity(0.3)), // Border to make it visible
        ),
        shadowColor: Colors.transparent, // Remove any shadow
      ),
      onPressed: () {},
      child: Text(label),
    );
  }
}

class DialWidget extends StatelessWidget {
  final String label;
  final double value;
  final ValueChanged<double> onChanged;

  const DialWidget({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onPanUpdate: (details) {
            double angle = value + details.delta.dy / 2;
            if (angle > 100) angle = 100;
            if (angle < 0) angle = 0;
            onChanged(angle);
          },
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.transparent,
                  Colors.cyanAccent.withOpacity(0.5)
                ],
                stops: [0.7, 1],
              ),
              border: Border.all(color: Colors.cyanAccent, width: 2),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: value / 100,
                  strokeWidth: 8,
                  backgroundColor: Colors.grey[800],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.cyanAccent),
                ),
                Text(
                  '${value.toInt()}%',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
