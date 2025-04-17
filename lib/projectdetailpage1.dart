import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailsPage1 extends StatelessWidget {
  final String projectTitle;
  final String projectDescription;
  final List<String> imageUrls;
  final String codeSnippet;
  final String githubLink;

  const ProjectDetailsPage1({
    super.key,
    required this.projectTitle,
    required this.projectDescription,
    required this.imageUrls,
    required this.codeSnippet,
    required this.githubLink,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 82, 79),
      appBar: AppBar(
        title: Text(projectTitle),
        backgroundColor: const Color.fromARGB(255, 20, 60, 57),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Project Images", style: const TextStyle(fontSize: 23, color: Colors.white)),
            const SizedBox(height: 8),
            MasonryGridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imageUrls[index],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 60),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Text("Description", style: const TextStyle(fontSize: 23, color: Colors.white)),
            Padding(
             padding: const EdgeInsets.only(right: 20.0, left: 20),
              child: const SizedBox(height: 8),
            ),
            Text(projectDescription, style: const TextStyle(fontSize: 16, color: Colors.white)),
            const SizedBox(height: 20),
            Text("Code", style: const TextStyle(fontSize: 23, color: Colors.white)),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                 padding: const EdgeInsets.only(right: 20.0, left: 20),
                  child: SelectableText(
                    codeSnippet,
                    style: const TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: (){
                   launchUrl(Uri.parse('https://github.com/ujjawal3428/attiveg'));
                },
                icon: const Icon(Icons.code),
                label: const Text("View on GitHub"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
