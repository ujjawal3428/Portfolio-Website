import 'package:flutter/material.dart';

class Aboutsection extends StatefulWidget {
  const Aboutsection({super.key});

  @override
  _AboutsectionState createState() => _AboutsectionState();
}

class _AboutsectionState extends State<Aboutsection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final double spacing = 20.0;

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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double boxWidth = screenWidth / 4;
    double singleItemWidth = boxWidth + spacing;

    final colors = [
      const Color(0xFF1E1E2F),
      const Color.fromARGB(255, 170, 169, 169),
      const Color.fromARGB(255, 1, 100, 79),
      const Color.fromARGB(196, 32, 1, 103),
    ];
    final titles = ["My Profile", "Skills", "Hobbies", "Education"];
    final descriptions = [
      "Name - Ujjawal Jadhav \nContact No. - 9131538463 \nEmail - ujjawal.4328@gmail.com",
      "Dart \nFlutter \nFirebase \nAPI Integration",
      "Chess \nCoding \nCricket",
      "B.Tech \n(Computer Science & Engineering) \nRCET, Bhilai(C.G) \n[2021-2025]"
    ];

    double loopWidth = singleItemWidth * colors.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
          child: Text(
            "About Me",
            style: TextStyle(
              fontSize: 27,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 200,
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
                              colors[index % colors.length] == Colors.white;
                          return Container(
                            width: boxWidth,
                            height: 200,
                            margin: EdgeInsets.only(right: spacing),
                            decoration: BoxDecoration(
                              color: colors[index % colors.length],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 30.0, horizontal: 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      titles[index % titles.length],
                                      style: TextStyle(
                                        color: isLight
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 18),
                                    Text(
                                      descriptions[index % descriptions.length],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: isLight
                                            ? Colors.black87
                                            : Colors.white,
                                        fontSize: 16,
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
