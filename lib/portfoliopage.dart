// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:porfolio/aboutsection.dart';
// import 'package:porfolio/aboutsection.dart';
import 'package:porfolio/contactsection.dart';
import 'package:porfolio/experience.dart';
// import 'package:porfolio/experience.dart';
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
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(70, 0, 0, 0),
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
          _navButton("Home", () {
            _scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }),
          _navButton("Projects", () {
            _scrollToSection(_projectsKey);
          }),
          _navButton("Contact", () {
            _scrollToSection(_contactKey);
          }),
        ],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque, // Makes sure taps are registered
        onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard on tap
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              HeroSection(),
            Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Container(
    key: _projectsKey,
    margin: const EdgeInsets.symmetric(vertical: 60), // Reduced from 40 to 16
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3), // Reduced from 20 to 12
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Colors.blueGrey, Colors.black26],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    child: ProjectsSection(),
  ),
),
              Container(
                margin: EdgeInsets.symmetric(vertical: 40,),
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bgskills.png'),
                    fit: BoxFit.cover,
                    opacity: 0.5,
                    ),
                 borderRadius: BorderRadius.circular(15),
                ),
                child: const Aboutsection()),
                 Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Container(
    margin: const EdgeInsets.symmetric(vertical: 60), // Reduced from 40 to 16
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3), // Reduced from 20 to 12
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Colors.blueGrey, Colors.black26],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    child: ExperienceSection(),
  ),
),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  key: _contactKey,
                  margin: const EdgeInsets.symmetric(vertical: 40),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha : 0.8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const ContactSection(),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }

  Widget _navButton(String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,

          style: const TextStyle(color: Colors.white, fontSize: 16,
          fontFamily: 'Montserrat'),
        ),
      ),
    );
  }
}
