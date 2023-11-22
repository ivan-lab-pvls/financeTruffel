import 'package:as_fin/ext.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    required this.onTap,
    this.width,
    this.height,
  });

  final String title;
  final VoidCallback onTap;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: context.theme.primaryColor,
          boxShadow: [
            BoxShadow(
              color: context.theme.primaryColor,
              offset: const Offset(1, 1),
              blurRadius: 15,
            ),
          ],
        ),
        child: Text(
          title,
          style: context.textTheme.labelSmall,
        ),
      ),
    );
  }
}
