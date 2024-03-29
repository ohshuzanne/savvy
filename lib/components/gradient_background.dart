import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:savvy/utils/colors.dart';

class BackgroundPainter extends CustomPainter {
  final double animationValue;

  BackgroundPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        50,
      );
    drawShape1(canvas, size, paint, lightBlue, animationValue);
    drawShape3(canvas, size, paint, lightYellow, animationValue);
    drawShape2(canvas, size, paint, lightPurple, animationValue);
  }

  void drawShape1(Canvas canvas, Size size, Paint paint, Color color,
      double animationValue) {
    final x = size.width * 0.3 +
        (size.width * 0.15 * math.sin(animationValue * 2 * math.pi / 100));
    final y = size.height * 0.10;
    paint.color = color;
    canvas.drawCircle(Offset(x, y), 200.0, paint);
  }

  void drawShape3(Canvas canvas, Size size, Paint paint, Color color,
      double animationValue) {
    final x = size.width * 0.95;
    final y = size.height * 0.75 +
        (size.height * 0.1 * -math.sin(animationValue * 2 * math.pi / 200));
    paint.color = color;
    canvas.drawCircle(Offset(x, y), 200.0, paint);
  }

  void drawShape2(Canvas canvas, Size size, Paint paint, Color color,
      double animationValue) {
    final x = size.width * 0.1 +
        (size.width * 0.2 * math.cos(animationValue * 3 * math.pi / 200));
    final y = size.height * 0.40;
    paint.color = color;
    canvas.drawCircle(Offset(x, y), 250.0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class BackgroundShapesState extends StatefulWidget {
  const BackgroundShapesState({Key? key}) : super(key: key);

  @override
  State<BackgroundShapesState> createState() => _BackgroundShapesStateState();
}

class _BackgroundShapesStateState extends State<BackgroundShapesState>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 200.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        size: Size(double.infinity, double.infinity),
        painter: BackgroundPainter(animationValue: _animation.value),
      ),
    );
  }
}

class PurpleBackgroundPainter extends CustomPainter {
  final double animationValue;

  PurpleBackgroundPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        50,
      );
    drawShape1(canvas, size, paint, lightPurple, animationValue);
    drawShape3(
        canvas, size, paint, lightPurple.withOpacity(0.4), animationValue);
    drawShape2(
        canvas, size, paint, lightPurple.withOpacity(0.5), animationValue);
  }

  void drawShape1(Canvas canvas, Size size, Paint paint, Color color,
      double animationValue) {
    final x = size.width * 0.3 +
        (size.width * 0.05 * math.sin(animationValue * 2 * math.pi / 100));
    final y = size.height * 0.50;
    paint.color = color;
    canvas.drawCircle(Offset(x, y), 100.0, paint);
  }

  void drawShape3(Canvas canvas, Size size, Paint paint, Color color,
      double animationValue) {
    final x = size.width * 0.95;
    final y = size.height * 0.60 +
        (size.height * 0.05 * -math.sin(animationValue * 2 * math.pi / 200));
    paint.color = color;
    canvas.drawCircle(Offset(x, y), 170.0, paint);
  }

  void drawShape2(Canvas canvas, Size size, Paint paint, Color color,
      double animationValue) {
    final x = size.width * 0.1 +
        (size.width * 0.2 * math.cos(animationValue * 3 * math.pi / 200));
    final y = size.height * 0.40;
    paint.color = color;
    canvas.drawCircle(Offset(x, y), 100.0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class PurpleBackgroundShapesState extends StatefulWidget {
  const PurpleBackgroundShapesState({Key? key}) : super(key: key);

  @override
  State<PurpleBackgroundShapesState> createState() =>
      _PurpleBackgroundShapesStateState();
}

class _PurpleBackgroundShapesStateState
    extends State<PurpleBackgroundShapesState>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 200.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        size: Size(double.infinity, double.infinity),
        painter: PurpleBackgroundPainter(animationValue: _animation.value),
      ),
    );
  }
}

class SecondPurpleBackgroundPainter extends CustomPainter {
  final double animationValue;

  SecondPurpleBackgroundPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        50,
      );
    drawShape1(
        canvas, size, paint, lightPurple.withOpacity(0.3), animationValue);
    drawShape3(canvas, size, paint, lightPink.withOpacity(0.2), animationValue);
    drawShape2(
        canvas, size, paint, lightYellow.withOpacity(0.2), animationValue);
  }

  void drawShape1(Canvas canvas, Size size, Paint paint, Color color,
      double animationValue) {
    final x = size.width * 0.3 +
        (size.width * 0.05 * math.sin(animationValue * 2 * math.pi / 100));
    final y = size.height * 0.50;
    paint.color = color;
    canvas.drawCircle(Offset(x, y), 200.0, paint);
  }

  void drawShape3(Canvas canvas, Size size, Paint paint, Color color,
      double animationValue) {
    final x = size.width * 0.95;
    final y = size.height * 0.80 +
        (size.height * 0.05 * -math.sin(animationValue * 2 * math.pi / 200));
    paint.color = color;
    canvas.drawCircle(Offset(x, y), 250.0, paint);
  }

  void drawShape2(Canvas canvas, Size size, Paint paint, Color color,
      double animationValue) {
    final x = size.width * 0.1 +
        (size.width * 0.2 * math.cos(animationValue * 3 * math.pi / 200));
    final y = size.height * 0.1;
    paint.color = color;
    canvas.drawCircle(Offset(x, y), 300.0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class SecondPurpleBackgroundShapesState extends StatefulWidget {
  const SecondPurpleBackgroundShapesState({Key? key}) : super(key: key);

  @override
  State<SecondPurpleBackgroundShapesState> createState() =>
      _SecondPurpleBackgroundShapesStateState();
}

class _SecondPurpleBackgroundShapesStateState
    extends State<SecondPurpleBackgroundShapesState>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 200.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        size: Size(double.infinity, double.infinity),
        painter:
            SecondPurpleBackgroundPainter(animationValue: _animation.value),
      ),
    );
  }
}
