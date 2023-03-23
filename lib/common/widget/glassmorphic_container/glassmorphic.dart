import 'dart:ui';

import 'package:flutter/material.dart';

class GlassmorphicContainer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final double blur;
  final Alignment alignment;
  final double border;
  final LinearGradient linearGradient;
  final LinearGradient borderGradient;
  final Widget child;

  const GlassmorphicContainer({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.blur,
    required this.alignment,
    required this.border,
    required this.linearGradient,
    required this.borderGradient,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        alignment: alignment,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              blurRadius: blur,
              offset: Offset(-5, -5),
              color: Colors.white.withOpacity(0.1),
            ),
            BoxShadow(
              blurRadius: blur,
              offset: Offset(5, 5),
              color: Colors.black.withOpacity(0.2),
            ),
          ],
          gradient: linearGradient,
          border: Border.all(
            color: borderGradient.colors.first.withOpacity(0.4),
            width: border,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  color: borderGradient.colors.last.withOpacity(0.4),
                  width: border,
                ),
                gradient: linearGradient,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

// GlassmorphicContainer(
//   width: 350,
//   height: 350,
//   borderRadius: 20,
//   blur: 20,
//   alignment: Alignment.bottomCenter,
//   border: 2,
//   linearGradient: LinearGradient(
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//     colors: [
//       Color(0xFFffffff).withOpacity(0.1),
//       Color(0xFFFFFFFF).withOpacity(0.05),
//     ],
//     stops: [
//       0.1,
//       1,
//     ],
//   ),
//   borderGradient: LinearGradient(
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//     colors: [
//       Color(0xFFffffff).withOpacity(0.5),
//       Color((0xFFFFFFFF)).withOpacity(0.5),
//     ],
//   ),
//   child: null,
// );
class GlassmorphicFlexContainer extends StatelessWidget {
  final double borderRadius;
  final double blur;
  final EdgeInsets padding;
  final Alignment alignment;
  final double border;
  final LinearGradient linearGradient;
  final LinearGradient borderGradient;
  final Widget child;

  const GlassmorphicFlexContainer({
    super.key,
    required this.borderRadius,
    required this.blur,
    required this.alignment,
    required this.border,
    required this.linearGradient,
    required this.borderGradient,
    required this.child,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              blurRadius: blur,
              offset: Offset(-5, -5),
              color: Colors.white.withOpacity(0.1),
            ),
            BoxShadow(
              blurRadius: blur,
              offset: Offset(5, 5),
              color: Colors.black.withOpacity(0.2),
            ),
          ],
          gradient: linearGradient,
          border: Border.all(
            color: borderGradient.colors.first.withOpacity(0.4),
            width: border,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  color: borderGradient.colors.last.withOpacity(0.4),
                  width: border,
                ),
              ),
              child: Padding(
                padding: padding,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// GlassmorphicFlexContainer(
//   borderRadius: 20,
//   blur: 20,
//   padding: EdgeInsets.all(40),
//   alignment: Alignment.bottomCenter,
//   border: 2,
//   linearGradient: LinearGradient(
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//     colors: [
//       Color(0xFFffffff).withOpacity(0.1),
//       Color(0xFFFFFFFF).withOpacity(0.05),
//     ],
//     stops: [
//       0.1,
//       1,
//     ],
//   ),
//   borderGradient: LinearGradient(
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//     colors: [
//       Color(0xFFffffff).withOpacity(0.5),
//       Color((0xFFFFFFFF)).withOpacity(0.5),
//     ],
//   ),
//   child: null,
// );