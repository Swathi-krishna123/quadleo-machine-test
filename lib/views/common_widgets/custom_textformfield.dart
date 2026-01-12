import 'package:flutter/material.dart';
import 'package:quadleo_machine_test/utils/constants/app_colors.dart';
import 'package:quadleo_machine_test/utils/constants/app_fonts.dart';

class CustomTextformfield extends StatelessWidget {
  const CustomTextformfield({
    super.key,
    required this.controller,
    required this.hintText,
     this.suffixicon,
     this.prefixicon,
     this.validator
  });

  final TextEditingController controller;
  final String hintText;
  final Widget? suffixicon;
  final Widget? prefixicon;
  final String? Function(String?)? validator;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppFonts.hinttxt,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(32)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(32),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(32),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(32),
        ),
        suffixIcon:Padding(
          padding: const EdgeInsets.all(12.0),
          child: suffixicon,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(15.0),
          child: prefixicon,
        ) ,
        filled: true,
        fillColor: AppColors.foreground,
        
        
      ),
      validator: validator,
    );
  }
}
