import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent.withOpacity(0.7), Colors.purple.withOpacity(0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        image: DecorationImage(
          image: NetworkImage(
            'https://cdn.pixabay.com/photo/2016/03/27/18/54/technology-1283624_1280.jpg',
          ),
          fit: BoxFit.cover,
          alignment: Alignment.center,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: 1.0,
                duration: Duration(milliseconds: 800),
                child: Text(
                  "Hi, I'm Ujjawal Jadhav",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                    fontFamily: 'RobotoMono',
                    shadows: [
                      Shadow(color: Colors.black.withOpacity(0.7), offset: Offset(0, 4), blurRadius: 8)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              AnimatedOpacity(
                opacity: 1.0,
                duration: Duration(milliseconds: 800),
                child: Text(
                  "Front-end App Developer",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'RobotoMono',
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(color: Colors.black.withValues(alpha : 0.7), offset: Offset(0, 4), blurRadius: 6)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              AnimatedOpacity(
                opacity: 1.0,
                duration: Duration(milliseconds: 1200),
                child: ElevatedButton(
                  onPressed: () {
                    // Action for the button
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrangeAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    elevation: 10,
                    shadowColor: Colors.deepOrangeAccent.withValues(alpha : 0.6),
                  ),
                  child: Text(
                    "Get in Touch",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
