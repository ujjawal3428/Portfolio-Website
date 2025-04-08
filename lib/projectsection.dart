import 'package:flutter/material.dart';
import 'package:porfolio/projectdetailpage.dart';
import 'package:porfolio/projectdetailpage1.dart';
import 'package:porfolio/projectdetailpage2.dart';

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final List<Map<String, dynamic>> projects = [
    {
      'title': 'Portfolio Website',
      'description': 'A responsive website to showcase my projects and skills.',
      'image': 'assets/images/a1.jpg',
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
      'detailPageType': 0, // Use numeric index instead of class reference
    },
    {
      'title': 'E-commerce App',
      'description': 'A mobile app for buying and selling products online.',
      'image': 'assets/images/t1.jpg',
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
      'detailPageType': 1,
    },
    {
      'title': 'New Project',
      'description': 'Description for the new project.',
      'image': 'assets/images/t2.jpg',
      'code': '''
import 'package:flutter/material.dart';

void main() {
  runApp(NewProjectApp());
}

class NewProjectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('New Project')),
        body: Center(child: Text('Details of the new project!')),
      ),
    );
  }
}
''',
      'detailPageType': 2,
    },
  ];

  // Default images to use for all projects
  final List<String> defaultImages = [
    'assets/images/t1.jpeg',
    'assets/images/t2.jpeg',
    'assets/images/t3.jpg',
    'assets/images/t4.jpg',
    'assets/images/t5.png',
  ];

  void _navigateToProjectDetailPage(BuildContext context, int index) {
    final project = projects[index];
    final int detailPageType = project['detailPageType'] as int;
    
    Widget detailPage;
    
    // Create the appropriate detail page based on the type
    switch (detailPageType) {
      case 0:
        detailPage = ProjectDetailsPage(
          projectTitle: project['title'],
          projectDescription: project['description'],
          imageUrls: defaultImages,
          codeSnippet: project['code'],
          githubLink: 'https://github.com/ujjawal3428/TrusirApp',
        );
        break;
      case 1:
        detailPage = ProjectDetailsPage1(
          projectTitle: project['title'],
          projectDescription: project['description'],
          imageUrls: defaultImages,
          codeSnippet: project['code'],
          githubLink: 'https://github.com/ujjawal3428/TrusirApp',
        );
        break;
      case 2:
        detailPage = ProjectDetailsPage2(
          projectTitle: project['title'],
          projectDescription: project['description'],
          imageUrls: defaultImages,
          codeSnippet: project['code'],
          githubLink: 'https://github.com/ujjawal3428/TrusirApp',
        );
        break;
      default:
        // Fallback to the first detail page type if unknown
        detailPage = ProjectDetailsPage(
          projectTitle: project['title'],
          projectDescription: project['description'],
          imageUrls: defaultImages,
          codeSnippet: project['code'],
          githubLink: 'https://github.com/ujjawal3428/TrusirApp',
        );
    }
    
    // Use Navigator to push the detail page
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => detailPage,
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
          const SizedBox(height: 20),
          isWideScreen
              ? GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return ProjectCard(
                      project: projects[index],
                      onTap: () => _navigateToProjectDetailPage(context, index),
                    );
                  },
                )
              : Column(
                  children: List.generate(
                    projects.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ProjectCard(
                        project: projects[index],
                        onTap: () => _navigateToProjectDetailPage(context, index),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Map<String, dynamic> project;
  final VoidCallback onTap;

  const ProjectCard({
    super.key,
    required this.project,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 400,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 13, 45, 101),
                  Color.fromARGB(255, 66, 4, 77),
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
                    project['image'],
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.error, size: 50, color: Colors.white54),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12, top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project['title'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        project['description'],
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
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        "View Details",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
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