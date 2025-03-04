import 'package:flutter/material.dart';

class OnboardingPageData {
  final String title;
  final String description;
  final IconData icon;
  final List<Color> gradientColors;

  const OnboardingPageData({
    required this.title,
    required this.description,
    required this.icon,
    required this.gradientColors,
  });
}

final List<OnboardingPageData> onboardingPages = [
  OnboardingPageData(
    title: 'Cross-Platform Power',
    description: 'Build apps for iOS, Android, and Web with one codebase.',
    icon: Icons.devices,
    gradientColors: [
      const Color(0xFF6B7280),
      const Color(0xFF60A5FA),
    ],
  ),
  OnboardingPageData(
    title: 'Low Development Cost',
    description: 'Save time and money with Flutter’s single codebase for multiple platforms.',
    icon: Icons.monetization_on,
    gradientColors: [
      const Color(0xFFF472B6),
      const Color(0xFFFBBF24),
    ],
  ),
  OnboardingPageData(
    title: 'Beautiful UIs',
    description: 'Create stunning designs with Flutter\'s widgets.',
    icon: Icons.auto_awesome,
    gradientColors: [
      const Color(0xFF10B981),
      const Color(0xFF3B82F6),
    ],
  ),
  OnboardingPageData(
    title: 'Growing Community',
    description: 'Join millions of developers learning Flutter.',
    icon: Icons.people,
    gradientColors: [
      const Color(0xFF8B5CF6),
      const Color(0xFFEC4899),
    ],
  ),
  OnboardingPageData(
    title: 'Develop MVPs in No Time',
    description: 'Launch prototypes fast with Flutter’s rapid development tools.',
    icon: Icons.rocket_launch,
    gradientColors: [
      const Color(0xFF6366F1),
      const Color(0xFF0EA5E9),
    ],
  ),
];

