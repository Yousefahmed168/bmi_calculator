import 'package:bmi_calculator/bmi/core/colors.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });

  final String text;
  final IconData icon;
  final Function()? onTap;
  final bool isSelected;

  Color getColor() {
    if (isSelected) {
      return AppColors.appBarColor;
    } else {
      return AppColors.cardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: getColor(),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Icon(
                icon,
                size: 130,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
              Text(
                text,
                style: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
