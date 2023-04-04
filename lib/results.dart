import 'package:flutter/material.dart';
import 'package:health_check/box_card.dart';
import 'package:health_check/calculate_button.dart';

//import 'package:health_check/card_content.dart';
import 'package:health_check/constants.dart';

class Results extends StatelessWidget {
  final String calcBMI;
  final String getResult;
  final String getInterpretation;

  const Results(
      {super.key,
      required this.calcBMI,
      required this.getResult,
      required this.getInterpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'Check your health',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed',
            color: Colors.black87,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fitness_health.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Here is a BMI guide',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: const [
                        GuideContent(label: '18.5 = Underweight'),
                        GuideContent(label: '18.5 to 24.9 = Healthy'),
                        GuideContent(label: '25 to 29.9 = Overweight'),
                        GuideContent(label: '30 or higher = Obese'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: BoxCard(
                colour: kInactiveBoxCardColour,
                cardChild: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          calcBMI.toString(),
                          style: kBoxContentNumber,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          getResult.toString(),
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellowAccent,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 22.0),
                        child: Text(
                          getInterpretation.toString(),
                          style: const TextStyle(
                            height: 1.5,
                            letterSpacing: 2.0,
                            color: Colors.white,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CalculateButton(
              label: 'RE-CALCULATE YOUR BMI',
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

class GuideContent extends StatelessWidget {
  final String label;

  const GuideContent({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Text(label, style: kBmiGuide),
      ),
    );
  }
}
