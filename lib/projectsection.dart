import 'package:flutter/material.dart';
import 'package:porfolio/projectdetailpage.dart';

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final List<Map<String, String>> projects = [
    {
      'title': 'Portfolio Website',
      'description': 'A responsive website to showcase my projects and skills.',
      'image': 'assets/images/cc.jpg', // Asset image
      'code': '''
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Portfolio Website')),
        body: Center(child: Text('Welcome to my Portfolio!')),
      ),
    );
  }
}
''',
    },
    {
      'title': 'E-commerce App',
      'description': 'A mobile app for buying and selling products online.',
      'image': 'assets/images/cc.jpg', // Asset image
      'code': '''
import 'package:flutter/material.dart';

void main() {
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('E-commerce App')),
        body: Center(child: Text('Shop with ease!')),
      ),
    );
  }
}
''',
    },
  ];

  void _onProjectTap(BuildContext context, int index) {
    final project = projects[index];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectDetailsPage(
          projectTitle: project['title']!,
          projectDescription: project['description']!,
          imageUrls: [
            // Multiple images
            'assets/images/aa.jpeg',
            'assets/images/bb.jpeg',
            'assets/images/cc.jpg',
            'assets/images/dd.jpg',
            'assets/images/ee.png',
          ],
          codeSnippet: project['code']!, githubLink: 'https://github.com/ujjawal3428/TrusirApp',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Projects",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Column(
            children: projects.map((project) {
              return GestureDetector(
                onTap: () => _onProjectTap(context, projects.indexOf(project)),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Project Image
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15)),
                        child: Image.asset(
                          project['image']!,
                          fit: BoxFit.cover,
                          height: 200,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Project Title
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          project['title']!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Project Description
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          project['description']!,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black54),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // View Source Code Button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ElevatedButton(
                          onPressed: () =>
                              _onProjectTap(context, projects.indexOf(project)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                          ),
                          child: const Text("View Source Code"),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
