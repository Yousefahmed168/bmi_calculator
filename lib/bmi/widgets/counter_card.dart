import 'package:bmi_calculator/bmi/core/colors.dart';
import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  const CounterCard({super.key, required this.text, required this.count, this.onAdd, this.onRemove});

  final String text;
  final int count;
  final Function()? onAdd;
  final Function()? onRemove;

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
          spacing: 5,
          children: [
            Text(
              text,
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              count.toString(),
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              spacing: 42,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.greyColor,
                  ),
                  onPressed: onRemove,
                  icon: Icon(Icons.remove, fontWeight: FontWeight.w600),
                  color: AppColors.whiteColor,
                  iconSize: 30,
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.greyColor,
                  ),
                  onPressed: onAdd,
                  icon: Icon(Icons.add, fontWeight: FontWeight.w600),
                  color: AppColors.whiteColor,
                  iconSize: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
