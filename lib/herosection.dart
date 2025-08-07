// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HeroSectionState createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> with TickerProviderStateMixin {
  late AnimationController _masterController;
  late AnimationController _backgroundController;
  late AnimationController _particleController;
  late AnimationController _pulseController;
  late AnimationController _rotationController;
  late AnimationController _floatingController;
  late AnimationController _glitchController;
  late AnimationController _neonController;
  late AnimationController _snakeController;
  
  // Main content animations
  late Animation<double> _nameOpacityAnimation;
  late Animation<double> _titleFadeAnimation;
  late Animation<Offset> _titleSlideAnimation;
  late Animation<double> _buttonScaleAnimation;
  late Animation<double> _buttonGlowAnimation;
  
  // Background and effect animations
  late Animation<double> _backgroundZoomAnimation;
  late Animation<double> _overlayOpacityAnimation;
  late Animation<double> _particleAnimation;
  late Animation<double> _pulseAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _floatingAnimation;
  late Animation<double> _glitchAnimation;
  late Animation<double> _neonAnimation;
  late Animation<double> _snakeAnimation;
  
  // Color animations with aesthetic colors
  late Animation<Color?> _gradientColorAnimation;
  late Animation<Color?> _accentColorAnimation;
  late Animation<Color?> _neonColorAnimation;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _initializeAnimations();
    _startAnimations();
  }

  void _initializeControllers() {
    _masterController = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );
    
    _backgroundController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
    
    _particleController = AnimationController(
      duration: const Duration(milliseconds: 6000),
      vsync: this,
    );
    
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 12000),
      vsync: this,
    );
    
    _floatingController = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    );
    
    _glitchController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    
    _neonController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _snakeController = AnimationController(
      duration: const Duration(milliseconds: 8000),
      vsync: this,
    );
  }

  void _initializeAnimations() {
    _nameOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _masterController,
      curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
    ));

    _titleSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _masterController,
      curve: const Interval(0.2, 0.6, curve: Curves.easeOut),
    ));

    _titleFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _masterController,
      curve: const Interval(0.2, 0.5, curve: Curves.easeOut),
    ));

    _buttonScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _masterController,
      curve: const Interval(0.4, 0.8, curve: Curves.bounceOut),
    ));

    _buttonGlowAnimation = Tween<double>(
      begin: 0.4,
      end: 0.8,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    _backgroundZoomAnimation = Tween<double>(
      begin: 1.2,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _backgroundController,
      curve: Curves.easeOut,
    ));

    _overlayOpacityAnimation = Tween<double>(
      begin: 0.8,
      end: 0.3,
    ).animate(CurvedAnimation(
      parent: _backgroundController,
      curve: Curves.easeOut,
    ));

    _particleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _particleController,
      curve: Curves.linear,
    ));

    _pulseAnimation = Tween<double>(
      begin: 0.8,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * math.pi,
    ).animate(CurvedAnimation(
      parent: _rotationController,
      curve: Curves.linear,
    ));

    _floatingAnimation = Tween<double>(
      begin: -15.0,
      end: 15.0,
    ).animate(CurvedAnimation(
      parent: _floatingController,
      curve: Curves.easeInOut,
    ));

    _glitchAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _glitchController,
      curve: Curves.elasticOut,
    ));

    _neonAnimation = Tween<double>(
      begin: 0.3,
      end: 0.7,
    ).animate(CurvedAnimation(
      parent: _neonController,
      curve: Curves.easeInOut,
    ));

    _snakeAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * math.pi,
    ).animate(CurvedAnimation(
      parent: _snakeController,
      curve: Curves.linear,
    ));

    // Aesthetic color palette
    _gradientColorAnimation = ColorTween(
      begin: const Color(0xFF667eea), // Soft purple-blue
      end: const Color(0xFF764ba2), // Muted purple
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    _accentColorAnimation = ColorTween(
      begin: const Color(0xFFf093fb), // Soft pink
      end: const Color(0xFFf5576c), // Coral pink
    ).animate(CurvedAnimation(
      parent: _rotationController,
      curve: Curves.easeInOut,
    ));

    _neonColorAnimation = ColorTween(
      begin: const Color(0xFF4facfe), // Sky blue
      end: const Color(0xFF00f2fe), // Bright cyan
    ).animate(CurvedAnimation(
      parent: _neonController,
      curve: Curves.easeInOut,
    ));
  }

  void _startAnimations() {
    _masterController.forward();
    _backgroundController.forward();
    
    _particleController.repeat();
    _pulseController.repeat(reverse: true);
    _rotationController.repeat();
    _floatingController.repeat(reverse: true);
    _neonController.repeat(reverse: true);
    _snakeController.repeat();
    
    _startGlitchEffect();
  }

  void _startGlitchEffect() {
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        _glitchController.forward().then((_) {
          _glitchController.reset();
          _startGlitchEffect();
        });
      }
    });
  }

  @override
  void dispose() {
    _masterController.dispose();
    _backgroundController.dispose();
    _particleController.dispose();
    _pulseController.dispose();
    _rotationController.dispose();
    _floatingController.dispose();
    _glitchController.dispose();
    _neonController.dispose();
    _snakeController.dispose();
    super.dispose();
  }

  Widget _buildParticle(double size, Color color, Offset position, bool isLeft) {
    return Positioned(
      left: isLeft ? position.dx : null,
      right: isLeft ? null : position.dx,
      top: position.dy,
      child: AnimatedBuilder(
        animation: _particleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: (math.sin(_particleAnimation.value * 2 * math.pi + position.dx) * 0.3 + 1.0),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    color.withOpacity(0.6),
                    color.withOpacity(0.2),
                    Colors.transparent,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.4),
                    blurRadius: size * 2,
                    spreadRadius: size * 0.3,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildFloatingParticles() {
    List<Widget> particles = [];
    
    // Left side particles
    for (int i = 0; i < 8; i++) {
      final random = math.Random(i);
      particles.add(_buildParticle(
        random.nextDouble() * 8 + 4,
        [
          const Color(0xFF667eea),
          const Color(0xFFf093fb),
          const Color(0xFF4facfe),
          const Color(0xFF764ba2),
        ][i % 4],
        Offset(
          random.nextDouble() * 150 + 20,
          random.nextDouble() * 400 + 50 + _floatingAnimation.value,
        ),
        true,
      ));
    }
    
    // Right side particles
    for (int i = 8; i < 16; i++) {
      final random = math.Random(i);
      particles.add(_buildParticle(
        random.nextDouble() * 8 + 4,
        [
          const Color(0xFF667eea),
          const Color(0xFFf093fb),
          const Color(0xFF4facfe),
          const Color(0xFF764ba2),
        ][i % 4],
        Offset(
          random.nextDouble() * 150 + 20,
          random.nextDouble() * 400 + 50 + _floatingAnimation.value,
        ),
        false,
      ));
    }
    
    return particles;
  }

  Widget _buildSnake() {
    const int segments = 12;
    List<Widget> snakeSegments = [];
    
    for (int i = 0; i < segments; i++) {
      final angle = _snakeAnimation.value + (i * math.pi * 2 / segments);
      final radius = 200.0 + (i * 8);
      final x = MediaQuery.of(context).size.width / 2 + radius * math.cos(angle);
      final y = 250 + radius * math.sin(angle) * 0.3;
      
      snakeSegments.add(
        Positioned(
          left: x - 15,
          top: y - 15,
          child: Transform.scale(
            scale: 1.0 - (i * 0.05),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    i == 0 
                      ? const Color(0xFFf5576c) // Head - coral
                      : const Color(0xFF4facfe).withOpacity(0.8 - i * 0.05), // Body - blue
                    i == 0 
                      ? const Color(0xFFf093fb) // Head gradient
                      : const Color(0xFF667eea).withOpacity(0.6 - i * 0.04), // Body gradient
                    Colors.transparent,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: (i == 0 ? const Color(0xFFf5576c) : const Color(0xFF4facfe))
                        .withOpacity(0.5),
                    blurRadius: 15,
                    spreadRadius: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    
    return Stack(children: snakeSegments);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _masterController,
        _backgroundController,
        _particleController,
        _pulseController,
        _rotationController,
        _floatingController,
        _glitchController,
        _neonController,
        _snakeController,
      ]),
      builder: (context, child) {
        return SizedBox(
          height: 500,
          width: double.infinity,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Background
              Transform.scale(
                scale: _backgroundZoomAnimation.value,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF0F0C29), // Deep purple
                        Color(0xFF24243e), // Dark blue-purple
                        Color(0xFF302b63), // Purple-blue
                      ],
                    ),
                  ),
                ),
              ),
              
              // Gradient overlay
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      (_gradientColorAnimation.value ?? const Color(0xFF667eea))
                          .withOpacity(_overlayOpacityAnimation.value * 0.4),
                      const Color(0xFF1a1a2e).withOpacity(0.3),
                      (_accentColorAnimation.value ?? const Color(0xFFf093fb))
                          .withOpacity(_overlayOpacityAnimation.value * 0.3),
                    ],
                  ),
                ),
              ),

              // Simple geometric shapes
              Positioned(
                left: 50,
                top: 80,
                child: Transform.rotate(
                  angle: _rotationAnimation.value,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF667eea).withOpacity(0.6),
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF667eea).withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                right: 60,
                top: 120,
                child: Transform.rotate(
                  angle: -_rotationAnimation.value,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFf093fb).withOpacity(0.6),
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFf093fb).withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 80,
                bottom: 100,
                child: Transform.rotate(
                  angle: _rotationAnimation.value * 0.5,
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF4facfe).withOpacity(0.6),
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF4facfe).withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Snake animation
              _buildSnake(),

              // Floating particles
              ..._buildFloatingParticles(),

              // Main content
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Name with subtle effects
                      FadeTransition(
                        opacity: _nameOpacityAnimation,
                        child: Transform.scale(
                          scale: _pulseAnimation.value * 0.05 + 0.95,
                          child: Transform.translate(
                            offset: Offset(
                              _glitchAnimation.value * (math.Random().nextDouble() - 0.5) * 4,
                              0,
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.08),
                                    Colors.white.withOpacity(0.02),
                                  ],
                                ),
                                border: Border.all(
                                  color: (_neonColorAnimation.value ?? const Color(0xFF4facfe))
                                      .withOpacity(_neonAnimation.value * 0.6),
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: (_gradientColorAnimation.value ?? const Color(0xFF667eea))
                                        .withOpacity(0.3),
                                    blurRadius: 20 * _neonAnimation.value,
                                    spreadRadius: 5 * _neonAnimation.value,
                                  ),
                                ],
                              ),
                              child: const Text(
                                "Hi, I'm Ujjawal Jadhav",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 2,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 25),
                      
                      // Subtitle
                      SlideTransition(
                        position: _titleSlideAnimation,
                        child: FadeTransition(
                          opacity: _titleFadeAnimation,
                          child: Transform.translate(
                            offset: Offset(0, _floatingAnimation.value * 0.3),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.06),
                                    Colors.white.withOpacity(0.02),
                                  ],
                                ),
                                border: Border.all(
                                  color: (_accentColorAnimation.value ?? const Color(0xFFf093fb))
                                      .withOpacity(0.4),
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: (_neonColorAnimation.value ?? const Color(0xFF4facfe))
                                        .withOpacity(0.2),
                                    blurRadius: 15,
                                    spreadRadius: 3,
                                  ),
                                ],
                              ),
                              child: ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                  colors: [
                                    const Color(0xFF4facfe),
                                    const Color(0xFF667eea),
                                  ],
                                ).createShader(bounds),
                                child: const Text(
                                  "Flutter App Developer",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // Aesthetic button
                      ScaleTransition(
                        scale: _buttonScaleAnimation,
                        child: Transform.scale(
                          scale: _pulseAnimation.value * 0.08 + 0.92,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              gradient: LinearGradient(
                                colors: [
                                  _gradientColorAnimation.value ?? const Color(0xFF667eea),
                                  _accentColorAnimation.value ?? const Color(0xFFf093fb),
                                  _neonColorAnimation.value ?? const Color(0xFF4facfe),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: (_gradientColorAnimation.value ?? const Color(0xFF667eea))
                                      .withOpacity(_buttonGlowAnimation.value * 0.4),
                                  blurRadius: 25 * _buttonGlowAnimation.value,
                                  spreadRadius: 5 * _buttonGlowAnimation.value,
                                ),
                                BoxShadow(
                                  color: (_accentColorAnimation.value ?? const Color(0xFFf093fb))
                                      .withOpacity(_buttonGlowAnimation.value * 0.3),
                                  blurRadius: 35 * _buttonGlowAnimation.value,
                                  spreadRadius: 8 * _buttonGlowAnimation.value,
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () async {
                                const phoneNumber = '+919131538463';
                                final Uri whatsappUrl = Uri.parse("https://wa.me/$phoneNumber");

                                if (await canLaunchUrl(whatsappUrl)) {
                                  await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
                                } else {
                                  throw 'Could not launch WhatsApp';
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 18,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                elevation: 0,
                                shadowColor: Colors.transparent,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Transform.rotate(
                                    angle: _rotationAnimation.value * 0.1,
                                    child: Transform.scale(
                                      scale: _pulseAnimation.value * 0.1 + 0.9,
                                      child: const Icon(
                                        Icons.chat_bubble_outline,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  const Text(
                                    "Get in Touch",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                ],
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
        );
      },
    );
  }
}