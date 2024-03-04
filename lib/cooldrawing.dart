// CoolDrawing.dart

import 'package:flutter/material.dart';

class CoolDrawing extends StatelessWidget {
  final String title;

  const CoolDrawing({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.grey[300], // Grey background
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "It's a Snowman!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: CustomPaint(
                  size: Size(200, 400), // Adjust the size as needed
                  painter: SnowmanPainter(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SnowmanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw snowman body
    Paint snowmanPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.75), 50, snowmanPaint);
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.55), 40, snowmanPaint);
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.35), 30, snowmanPaint);

    // Draw snowman face features
    Paint facePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width / 2 - 10, size.height * 0.3), 5, facePaint);
    canvas.drawCircle(Offset(size.width / 2 + 10, size.height * 0.3), 5, facePaint);

    Paint nosePaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(size.width / 2 - 5, size.height * 0.32, 10, 20), Radius.circular(5)), nosePaint);

    // Draw snowman arms
    Paint armPaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawLine(Offset(size.width / 2 - 30, size.height * 0.55), Offset(size.width / 2 - 50, size.height * 0.45), armPaint);
    canvas.drawLine(Offset(size.width / 2 + 30, size.height * 0.55), Offset(size.width / 2 + 50, size.height * 0.45), armPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

void main() {
  runApp(MaterialApp(
    home: CoolDrawing(title: 'Snowman Drawing'),
  ));
}
