import 'package:flutter/material.dart';
import 'package:bmi_calculator/bmi/core/colors.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.result});

  final double result;

  Status getStatus() {
    if (result < 18.5) {
      return Status('Underweight', Colors.blue);
    } else if (result <= 24.9) {
      return Status('Healthy Weight', Colors.green);
    } else if (result <= 29.9) {
      return Status('Overweight', Colors.orange);
    } else {
      return Status('Obese', Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.whiteColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 50,
        centerTitle: true,
        backgroundColor: AppColors.appBarColor,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your Result",
              style: TextStyle(
                fontSize: 40,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getStatus().name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: getStatus().color,
                      ),
                    ),
                    Text(
                      result.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 64,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentColor,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Re-Calculate",
                style: TextStyle(color: AppColors.whiteColor, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Status {
  final String name;
  final Color color;

  Status(this.name, this.color);
}
