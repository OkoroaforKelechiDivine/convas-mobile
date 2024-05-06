import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme_settings/manager/font_manager.dart';
import '../../../theme_settings/manager/theme_manager.dart';

class GenderSelectionWidget extends StatelessWidget {
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;

  const GenderSelectionWidget({Key? key, required this.selectedValue, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 45, // Increased height
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blackColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          _buildGenderOption('Male'),
          const SizedBox(width: 20),
          _buildGenderOption('Female'),
        ],
      ),
    );
  }

  Widget _buildGenderOption(String gender) {
    return GestureDetector(
      onTap: () => onChanged?.call(gender),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => onChanged?.call(gender),
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.blackColor),
                color: selectedValue == gender ? AppColors.blackColor : AppColors.white,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            gender,
            style: TextStyle(
              fontSize: AppFontSize.s14,
              color: selectedValue == gender ? AppColors.blackColor : AppColors.blackColor,
              fontFamily: GoogleFonts.spectral().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
