import 'package:flutter/material.dart';

import '../util/utils.dart';


class SecondaryButton extends StatelessWidget {
  const SecondaryButton({required this.label, this.onPressed, this.height, this.width});
  final String label;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? 250,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(fontSize: 16),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(secondaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
        ),
      ),
    );
  }

}