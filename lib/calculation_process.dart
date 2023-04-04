import 'dart:math';

class Calculations{
  late double weight;
  late double height;

  Calculations({required this.weight, required this.height});

  late double _bmi;

  String calcBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String getResultColor() {
    if (_bmi < 18.5) {
      return 'Your BMI result is Yellow';
    } else if (_bmi < 24.9) {
      return 'Your BMI result is Green';
    } else if (_bmi < 29.9) {
      return 'Your BMI result is Orange';
    } else {
      return 'Your BMI is Red';
    }
  }

  String getInterpretation() {
    if (_bmi < 18.5) {
      return 'This means that you are underweight, an indication that you do not have enough body fat to maintain good health. Being underweight could lead to serious illnesses, Amenorrhea and could even indicate an eating disorder.';
    } else if (_bmi < 24.9) {
      return 'Good news, it looks like you have an ideal amount of body fat. This is good for maintaining good physical, mental and emotional health. A green BMI means you are at a much lower risk of chronic disease such as high Blood pressure, Heart diseases and Diabetes';
    } else if (_bmi < 29.9) {
      return 'There is a mismatch between your height and your weight, meaning you\'re overweight. Your risk of developing a chronic disease is therefore higher. A few changes in your lifestyle and diet could easily make a positive difference in archiving better health';
    } else {
      return 'Your BMI results states that you are Obese. This means that your risk of developing a chronic disease is therefore much higher. On the bright side, losing weight can cut your level of risk down significantly.';
    }
  }
}