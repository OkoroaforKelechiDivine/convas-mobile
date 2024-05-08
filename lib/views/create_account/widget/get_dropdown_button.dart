import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme_settings/manager/font_manager.dart';
import '../../../theme_settings/manager/theme_manager.dart';

class GenderSelectionWidget extends StatefulWidget {
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;
  final String? errorText;
  final TextEditingController? controller;

  const GenderSelectionWidget({
    Key? key,
    required this.selectedValue,
    required this.onChanged,
    this.errorText,
    this.controller,
  }) : super(key: key);

  @override
  _GenderSelectionWidgetState createState() => _GenderSelectionWidgetState();
}

class _GenderSelectionWidgetState extends State<GenderSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   'Gender',
        //   style: TextStyle(
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        Container(
          padding: const EdgeInsets.all(10),
          height: 45.h,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.blackColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              _buildGenderOption('Male'),
              SizedBox(width: 20.w),
              _buildGenderOption('Female'),
            ],
          ),
        ),
        if (widget.errorText != null)
          Padding(
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Text(
              widget.errorText!,
              style: TextStyle(
                color: Colors.red, // Change color to indicate error
                fontSize: 12.sp,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildGenderOption(String gender) {
    return GestureDetector(
      onTap: () {
        widget.onChanged?.call(gender);
        widget.controller?.text = gender; // Bind selected value to the controller
        setState(() {}); // Update UI
      },
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              widget.onChanged?.call(gender);
              widget.controller?.text = gender; // Bind selected value to the controller
              setState(() {}); // Update UI
            },
            child: Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.blackColor),
                color: widget.selectedValue == gender ? AppColors.blackColor : AppColors.white,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            gender,
            style: TextStyle(
              fontSize: AppFontSize.s14,
              color: widget.selectedValue == gender ? AppColors.blackColor : AppColors.blackColor,
              fontFamily: GoogleFonts.spectral().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
