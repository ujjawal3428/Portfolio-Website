import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class HeroSection extends StatefulWidget {
  const HeroSection({super.key,});


  @override
  // ignore: library_private_types_in_public_api
  _HeroSectionState createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> with TickerProviderStateMixin {
    
  late AnimationController _headingController;
  late Animation<Offset> _headingOffsetAnimation;
  late AnimationController _buttonController;
  late Animation<double> _buttonScaleAnimation;

  

  @override
  void initState() {
    super.initState();

    // Heading Animation
    _headingController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _headingOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _headingController,
      curve: Curves.easeInOut,
    ));

    // Button Animation
    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _buttonScaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _buttonController,
      curve: Curves.elasticOut,
    ));

    // Trigger animations
    _headingController.forward();
    _buttonController.forward();
  }

  @override
  void dispose() {
    _headingController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/herobg.jpg'),
         fit : BoxFit.cover,
         opacity: 0.8,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SlideTransition(
                position: _headingOffsetAnimation,
                child: Text(
                  "Hi, I'm Ujjawal Jadhav",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 3,
                    fontFamily: 'Monteserrat',
                    shadows: [
                      Shadow(
                        color: Colors.black54,
                        offset: Offset(0, 4),
                        blurRadius: 8,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Flutter App Developer",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Monteserrat',
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 25),
              ScaleTransition(
                scale: _buttonScaleAnimation,
                child: ElevatedButton(
  onPressed: () async {
     const phoneNumber = '+919131538463';
  final Uri whatsappUrl = Uri.parse("https://wa.me/$phoneNumber");

  if (await canLaunchUrl(whatsappUrl)) {
    await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch WhatsApp';
  }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 0, 140, 255),
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    elevation: 10,
  ),
  child: const Text(
    "Get in Touch",
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    ),
  ),
)

              ),
            ],
          ),
        ),
      ),
    );
  }
}
