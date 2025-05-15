import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:porfolio/projectdetailpage.dart';
import 'package:porfolio/projectdetailpage1.dart';
import 'package:porfolio/projectdetailpage2.dart';

class ProjectsSection extends StatefulWidget {
  ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  int? hoveredIndex;
  final List<Map<String, dynamic>> projects = [
    {
      'title': 'E-commerce App',
      'description':
          'An easy-to-use app to shop cosmetics and beauty products. Find everything from skincare to makeup, all in one place.',
      'images': [
        'assets/images/a1.jpg',
        'assets/images/a2.jpg',
        'assets/images/a3.jpg',
      ],
      'code': '''// Sample code...''',
      'detailPageType': 0,
    },
    {
      'title': 'Portfolio Website',
      'description':
          'This is my digital home—a sleek, responsive portfolio where I showcase the projects I’m proud of...',
      'images': [
        'assets/images/p1.png',
        'assets/images/p2.png',
        'assets/images/p3.png',
      ],
      'code': '''// Sample code...''',
      'detailPageType': 1,
    },
    {
      'title': 'Trusir App',
      'description':
          "Trusir's got your back — live classes, real-time doubt help, and smart courses that just click. Learn your way, the Trusir way.",
      'images': [
        'assets/images/t2.jpg',
        'assets/images/t1.jpg',
        'assets/images/t7.jpg',
      ],
      'code': '''// Sample code...''',
      'detailPageType': 2,
    },
  ];

  void _navigateToProjectDetailPage(BuildContext context, int index) {
    final project = projects[index];
    final int detailPageType = project['detailPageType'] as int;
    final List<String> imageUrls = List<String>.from(project['images']);

    Widget detailPage;
    switch (detailPageType) {
      case 0:
        detailPage = ProjectDetailsPage(
          projectTitle: project['title'],
          projectDescription: project['description'],
          imageUrls: imageUrls,
          codeSnippet: project['code'],
          githubLink: 'https://github.com/ujjawal3428/attiveg',
        );
        break;
      case 1:
        detailPage = ProjectDetailsPage1(
          projectTitle: project['title'],
          projectDescription: project['description'],
          imageUrls: imageUrls,
          codeSnippet: project['code'],
          githubLink: 'https://github.com/ujjawal3428/Portfolio-Website',
        );
        break;
      case 2:
        detailPage = ProjectDetailsPage2(
          projectTitle: project['title'],
          projectDescription: project['description'],
          imageUrls: imageUrls,
          codeSnippet: project['code'],
          githubLink: 'https://github.com/ujjawal3428/TrusirApp',
        );
        break;
      default:
        detailPage = ProjectDetailsPage(
          projectTitle: project['title'],
          projectDescription: project['description'],
          imageUrls: imageUrls,
          codeSnippet: project['code'],
          githubLink: 'https://github.com/ujjawal3428',
        );
    }

    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => detailPage,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0); // Slide from bottom
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final opacityTween = Tween<double>(begin: 0.0, end: 1.0);

          return SlideTransition(
            position: animation.drive(tween),
            child: FadeTransition(
              opacity: animation.drive(opacityTween),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveBuilder(
                  builder: (context, sizingInfo) {
                    double titleSize = sizingInfo.deviceScreenType ==
                            DeviceScreenType.mobile
                        ? 24
                        : sizingInfo.deviceScreenType == DeviceScreenType.tablet
                            ? 28
                            : 32;
                    return Text(
                      "My Projects",
                      style: TextStyle(
                        fontSize: titleSize,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Monteserrat',
                      ),
                    );
                  },
                ),
                ScreenTypeLayout.builder(
                  mobile: (_) => _buildGrid(context, 1),
                  tablet: (_) => _buildGrid(context, 2),
                  desktop: (_) => _buildGrid(context, 3),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGrid(BuildContext context, int crossAxisCount) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        return ProjectCard(
          project: projects[index],
          onTap: () => _navigateToProjectDetailPage(context, index),
          isHovered: hoveredIndex == index,
          isDimmed: hoveredIndex != null && hoveredIndex != index,
          onHoverChanged: (isHovering) {
            setState(() {
              hoveredIndex = isHovering ? index : null;
            });
          },
        );
      },
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Map<String, dynamic> project;
  final VoidCallback onTap;
  final bool isHovered;
  final bool isDimmed;
  final Function(bool) onHoverChanged;

  const ProjectCard({
    super.key,
    required this.project,
    required this.onTap,
    required this.isHovered,
    required this.isDimmed,
    required this.onHoverChanged,
  });

  @override
  Widget build(BuildContext context) {
    final imageList = project['images'] as List<String>;
    final screenWidth = MediaQuery.of(context).size.width;

    double titleFontSize = screenWidth < 400
        ? 16
        : screenWidth < 600
            ? 18
            : 20;

    double descriptionFontSize = screenWidth < 400
        ? 13
        : screenWidth < 600
            ? 14
            : 16;

    double scale = isHovered ? 1.05 : (isDimmed ? 0.95 : 1.0);

    return MouseRegion(
        onEnter: (_) => onHoverChanged(true),
        onExit: (_) => onHoverChanged(false),
        child: AnimatedScale(
            scale: scale,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: GestureDetector(
              onTap: onTap,
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
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                        child: Image.asset(
                          imageList.first,
                          fit: BoxFit.cover,
                          height: 200,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(Icons.error,
                                  size: 50, color: Colors.white54),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                project['title'],
                                style: TextStyle(
                                  fontSize: titleFontSize,
                                  color: Colors.white,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                child: Text(
                                  project['description'],
                                  style: TextStyle(
                                    fontSize: descriptionFontSize,
                                    color: Colors.white70,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: onTap,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.blueAccent,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const FittedBox(
                              child: Text(
                                "View Details",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
