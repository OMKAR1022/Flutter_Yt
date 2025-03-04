import 'package:flutter/material.dart';
import 'onboarding_page.dart';
import 'onboarding_data.dart';
import 'intro_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late AnimationController _buttonAnimationController;
  late Animation<double> _buttonScaleAnimation;
  bool _showIntro = true;

  @override
  void initState() {
    super.initState();
    _buttonAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _buttonScaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _buttonAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _buttonAnimationController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _animateToNextPage() {
    if (_currentPage < onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _startOnboarding() {
    setState(() {
      _showIntro = false;
    });
  }

  void _onGetStartedPressed() {
    _buttonAnimationController.forward().then((_) {
      _buttonAnimationController.reverse();
      // Navigate to home screen or main app
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Welcome to Learn Flutter in 2025!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showIntro) {
      return IntroPage(
        onGetStarted: _startOnboarding,
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          // PageView for swipeable screens
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: onboardingPages.length,
            itemBuilder: (context, index) {
              return OnboardingPage(
                pageData: onboardingPages[index],
                isLastPage: index == onboardingPages.length - 1,
                onButtonPressed: _onGetStartedPressed,
                buttonAnimation: _buttonScaleAnimation,
              );
            },
          ),

          // Page indicator dots
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingPages.length,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 10,
                  width: _currentPage == index ? 25 : 10,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),

          // Skip button
          Positioned(
            top: 50,
            right: 20,
            child: _currentPage < onboardingPages.length - 1
                ? TextButton(
              onPressed: () {
                _pageController.animateToPage(
                  onboardingPages.length - 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
                : const SizedBox.shrink(),
          ),

          // Next button
          Positioned(
            bottom: 100,
            right: 20,
            child: _currentPage < onboardingPages.length - 1
                ? FloatingActionButton(
              onPressed: _animateToNextPage,
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.black87,
              ),
            )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

