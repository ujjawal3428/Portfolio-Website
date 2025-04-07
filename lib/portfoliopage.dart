import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:porfolio/contactsection.dart';
import 'package:porfolio/herosection.dart';
import 'package:porfolio/projectsection.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 800),  // Slightly longer for a smoother effect
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,  // Allow background to extend behind the app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "My Portfolio",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextButton(
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: Text(
                "Home",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextButton(
              onPressed: () {
                _scrollToSection(_projectsKey);
              },
              child: Text(
                "Projects",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextButton(
              onPressed: () {
                _scrollToSection(_contactKey);
              },
              child: Text(
                "Contact",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController, // Added the controller here
        child: Column(
          children: [
            // Hero Section
            HeroSection(),

            // Project Section
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
                key: _projectsKey,
                margin: const EdgeInsets.symmetric(vertical: 40),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.purpleAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ProjectsSection(),
              ),
            ),

            // Contact Section
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
                key: _contactKey,
                margin: const EdgeInsets.symmetric(vertical: 40),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha : 0.8),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ContactSection(),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black87,  // Set background to a dark color
    );
  }
}
