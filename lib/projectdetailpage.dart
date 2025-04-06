import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart'; // Import for URL launching

class ProjectDetailsPage extends StatelessWidget {
  final String projectTitle;
  final String projectDescription;
  final List<String> imageUrls;
  final String codeSnippet;
  final String githubLink; // GitHub link to redirect

  const ProjectDetailsPage({
    super.key,
    required this.projectTitle,
    required this.projectDescription,
    required this.imageUrls,
    required this.codeSnippet,
    required this.githubLink,
  });

  // Corrected function to launch GitHub URL
  void _launchURL() async {
    final Uri url = Uri.parse(githubLink); // Proper URI parsing
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $githubLink';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(projectTitle),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              projectTitle,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              projectDescription,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 16),
            CarouselSlider(
              items: imageUrls.map((url) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    url,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 300,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: true,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Container(
                width: 1000,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: SyntaxView(
                  code: codeSnippet,
                  syntax: Syntax.DART,
                  syntaxTheme: SyntaxTheme.dracula(),
                  withZoom: true,
                  withLinesCount: true,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _launchURL,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text(
                  "View Source Code",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
