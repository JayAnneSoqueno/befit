import 'package:flutter/material.dart';
import 'package:befit/standards.dart';
import 'package:befit/screens/type_checklist.dart';
import 'package:befit/screens/image_processing.dart';

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  // Variables for BMI calculator
  double _userHeight = 0;
  double _userWeight = 0;
  double _calculateBMI(height, weight) {
    // convert height to meters
    double heightMeters = height / 100;
    if (height == 0) {
      return 0;
    }
    return (weight / (heightMeters * heightMeters));
  }

  // BMI categories
  String _bmiCategory(bmi) {
    if (bmi == 0) {
      return "";
    } else if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return "Normal";
    } else if (bmi >= 25 && bmi <= 29.9) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  // Section divider
  _divider(h) {
    return Divider(
      color: Standards.colors["whiteColor"],
      height: h,
    );
  }

  List<DropdownMenuItem<String>> get dropDownSexItems {
    List<DropdownMenuItem<String>> sexItems = [
      DropdownMenuItem(
        child: Text(
          'Male',
          style: Standards.fontStyles["button"],
        ),
        value: 'Male',
      ),
      DropdownMenuItem(
        child: Text(
          'Female',
          style: Standards.fontStyles["button"],
        ),
        value: 'Female',
      ),
    ];
    return sexItems;
  }

  String _selectedItem = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(Standards.bounds["padding"] as double),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://img.freepik.com/free-vector/couple-practicing-trail-run-training_74855-5474.jpg?t=st=1651208438~exp=1651209038~hmac=613e7cb45dcab1aef52b4e4d22097aca951328ceb5b3c263110921717b6daa62&w=740',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _divider(25.0),
            Column(
              children: [
                Text(
                  'Let\'s calculate your BMI!',
                  style: Standards.fontStyles["main"],
                ),
                Text(
                  'It will help us to know more about you.',
                  style: Standards.fontStyles["subtitle"],
                ),
              ],
            ),
            _divider(10.0),
            // CHOOSE GENDER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.people_outline_rounded,
                  color: Standards.colors["primaryColorLight"],
                ),
                Text(
                  'Select your Sex',
                  style: Standards.fontStyles["smallerMain"],
                ),
                DropdownButton(
                  value: _selectedItem,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedItem = newValue!;
                    });
                  },
                  items: dropDownSexItems,
                ),
              ],
            ),
            // IMG SCANNER BUTTON
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.77,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Scan your body type',
                    style: Standards.fontStyles["smallerMain"],
                  ),
                  VerticalDivider(
                    color: Standards.colors["whiteColor"],
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                  Card(
                    elevation: 5,
                    color: Standards.colors["primaryColorDark"],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Standards.colors["whiteColor"],
                      ),

                      
                      onPressed: () {
                        // TODO: IMPLEMENT SCANNER HERE
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageProcessing(),
                          ),
                        );
                        print('Scanner Button Pressed');
                      },
                    ),
                  ),
                ],
              ),
            ),
            _divider(10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.77,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.monitor_weight_outlined,
                          color: Standards.colors['primaryColorLight'],
                        ),
                        labelText: 'Enter your weight',
                        labelStyle: Standards.fontStyles["button"],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _userWeight = double.parse(value);
                        });
                      },
                    ),
                  ),
                  VerticalDivider(
                    color: Standards.colors["whiteColor"],
                    width: 20,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 252, 116, 190),
                          Color.fromARGB(255, 202, 36, 180),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.4, 1.0],
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'KG',
                      style: Standards.fontStyles["mainWhite"],
                    ),
                  ),
                ],
              ),
            ),
            _divider(10.0),
            // ENTER HEIGHT
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.77,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.nature_people_outlined,
                          color: Standards.colors['primaryColorLight'],
                        ),
                        labelText: 'Enter your height',
                        labelStyle: Standards.fontStyles["button"],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _userHeight = double.parse(value);
                        });
                      },
                    ),
                  ),
                  VerticalDivider(
                    color: Standards.colors["whiteColor"],
                    width: 20,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 252, 116, 190),
                          Color.fromARGB(255, 202, 36, 180),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.4, 1.0],
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'CM',
                      style: Standards.fontStyles["mainWhite"],
                    ),
                  ),
                ],
              ),
            ),
            _divider(10.0),
            // CALCULATE BMI
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.77,
                padding: EdgeInsets.all(Standards.bounds["padding"] as double),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'BMI: ',
                      style: Standards.fontStyles["smallerMainWhite"],
                    ),
                    const VerticalDivider(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    Text(
                      _calculateBMI(_userHeight, _userWeight)
                          .toStringAsFixed(2),
                      style: Standards.fontStyles["mainWhite"],
                    ),
                    const VerticalDivider(
                      color: Colors.transparent,
                      width: 10,
                    ),
                    const VerticalDivider(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _bmiCategory(_calculateBMI(_userHeight, _userWeight)),
                          style: Standards.fontStyles["smallerMainColored"],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              elevation: 0,
              color: Standards.colors["primaryColor"],
            ),
            _divider(20.0),
            // NEXT BUTTON
            Container(
              width: MediaQuery.of(context).size.width * 0.90,
              margin: EdgeInsets.only(top: Standards.bounds["margin"]!),
              // Rounded button
              child: ElevatedButton(
                // Rounded button
                style: ElevatedButton.styleFrom(
                  primary: Standards.colors["primaryColorDark"],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        Standards.bounds["borderRadius"]!),
                  ),
                ),
                // Text with icon
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Next',
                      style: Standards.fontStyles["mainButtonWhite"],
                    ),
                    const VerticalDivider(
                      color: Colors.transparent,
                    ),
                    const Icon(Icons.arrow_forward_outlined,
                        color: Colors.white),
                  ],
                ),
                onPressed: () {
                  setState(
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TypeChecklist(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
