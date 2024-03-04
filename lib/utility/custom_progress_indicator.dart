import 'package:flutter/material.dart';



class LinearProgressIndicatorWithColorChange extends StatelessWidget {
  final Duration totalDuration;
  final VoidCallback halfwayCallback;
  final Color color;
  final Color backgroundColor;

  const LinearProgressIndicatorWithColorChange({super.key, 
    required this.totalDuration,
    required this.halfwayCallback,
    required this.color,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: totalDuration,
      builder: (context, value, child) {
        if (value >= 0.5) {
          halfwayCallback();
        }

        return LinearProgressIndicator(
        
          value: value,
          backgroundColor: backgroundColor,
          valueColor: AlwaysStoppedAnimation<Color>(
            value < 0.5 ? backgroundColor : color,
          ),
        );
      },
    );
  }
}
class BlurLinearProgressIndicatorWithColorChange extends StatelessWidget {
  final Duration totalDuration;
  final VoidCallback halfwayCallback;
  final Color color;
  final Color backgroundColor;

  const BlurLinearProgressIndicatorWithColorChange({super.key, 
    required this.totalDuration,
    required this.halfwayCallback,
    required this.color,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.5),
      duration: totalDuration,
      builder: (context, value, child) {
        if (value >= 1.5) {
          halfwayCallback();
        }

        return LinearProgressIndicator(
        
          value: value,
          backgroundColor: backgroundColor,
          valueColor: AlwaysStoppedAnimation<Color>(
            value < 1.5 ? backgroundColor : color,
          ),
        );
      },
    );
  }
}


