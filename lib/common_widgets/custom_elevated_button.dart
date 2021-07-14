import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    @required this.child,
    this.color,
    this.borderRadius = 16,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  final Widget? child;
  final Color? color;
  final double borderRadius;
  final double height;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
        ),
      ),
    );
  }
}
