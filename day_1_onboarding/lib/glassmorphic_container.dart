import 'dart:ui';
import 'package:flutter/material.dart';

class GlassmorphicContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double borderRadius;
  final double blur;
  final Color borderColor;
  final Color gradientColor1;
  final Color gradientColor2;
  final double border;

  const GlassmorphicContainer({
    super.key,
    required this.child,
    required this.width,
    required this.height,
    this.borderRadius = 20,
    this.blur = 10,
    this.borderColor = Colors.white,
    this.gradientColor1 = Colors.white,
    this.gradientColor2 = Colors.white,
    this.border = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: borderColor.withOpacity(0.2),
            width: border,
          ),
        ),
        child: Stack(
          children: [
            // Blurred background
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: blur,
                sigmaY: blur,
              ),
              child: Container(),
            ),

            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    gradientColor1.withOpacity(0.2),
                    gradientColor2.withOpacity(0.1),
                  ],
                ),
              ),
            ),

            // Child content
            Center(child: child),
          ],
        ),
      ),
    );
  }
}

