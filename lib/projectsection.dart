import 'package:flutter/material.dart';
import 'package:porfolio/projectdetailpage.dart';

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final List<Map<String, String>> projects = [
    {
      'title': 'Portfolio Website',
      'description': 'A responsive website to showcase my projects and skills.',
      'image': 'assets/images/cc.jpg',
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
      'image': 'assets/images/cc.jpg',
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
            'assets/images/aa.jpeg',
            'assets/images/bb.jpeg',
            'assets/images/cc.jpg',
            'assets/images/dd.jpg',
            'assets/images/ee.png',
          ],
          codeSnippet: project['code']!,
          githubLink: 'https://github.com/ujjawal3428/TrusirApp',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Projects",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          isWideScreen
              ? GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.8, // Adjusted for fixed height
                  ),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return ProjectCard(
                      project: projects[index],
                      onTap: () => _onProjectTap(context, index),
                    );
                  },
                )
              : Column(
                  children: projects
                      .asMap()
                      .entries
                      .map(
                        (entry) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: ProjectCard(
                            project: entry.value,
                            onTap: () => _onProjectTap(context, entry.key),
                          ),
                        ),
                      )
                      .toList(),
                ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Map<String, String> project;
  final VoidCallback onTap;

  const ProjectCard({super.key, required this.project, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 400, // Fixed height
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 13, 45, 101),
                  Color.fromARGB(255, 66, 4, 77)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  child: Image.asset(
                    project['image']!,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12, top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project['title']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        project['description']!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blueAccent,
                    ),
                    child: const Text("View Details"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
