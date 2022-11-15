import 'package:befit/screens/Final_question.dart';
import 'package:befit/screens/login.dart';
import 'package:befit/screens/type_checklist.dart';
import 'package:flutter/material.dart';
import 'package:befit/standards.dart';
import 'package:befit/screens/bmi_calculator.dart';

class HealthChecklist extends StatefulWidget {
  @override
  _HealthChecklistState createState() => _HealthChecklistState();
}

class _HealthChecklistState extends State<HealthChecklist> {
  // TODO: Implement Proper Questions
  final _listQuestions = [
    {
      'id': 1,
      'question':
          'Has your doctor ever said that you have a heart condition or high blood pressure?'
    },
    {
      'id': 2,
      'question':
          'Do you feel pain in your chest at rest, during your daily activities of living, OR when you do physical activity?'
    },
    {
      'id': 3,
      'question':
          'Do you lose balance because of dizziness OR have you lost consciousness in the last 12 months?'
    },
    {
      'id': 4,
      'question':
          'Have you ever been diagnosed with another chronic medical condition (other than heart disease or high blood pressure)?'
    },
    {
      'id': 5,
      'question':
          'Are you currently taking prescribed medications for a chronic medical condition?'
    },
    {
      'id': 6,
      'question':
          'Do you currently have (or have had within the past 12 months) a bone, joint, or soft tissue (muscle, ligament, or tendon) problem that could be made worse by becoming more physically active?'
    },
    {
      'id': 7,
      'question':
          'Has your doctor ever said that you should only do medically supervised physical activity?'
    },
    {
      'id': 8,
      'question':
          'Check if you currently have any of these conditions:Rheumatoid Arthritis, Osteoarthritis, osteoporosis, Cancer, Heart Failure, Heart attack, High Blood pressure, Diabetes, Alzheimer’s disease, Dementia, Asthma, Pneumonia, Tuberculosis, Spinal Cord injury, stroke, recent head injury (in the last 12 months), epilepsy, kidney failure.'
    }
  ];

  Map<String, bool> answerBox = {
    'q1A1': false,
    'q1A2': false,
    'q2A1': false,
    'q2A2': false,
    'q3A1': false,
    'q3A2': false,
    'q4A1': false,
    'q4A2': false,
    'q5A1': false,
    'q5A2': false,
    'q6A1': false,
    'q6A2': false,
    'q7A1': false,
    'q7A2': false,
    'q8A1': false,
    'q8A2': false,
    'q9A1': false,
    'q9A2': false,
    'q10A1': false,
    'q10A2': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Standards.colors["blackColor"],
          ),
          // TODO: Implement Back Button
          // Tapping Back Button will return to the ROUTES TESTER (temporary)
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

        
        title: Text(
          'Health Checklist',
          style: Standards.fontStyles["main"],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(Standards.bounds["padding"] as double),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'For each question, select the appropriate answer.',
              style: Standards.fontStyles["subtitle"],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              // 80% of the Profile Page
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                itemCount: _listQuestions.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    leading: Text(
                      'Q${_listQuestions[index]['id']}:',
                      style: Standards.fontStyles["subtitle"],
                    ),
                    title: Text(
                      '${_listQuestions[index]['question']}',
                      style: Standards.fontStyles["smallerMain"],
                    ),
                    // TODO: Implement Answer Database
                    subtitle: SizedBox(
                      child: Column(
                        children: [
                          // Choice 1
                          Row(
                            children: [
                              // checkbox
                              Checkbox(
                                value: answerBox[
                                    'q${_listQuestions[index]['id']}A1'],
                                onChanged: (bool? value) {
                                  setState(
                                    () {
                                      // Check the box of the chosen answer
                                      answerBox[
                                              'q${_listQuestions[index]['id']}A1'] =
                                          !answerBox[
                                              'q${_listQuestions[index]['id']}A1']!;
                                      // if the other answer is selected, uncheck it
                                      if (answerBox[
                                              'q${_listQuestions[index]['id']}A2'] ==
                                          true) {
                                        answerBox[
                                                'q${_listQuestions[index]['id']}A2'] =
                                            !answerBox[
                                                'q${_listQuestions[index]['id']}A2']!;
                                      }
                                    },
                                  );
                                },
                              ),
                              Text(
                                'Yes',
                                style: Standards.fontStyles["subtitle"],
                              ),
                            ],
                          ),
                          // Choice 2
                          Row(
                            children: [
                              // checkbox
                              Checkbox(
                                value: answerBox[
                                    'q${_listQuestions[index]['id']}A2'],
                                onChanged: (bool? value) {
                                  setState(
                                    () {
                                      // Check the box of the chosen answer
                                      answerBox[
                                              'q${_listQuestions[index]['id']}A2'] =
                                          !answerBox[
                                              'q${_listQuestions[index]['id']}A2']!;
                                      // if the other answer is selected, uncheck it
                                      if (answerBox[
                                              'q${_listQuestions[index]['id']}A1'] ==
                                          true) {
                                        answerBox[
                                                'q${_listQuestions[index]['id']}A1'] =
                                            !answerBox[
                                                'q${_listQuestions[index]['id']}A1']!;
                                      }
                                    },
                                  );
                                },
                              ),
                              Text(
                                'No',
                                style: Standards.fontStyles["subtitle"],
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 5.0,
                            color: Standards.colors["primaryColorLight"],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Submit Button
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
                      'Submit',
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
                          builder: (context) => FinalQuestion(),
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
