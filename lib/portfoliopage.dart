import 'package:flutter/material.dart';
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
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("My Portfolio", style: TextStyle(color: Colors.black)),
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
              child: Text("Home", style: TextStyle(color: Colors.black)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextButton(
              onPressed: () {
                _scrollToSection(_projectsKey);
              },
              child: Text("Projects", style: TextStyle(color: Colors.black)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextButton(
              onPressed: () {
                _scrollToSection(_contactKey);
              },
              child: Text("Contact", style: TextStyle(color: Colors.black)),
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

            Container(
              key: _projectsKey, 
              child: ProjectsSection(),
            ),

            
            Container(
              key: _contactKey,
              child: ContactSection(),
            ),
          ],
        ),
      ),
    );
  }
}
