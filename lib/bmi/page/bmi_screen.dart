import 'package:bmi_calculator/bmi/core/colors.dart';
import 'package:bmi_calculator/bmi/page/result_screen.dart';
import 'package:bmi_calculator/bmi/widgets/counter_card.dart';
import 'package:bmi_calculator/bmi/widgets/gender_card.dart';
import 'package:bmi_calculator/bmi/widgets/height_ui.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  int weight = 60;
  int age = 22;
  int height = 180;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      // appbar for the app
      appBar: AppBar(
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
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 20,
          children: [
            // male and female selection
            genderSelection(),
            // height selection
            HeightUI(
              height: height,
              onChanged: (value) {
                setState(() {
                  height = value.toInt();
                });
              },
            ),
            // weight and age selection
            weightAndAge(),

            // calculate button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentColor,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                double result = weight / (height * height / 10000);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(result: result),
                  ),
                );
              },
              child: const Text(
                "Calculate",
                style: TextStyle(color: AppColors.whiteColor, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded genderSelection() {
    return Expanded(
      child: Row(
        spacing: 10,
        children: [
          GenderCard(
            isSelected: isMale,
            text: "Male",
            icon: Icons.male,
            onTap: () {
              setState(() {
                isMale = true;
              });
            },
          ),
          GenderCard(
            isSelected: !isMale,
            text: "Female",
            icon: Icons.female,
            onTap: () {
              setState(() {
                isMale = false;
              });
            },
          ),
        ],
      ),
    );
  }

  Expanded weightAndAge() {
    return Expanded(
      child: Row(
        spacing: 10,
        children: [
          CounterCard(
            text: "Weight",
            count: weight,
            onAdd: () {
              setState(() {
                weight++;
              });
            },
            onRemove: () {
              if (weight > 0) {
                setState(() {
                  weight--;
                });
              }
            },
          ),
          CounterCard(
            text: "Age",
            count: age,
            onAdd: () {
              setState(() {
                age++;
              });
            },
            onRemove: () {
              if (age > 0) {
                setState(() {
                  age--;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
