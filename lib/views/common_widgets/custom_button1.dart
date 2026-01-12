import 'package:flutter/material.dart';
import 'package:quadleo_machine_test/utils/constants/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final Color color;
  final String text;
  final TextStyle textStyle;
  final Function()? onPressed;
  bool? isBorder = false;

  CustomButtonWidget({
    super.key,
    required this.color,
    required this.text,
    required this.textStyle,
     this.onPressed,
    this.isBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(32),
        border: isBorder == true ? Border.all(color: AppColors.border) : null,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text, style: textStyle),
      ),
    );
  }
}
