import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifood/app_constants/dimensions.dart';
import 'package:ifood/app_constants/text_styles.dart';

import '../size_config.dart';

class CutOutText extends StatelessWidget {
  const CutOutText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimensions.h55),
      height: Dimensions.h400,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/foodwall1.jpg'), fit: BoxFit.cover),
      ),
      child: Center(
        child: CustomPaint(
          painter: CutOutTextPainter(text: 'Get Started'),
        ),
      ),
    );
  }
}

class CutOutTextPainter extends CustomPainter {
  CutOutTextPainter({required this.text}) {
    _textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextDimension.style19
      ),
      textDirection: TextDirection.ltr,
    );
    _textPainter.layout();
  }

  final String text;
  late final TextPainter _textPainter;

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the text in the middle of the canvas
    final textOffset =
        size.center(Offset.zero) - _textPainter.size.center(Offset.zero);
    final textRect = textOffset & _textPainter.size;

    // The box surrounding the text should be 10 pixels larger, with 4 pixels corner radius
    final boxRect = RRect.fromRectAndRadius(
        textRect.inflate(10.0), const Radius.circular(4.0));
    final boxPaint = Paint()
      ..color = Colors.black
      ..blendMode = BlendMode.srcOut;

    canvas.saveLayer(boxRect.outerRect, Paint());

    _textPainter.paint(canvas, textOffset);
    canvas.drawRRect(boxRect, boxPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(CutOutTextPainter oldDelegate) {
    return text != oldDelegate.text;}}