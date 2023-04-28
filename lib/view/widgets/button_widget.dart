import 'package:flutter/material.dart';
import 'package:image_text_verify/view/widgets/const_colors.dart';

class ButtonWidget extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  const ButtonWidget({super.key, required this.child, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50.0,
      width: width ?? 150.0,
      decoration: BoxDecoration(
          color: kwhiteColor,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
              color: purpleColor,
              spreadRadius: 0.1,
              blurRadius: 8.0,
              offset: Offset(2, 2),
            ),
            BoxShadow(
              color: kwhiteColor,
              spreadRadius: 0.1,
              blurRadius: 8.0,
              offset: Offset(-2, -2),
            )
          ]),
      child: child,
    );
  }
}
