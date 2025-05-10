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
      const Color(0xFF1E1E2F), // Card background (deep bluish charcoal)
      const Color.fromARGB(255, 170, 169, 169), // Text or surface elements (soft white)
      const Color.fromARGB(255, 1, 100, 79), // Accent (neon mint green/cyan glow)
      const Color.fromARGB(196, 32, 1, 103), // Secondary highlight (futuristic deep violet)
    ];
    final titles = ["My Profile", "Skills", "Hobbies", "Education"];
    final descriptions = [
      "Name - Ujjawal Jadhav \n Contact No. - 9131538463 \n Email - ujjawal.4328@gmail.com ",
      "Dart \n Flutter \n Firebase \n Api Integeration",
      "Chess \n Coding \n Cricket \n ",
      "B.Tech \n (Computer Science & Engineering) \n RCET, Bhilai(C.G) \n [2021-2025]"
    ];
    double loopWidth = singleItemWidth * colors.length;

    return SizedBox(
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
                      final isLight = colors[index] == Colors.white;
                      return Container(
                        width: boxWidth,
                        height: 200,
                        margin: EdgeInsets.only(right: spacing),
                        decoration: BoxDecoration(
                          color: colors[index],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 30, bottom: 20.0, right: 10, left: 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  titles[index],
                                  style: TextStyle(
                                    color:
                                        isLight ? Colors.black : Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 18),
                                Text(
                                  descriptions[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color:
                                        isLight ? Colors.black87 : Colors.white,
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
    );
  }
}
