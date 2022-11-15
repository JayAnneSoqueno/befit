import 'package:flutter/material.dart';
import 'package:befit/standards.dart';

class Recommendations extends StatefulWidget {
  const Recommendations({Key? key}) : super(key: key);

  @override
  _RecommendationsState createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  // Create a data structure for the exercises, such as an object array with the
  // following properties: { Name | Set | Time/Count | Image | Calories }

  // List<dynamic> exercises = []; // Get the data from some API call
  // Sample exercises below (should be ordered by set)
  List<dynamic> exercises = [
    {
      // The dummy exercise will be utilized for the ListView to properly render
      // the items, as such, it is required to be the first item in the list-
      // even in the final API output.
      'name': 'Dummy exercise - this will not be displayed',
      'set': 0,
      'time': 0,
      'image': 'assets/images/dummy.png',
      'calories': 0
    },
    {
      'name': 'Squat',
      'set': 1,
      'time': 70,
      'image': 'assets/images/squat.png',
      'calories': 500
    },
    {
      'name': 'Bench',
      'set': 1,
      'time': 5,
      'image': 'assets/images/bench.png',
      'calories': 200
    },
    {
      'name': 'Deadlift',
      'set': 2,
      'time': 5,
      'image': 'assets/images/deadlift.png',
      'calories': 200
    },
    {
      'name': 'Overhead Press',
      'set': 2,
      'time': 5,
      'image': 'assets/images/overhead_press.png',
      'calories': 200
    },
    {
      'name': 'Barbell Row',
      'set': 3,
      'time': 5,
      'image': 'assets/images/barbell_row.png',
      'calories': 200
    },
  ];

  // Based on checklist
  String difficulty = 'Beginner';

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    // select date
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime(2050));

    // select time
    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      setState(() {
        selectedDate = pickedDate;
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Title
    // Exercise count | time | calories
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Standards.colors["blackColor"],
          ),
          // TODO: Implement Back Button
          // Tapping Back Button will return to previous page
          onPressed: () {
            setState(
              () {
                Navigator.pop(context);
              },
            );
          },
        ),
        title: Text(
          'Recommended Workout Routine',
          style: Standards.fontStyles["main"],
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(Standards.bounds["margin"]!),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                // Replace time and calories accordingly
                '${exercises.length - 1} exercises | ${exercises.fold(0, (previousValue, element) => element['time'] + previousValue)} minutes | ${exercises.fold(0, (previousValue, element) => element['calories'] + previousValue)} calories burn',
                style: Standards.fontStyles["subtitle"],
              ),
              // Schedule a workout button
              Container(
                margin: EdgeInsets.only(
                    top: Standards.bounds["margin"]!,
                    bottom: Standards.bounds["margin"]!),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Standards.bounds["borderRadius"]!),
                  color: Standards.colors["primaryColorLight"],
                ),
                child: ListTile(
                  leading: Icon(Icons.calendar_month),
                  title: Text(
                    'Schedule a workout',
                    style: Standards.fontStyles["subtitle"],
                  ),
                  trailing: Text(
                    selectedDate != null && selectedTime != null
                        ? '${selectedDate?.month}/${selectedDate?.day}, ${selectedTime?.format(context)}'
                        : 'Not set',
                    textAlign: TextAlign.right,
                  ),
                  onTap: () {
                    _selectDate(context);
                  },
                ),
              ),
              Text("Difficulty: $difficulty",
                  style: Standards.fontStyles["subtitle"]),
              Row(
                children: [
                  Text(
                    'Exercises',
                    style: Standards.fontStyles["smallerMain"],
                    textAlign: TextAlign.left,
                  ),
                  Expanded(child: Container()),
                  Text(
                    '${exercises.last['set']} sets',
                    style: Standards.fontStyles["subtitle"],
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: exercises.length,
                  separatorBuilder: (context, index) {
                    // if next set is different than current set, add a separator
                    if (index < exercises.length &&
                        exercises[index]['set'] !=
                            exercises[index + 1]['set']) {
                      return Text(
                        'Set ${exercises[index + 1]['set']}',
                        style: Standards.fontStyles["smallerMain"],
                      );
                    } else {
                      return Container();
                    }
                  },
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Container();
                    } else {
                      return ListTile(
                        leading: ClipRRect(
                          // Change to the line below when the image path is specified
                          // child: Image.asset(exercises[index]["image"]!),
                          child: Image.network(
                              'https://picsum.photos/250?${DateTime.now().millisecondsSinceEpoch.toString()}'),
                          borderRadius: BorderRadius.circular(
                              Standards.bounds["borderRadius"]!),
                        ),
                        title: Text(exercises[index]["name"],
                            style: Standards.fontStyles["main"]),
                        subtitle: Text('${exercises[index]["time"]} minutes',
                            style: Standards.fontStyles["subtitle"]),
                        trailing: IconButton(
                          icon: const Icon(Icons.chevron_right),
                          onPressed: () {
                            // implement what happens when an exercise is pressed
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
              Container(
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
                  child: Text(
                    'Start Workout',
                    style: Standards.fontStyles["mainButtonWhite"],
                  ),

                  onPressed: () {
                    // implement what happens when the button is pressed
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
