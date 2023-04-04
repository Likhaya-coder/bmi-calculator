import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_check/box_card.dart';
import 'package:health_check/card_content.dart';
import 'package:health_check/constants.dart';
import 'package:health_check/customised_buttons.dart';
import 'package:health_check/results.dart';
import 'package:health_check/calculate_button.dart';
import 'package:health_check/calculation_process.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData().copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
      ),
    ),
    home: const HealthCheck(),
  ));
}

class HealthCheck extends StatefulWidget {
  const HealthCheck({Key? key}) : super(key: key);

  @override
  State<HealthCheck> createState() => _HealthCheckState();
}

enum Gender {
  male,
  female,
}

class _HealthCheckState extends State<HealthCheck> {
  Gender? selectedGender;
  int height = 180;
  int weight = 30;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: BoxCard(
                        colour: selectedGender == Gender.male
                            ? kActiveBoxCardColour
                            : kInactiveBoxCardColour,
                        cardChild: const CardContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'Male',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: BoxCard(
                          colour: selectedGender == Gender.female
                              ? kActiveBoxCardColour
                              : kInactiveBoxCardColour,
                          cardChild: const CardContent(
                            icon: FontAwesomeIcons.venus,
                            label: 'Female',
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BoxCard(
                colour: kInactiveBoxCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kBoxContentTitle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kBoxContentNumber,
                        ),
                        const Text(
                          'cm',
                          style: kBoxContentTitle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        thumbColor: Colors.blue,
                        overlayColor: Color(0x29FFFFFF),
                        activeTrackColor: Color(0x600000FF),
                        inactiveTrackColor:  Color(0x290000FF),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: BoxCard(
                      colour: kInactiveBoxCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: kBoxContentTitle,
                          ),
                          Text(
                            weight.toString(),
                            style: kBoxContentNumber,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomisedButtons(
                                label: '-',
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              const SizedBox(width: 20.0),
                              CustomisedButtons(
                                label: '+',
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: BoxCard(
                      colour: kInactiveBoxCardColour,
                      cardChild: Column(
                        children: [
                          Expanded(
                            child: BoxCard(
                              colour: kInactiveBoxCardColour,
                              cardChild: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'AGE',
                                    style: kBoxContentTitle,
                                  ),
                                  Text(
                                    age.toString(),
                                    style: kBoxContentNumber,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomisedButtons(
                                        label: '-',
                                        onPressed: () {
                                          setState(() {
                                            age--;
                                          });
                                        },
                                      ),
                                      const SizedBox(width: 20.0),
                                      CustomisedButtons(
                                        label: '+',
                                        onPressed: () {
                                          setState(() {
                                            age++;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CalculateButton(
              label: 'Calculate your BMI',
              onPressed: () {
                Calculations calc = Calculations(weight: weight.toDouble(), height: height.toDouble());
                if (selectedGender == null) {
                  Alert(
                    context: context,
                    title: "Error!",
                    desc: "Please select the gender on the app to continue.",
                    buttons: [
                      DialogButton(
                        onPressed: () => Navigator.pop(context),
                        width: 120,
                        child: const Text(
                          "BACK",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ).show();
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Results(
                        calcBMI: calc.calcBMI(),
                        getResult: calc.getResultColor(),
                        getInterpretation: calc.getInterpretation(),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
