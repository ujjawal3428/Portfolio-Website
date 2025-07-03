import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:porfolio/projectdetailpage.dart';
import 'package:porfolio/projectdetailpage1.dart';
import 'package:porfolio/projectdetailpage2.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  int? hoveredIndex;

  final List<Map<String, dynamic>> projects = [
    {
      'title': 'E-commerce App',
      'description':
          'Discover the ultimate beauty shopping experience with our easy-to-use app, where all your favorite cosmetics and skincare products are just a tap away.',
      'images': [
        'assets/images/a1.jpg',
        'assets/images/a2.jpg',
        'assets/images/a3.jpg',
      ],
      'code': '''// Sample code...''',
      'detailPageType': 0,
    },
    {
      'title': 'Style Suggest',
      'description':
          'StyleSuggest is an intelligent fashion assistant that helps you discover clothing colors and outfit suggestions that suit your unique skin tone. Powered by AI, the app analyzes your facial image to detect your skin tone and recommends personalized colors and styles — making sure you wear what truly complements you.',
      'images': [
        'assets/images/s1.jpg',
        'assets/images/s2.jpg',
        'assets/images/s3.jpg',
      ],
      'code': '''// Sample code...''',
      'detailPageType': 1,
    },
    {
      'title': 'Trusir App',
      'description':
          'At Trusir, we\'ve got your back every step of the way. Dive into live classes, get real-time doubt support, and explore smart, easy-to-follow courses.',
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
          githubLink: 'https://github.com/ujjawal3428/StyleSuggest',
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
          const begin = Offset(0.0, 1.0);
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
        final isMobile = constraints.maxWidth < 768;
        
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 16.0,
              bottom: isMobile ? 32.0 : 16.0, // Extra bottom padding for mobile
            ),
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
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: isMobile ? 20 : 16,
                      ),
                      child: Text(
                        "My Projects",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: titleSize,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    
    // Improved aspect ratio calculation for mobile
    double childAspectRatio;
    if (isMobile) {
      childAspectRatio = screenWidth < 400 ? 0.75 : 0.8;
    } else {
      childAspectRatio = screenWidth < 600 ? 0.85 : 0.9;
    }
    
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: isMobile ? 16 : 10, // More spacing on mobile
        crossAxisSpacing: isMobile ? 12 : 10,
        childAspectRatio: childAspectRatio,
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
          isMobile: isMobile,
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
  final bool isMobile;

  const ProjectCard({
    super.key,
    required this.project,
    required this.onTap,
    required this.isHovered,
    required this.isDimmed,
    required this.onHoverChanged,
    this.isMobile = false,
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
    
    // Better image height calculation for mobile
    double imageHeight;
    if (isMobile) {
      imageHeight = screenWidth < 400 ? 140 : 160;
    } else {
      imageHeight = screenWidth < 600 ? 160 : 200;
    }

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
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.zero,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0D2D65),
                    Color(0xFF42044D),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    imageList.first,
                    height: imageHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return SizedBox(
                        height: imageHeight,
                        child: const Center(
                          child: Icon(Icons.broken_image,
                              size: 50, color: Colors.white54),
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 12.0,
                        right: 12.0,
                        top: 12.0,
                        bottom: isMobile ? 16.0 : 12.0, // Extra bottom padding for mobile
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: isMobile ? 8 : 10),
                          Text(
                            project['title'],
                            style: TextStyle(
                              fontSize: titleFontSize,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: isMobile ? 12 : 15),
                          Expanded(
                            child: Text(
                              project['description'],
                              style: TextStyle(
                                fontSize: descriptionFontSize,
                                color: Colors.white70,
                                height: 1.4, // Better line height for readability
                              ),
                              maxLines: isMobile ? 3 : 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: isMobile ? 12 : 8),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: onTap,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.blueAccent,
                                padding: EdgeInsets.symmetric(
                                  vertical: isMobile ? 14 : 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: FittedBox(
                                child: Text(
                                  "View Details",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: isMobile ? 14 : 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}