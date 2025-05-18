import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  // List of skills/learning points with shorter descriptions to prevent overflow
  final List<Map<String, dynamic>> learningPoints = const [
    {
      'title': 'Flutter Development',
      'details': 'Built cross-platform apps with Flutter and Dart',
      'icon': Icons.mobile_friendly,
    },
    {
      'title': 'UI/UX Design',
      'details': 'Created intuitive interfaces and engaging user experiences',
      'icon': Icons.design_services,
    },
    {
      'title': 'State Management',
      'details': 'Implemented Provider and Bloc pattern solutions',
      'icon': Icons.sync_alt,
    },
    {
      'title': 'API Integration',
      'details': 'Connected apps to backend services through RESTful APIs',
      'icon': Icons.api,
    },
    {
      'title': 'Collaboration',
      'details': 'Worked with teams using Git and Jira for tasks',
      'icon': Icons.people,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => _buildMobileLayout(),
      tablet: (_) => _buildTabletLayout(),
      desktop: (_) => _buildDesktopLayout(),
    );
  }

  Widget _buildDesktopLayout() {
    return Container(
      constraints: const BoxConstraints(minHeight: 400),
      margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1A2980), Color(0xFF26D0CE)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(38), // 0.15 opacity
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side - Learning points
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "My Internship Experience",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Skills & Knowledge Acquired",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withAlpha(230), // 0.9 opacity
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    const SizedBox(height: 24),
                    ..._buildLearningPoints(),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 40),
            // Right side - Experience letter
            Expanded(
              flex: 2,
              child: _buildExperienceLetter(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Container(
      constraints: const BoxConstraints(minHeight: 400),
      margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1A2980), Color(0xFF26D0CE)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(38), // 0.15 opacity
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side - Learning points
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "My Internship Experience",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Skills & Knowledge Acquired",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withAlpha(230), // 0.9 opacity
                        fontFamily: 'Montserrat',
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 20),
                    ..._buildLearningPoints(),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 24),
            // Right side - Experience letter
            Expanded(
              flex: 2,
              child: _buildExperienceLetter(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Container(
      constraints: const BoxConstraints(minHeight: 500),
      margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
         gradient: const LinearGradient(
          colors: [Color(0xFF1A2980), Color(0xFF26D0CE)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(38), // 0.15 opacity
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top - Learning points
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "My Internship Experience",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Skills & Knowledge Acquired",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withAlpha(230), // 0.9 opacity
                      fontFamily: 'Montserrat',
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  ..._buildLearningPoints(),
                ],
              ),
              const SizedBox(height: 20),
              // Bottom - Experience letter
              Center(
                child: Container(
                  constraints: const BoxConstraints(maxHeight: 300),
                  child: _buildExperienceLetter(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildLearningPoints() {
    return List.generate(
      learningPoints.length,
      (index) => _LearningPointItem(
        title: learningPoints[index]['title'],
        details: learningPoints[index]['details'],
        icon: learningPoints[index]['icon'],
      ),
    );
  }

  Widget _buildExperienceLetter() {
    return AspectRatio(
      aspectRatio: 1/1, // Maintain aspect ratio for the certificate
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(51), // 0.2 opacity
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Experience letter image
              Image.asset(
                'assets/images/ujjawal_Offerletter.png', // Updated path
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.description,
                          size: 60,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Experience Certificate",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[800],
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}

// Custom widget for each learning point without animation
class _LearningPointItem extends StatelessWidget {
  final String title;
  final String details;
  final IconData icon;

  const _LearningPointItem({
    required this.title,
    required this.details,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(38), // 0.15 opacity
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 26,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  details,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withAlpha(204), // 0.8 opacity
                    fontFamily: 'Montserrat',
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}