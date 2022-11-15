import 'package:flutter/material.dart';
import 'package:befit/standards.dart';
import 'package:befit/for_test.dart';

class ActivityTracker extends StatefulWidget {
  @override
  _ActivityTrackerState createState() => _ActivityTrackerState();
}

class _ActivityTrackerState extends State<ActivityTracker> {
  // TO DO: Implement Daily Progress
  int mondayProgress = 9;
  int tuesdayProgress = 3;
  int wednesdayProgress = 5;
  int thursdayProgress = 2;
  int fridayProgress = 8;
  int saturdayProgress = 10;
  int sundayProgress = 7;

  final DateTime _now = DateTime.now();
  final double _widthBars = 20.0;

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
      'calories': 0,
      'comment': [
        'This is a dummy exercise, it will not be displayed in the list'
      ]
    },
    {
      'name': 'Squat',
      'set': 1,
      'time': 20,
      'image': 'assets/images/squat.png',
      'calories': 500,
      'comment': [
        'You were able to do a squat for 20 seconds',
        'Your form was incorrect, lower your butt'
      ],
    },
    {
      'name': 'Bench',
      'set': 1,
      'time': 5,
      'image': 'assets/images/bench.png',
      'calories': 200,
      'comment': [
        'You were able to do a bench for 5 seconds',
        'Your form was incorrect, lower your butt'
      ],
    },
    {
      'name': 'Deadlift',
      'set': 2,
      'time': 5,
      'image': 'assets/images/deadlift.png',
      'calories': 200,
      'comment': [
        'You were able to do a deadlift for 5 seconds',
        'Your form was incorrect, lower your butt'
      ],
    },
    {
      'name': 'Overhead Press',
      'set': 2,
      'time': 5,
      'image': 'assets/images/overhead_press.png',
      'calories': 200,
      'comment': [
        'You were able to do an overhead press for 5 seconds',
        'Your form was incorrect, lower your butt'
      ],
    },
    {
      'name': 'Barbell Row',
      'set': 3,
      'time': 5,
      'image': 'assets/images/barbell_row.png',
      'calories': 200,
      'comment': [
        'You were able to do a barbell row for 5 seconds',
        'Your form was incorrect, lower your butt'
      ],
    },
  ];

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
                    builder: (context) => ForTest(),
                  ),
                );
              },
            );
          },
        ),
        title: Text(
          'Activity Tracker',
          style: Standards.fontStyles["main"],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(Standards.bounds["padding"] as double),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Weekly Progress',
                  style: Standards.fontStyles["mainColored"],
                ),
                Text(
                  'Today is ${_now.day}/${_now.month}/${_now.year}',
                  style: Standards.fontStyles["subtitle"],
                ),
              ],
            ),
            Divider(
              color: Standards.colors["whiteColor"],
              height: 15,
            ),
            // Chart
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 10,
              child: Column(
                children: [
                  Divider(
                    color: Standards.colors["whiteColor"],
                    height: 15,
                  ),
                  RotatedBox(
                    quarterTurns: -1,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.height * 0.15,
                      height: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Monday Progress
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50.0)),
                            child: LinearProgressIndicator(
                              minHeight: _widthBars,
                              value: mondayProgress / 10,
                              backgroundColor: Standards.colors["grayColor"],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Standards.colors["primaryColorDark"] as Color,
                              ),
                            ),
                          ),
                          // Tuesday Progress
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50.0)),
                            child: LinearProgressIndicator(
                              minHeight: _widthBars,
                              value: tuesdayProgress / 10,
                              backgroundColor: Standards.colors["grayColor"],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Standards.colors["primaryColorDark"] as Color,
                              ),
                            ),
                          ),
                          // Wednesday Progress
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50.0)),
                            child: LinearProgressIndicator(
                              minHeight: _widthBars,
                              value: wednesdayProgress / 10,
                              backgroundColor: Standards.colors["grayColor"],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Standards.colors["primaryColorDark"] as Color,
                              ),
                            ),
                          ),
                          // Thursday Progress
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50.0)),
                            child: LinearProgressIndicator(
                              minHeight: _widthBars,
                              value: thursdayProgress / 10,
                              backgroundColor: Standards.colors["grayColor"],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Standards.colors["primaryColorDark"] as Color,
                              ),
                            ),
                          ),
                          // Friday Progress
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50.0)),
                            child: LinearProgressIndicator(
                              minHeight: _widthBars,
                              value: fridayProgress / 10,
                              backgroundColor: Standards.colors["grayColor"],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Standards.colors["primaryColorDark"] as Color,
                              ),
                            ),
                          ),
                          // Saturday Progress
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50.0)),
                            child: LinearProgressIndicator(
                              minHeight: _widthBars,
                              value: saturdayProgress / 10,
                              backgroundColor: Standards.colors["grayColor"],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Standards.colors["primaryColorDark"] as Color,
                              ),
                            ),
                          ),
                          // Sunday Progress
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50.0)),
                            child: LinearProgressIndicator(
                              minHeight: _widthBars,
                              value: sundayProgress / 10,
                              backgroundColor: Standards.colors["grayColor"],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Standards.colors["primaryColorDark"] as Color,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // X-axis Labels
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.82,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Mon',
                          style: Standards.fontStyles["mainSmaller"],
                        ),
                        Text(
                          'Tue',
                          style: Standards.fontStyles["mainSmaller"],
                        ),
                        Text(
                          'Wed',
                          style: Standards.fontStyles["mainSmaller"],
                        ),
                        Text(
                          'Thu',
                          style: Standards.fontStyles["mainSmaller"],
                        ),
                        Text(
                          'Fri',
                          style: Standards.fontStyles["mainSmaller"],
                        ),
                        Text(
                          'Sat',
                          style: Standards.fontStyles["mainSmaller"],
                        ),
                        Text(
                          'Sun',
                          style: Standards.fontStyles["mainSmaller"],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Standards.colors["whiteColor"],
                    height: 15,
                  ),
                ],
              ),
            ),
            Divider(
              color: Standards.colors["whiteColor"],
              height: 5,
            ),
            // Video Analysis
            Divider(
              color: Standards.colors["whiteColor"],
              height: 20,
            ),
            Text(
              'Video Analysis',
              style: Standards.fontStyles["mainColored"],
            ),
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
                      exercises[index]['set'] != exercises[index + 1]['set']) {
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
                      subtitle: Text(exercises[index]["comment"].join("\n"),
                          style: Standards.fontStyles["subtitle"]),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
