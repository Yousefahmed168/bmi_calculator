import 'package:bmi_calculator/bmi/core/colors.dart';
import 'package:flutter/material.dart';

class HeightUI extends StatelessWidget {
  const HeightUI({super.key, required this.height, this.onChanged});

  final int height;
  final Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Height",
              style: TextStyle(color: AppColors.greyColor, fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              spacing: 5,
              children: [
                Text(
                  height.toString(),
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "cm",
                  style: TextStyle(color: AppColors.greyColor, fontSize: 20),
                ),
              ],
            ),
            Slider(
              value: height.toDouble(),
              min: 80,
              max: 220,
              activeColor: AppColors.accentColor,
              inactiveColor: AppColors.greyColor,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
