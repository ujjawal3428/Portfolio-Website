import 'package:flutter/material.dart';

class Aboutsection extends StatefulWidget {
  const Aboutsection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AboutsectionState createState() => _AboutsectionState();
}

class _AboutsectionState extends State<Aboutsection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final double spacing = 20.0;
  
  // Fixed card width for consistency across devices
  final double cardWidth = 280.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Helper method to determine appropriate font sizes based on screen width
  double _getResponsiveFontSize(double screenWidth, double baseFontSize) {
    if (screenWidth < 600) {
      // Mobile
      return baseFontSize * 0.85;
    } else if (screenWidth < 1024) {
      // Tablet
      return baseFontSize * 0.95;
    } else {
      // Desktop
      return baseFontSize;
    }
  }

  // Helper method to get responsive padding
  EdgeInsets _getResponsivePadding(double screenWidth) {
    if (screenWidth < 600) {
      // Mobile
      return const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12);
    } else if (screenWidth < 1024) {
      // Tablet
      return const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15);
    } else {
      // Desktop
      return const EdgeInsets.symmetric(horizontal: 40.0, vertical: 18);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double singleItemWidth = cardWidth + spacing;

    final colors = [
      const Color(0xFF1E1E2F),
      const Color.fromARGB(255, 170, 169, 169),
      const Color.fromARGB(255, 1, 100, 79),
      const Color.fromARGB(196, 32, 1, 103),
    ];
    
    final titles = ["My Profile", "Skills", "Hobbies", "Education"];
    
    final descriptions = [
      "Name - Ujjawal Jadhav \nContact No. - 9131538463 \nEmail - ujjawal.4328@gmail.com \nLocation - Bhilai, CG",
      "Dart \nFlutter \nFirebase \nAPI Integration \nGitHub \nJavaScript",
      "Chess \nCoding \nCricket \nMovies \nReading Books \n Travelling",
      "B.Tech \n(Computer Science & Engineering) \nRCET, Bhilai(C.G) \n[2021-2025]"
    ];

    double loopWidth = singleItemWidth * colors.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: _getResponsivePadding(screenWidth),
          child: Text(
            "About Me",
            style: TextStyle(
              fontSize: _getResponsiveFontSize(screenWidth, 27),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: screenWidth < 600 ? 220 : 240, // Responsive height
          width: screenWidth,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double shift = (_controller.value * loopWidth) % loopWidth;

              return ClipRect(
                child: Stack(
                  children: [
                    Positioned(
                      left: -shift,
                      child: Row(
                        children: [
                          ...List.generate(colors.length, (i) => i),
                          ...List.generate(colors.length, (i) => i),
                        ].map((index) {
                          final isLight =
                              colors[index % colors.length] == const Color.fromARGB(255, 170, 169, 169);
                          
                          return Container(
                            width: cardWidth, // Fixed width
                            height: screenWidth < 600 ? 200 : 220, // Responsive height
                            margin: EdgeInsets.only(right: spacing),
                            decoration: BoxDecoration(
                              color: colors[index % colors.length],
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha : 0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: screenWidth < 600 ? 16.0 : 20.0,
                                horizontal: screenWidth < 600 ? 12.0 : 16.0,
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      titles[index % titles.length],
                                      style: TextStyle(
                                        color: isLight ? Colors.black : Colors.white,
                                        fontSize: _getResponsiveFontSize(screenWidth, 23),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: screenWidth < 600 ? 12 : 16),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Text(
                                          descriptions[index % descriptions.length],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: isLight ? Colors.black87 : Colors.white,
                                            fontSize: _getResponsiveFontSize(screenWidth, 18),
                                            height: 1.4, // Line height for better readability
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}