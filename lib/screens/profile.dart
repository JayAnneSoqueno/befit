import 'package:flutter/material.dart';
import 'package:befit/standards.dart';
import 'package:befit/screens/bmi_calculator.dart';
import 'package:befit/for_test.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Profile variables
  // TODO: Implement based on user data
  final String _profileName = 'Stefani Wong';
  final String _programName = 'Lose a Weight Program';
  final String _userHeight = '180 cm';
  final String _userWeight = '80 kg';
  final String _userAge = '25 y/o';

  // Misc variables
  final double _cardHeight = 70;
  final double _cardWidth = 90;
  Icon _itemExerciseIcon = const Icon(Icons.circle_outlined);

  // Section divider
  _divider(h) {
    return Divider(
      color: Standards.colors["whiteColor"],
      height: h,
    );
  }

  // Determine height of the Container for List Tile View Builder
  _containerHeight(context) {
    double _screenSize = MediaQuery.of(context).size.height;
    if (0 < _screenSize && _screenSize < 480) {
      return MediaQuery.of(context).size.height * 0.10;
    } else if (480 < _screenSize && _screenSize < 600) {
      return MediaQuery.of(context).size.height * 0.20;
    } else if (600 < _screenSize && _screenSize < 864) {
      return MediaQuery.of(context).size.height * 0.40;
    } else if (864 < _screenSize && _screenSize < 1024) {
      return MediaQuery.of(context).size.height * 0.45;
    } else {
      return MediaQuery.of(context).size.height * 0.55;
    }
  }

  // TODO: Implement based on exercise data
  final List _todayExercisesItems = [
    {
      'imgUrl':
          'https://post.healthline.com/wp-content/uploads/2019/03/Female_Squat_Studio_732x549-thumbnail-2.jpg',
      'name': 'Squat',
      'sets': '3',
      'reps': '10',
      'weight': '100',
      'time': '1:00',
    },
    {
      'imgUrl':
          'https://media.gq.com/photos/5633d4f4b318c58a0305f54d/3:4/w_995,h_1327,c_limit/benchpress.jpg',
      'name': 'Bench Press',
      'sets': '3',
      'reps': '10',
      'weight': '100',
      'time': '1:00',
    },
    {
      'imgUrl':
          'https://i0.wp.com/post.greatist.com/wp-content/uploads/sites/2/2021/04/deadlifting-outdoors-1296x728-header.jpg?w=1155&h=1528',
      'name': 'Deadlift',
      'sets': '3',
      'reps': '10',
      'weight': '100',
      'time': '1:00',
    },
    {
      'imgUrl':
          'https://media.self.com/photos/59a6e78b5902b970adaf005f/4:3/w_320%2Cc_limit/1E0A9668.JPG',
      'name': 'Pushups',
      'sets': '3',
      'reps': '10',
      'weight': '100',
      'time': '1:00',
    },
    {
      'imgUrl':
          'https://www.mensjournal.com/wp-content/uploads/mf/pullup-1280_0.jpg?w=900&h=506&crop=1&quality=86&strip=all',
      'name': 'Pullups',
      'sets': '3',
      'reps': '10',
      'weight': '100',
      'time': '1:00',
    }
  ];

  // Delete exercise item if video is already uploaded
  bool _isUploaded = false;
  // Function for uploading exercise video to be analyzed
  _uploadDialog(exercise) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(
              'Upload Video',
              style: Standards.fontStyles["main"],
            ),
            content: Container(
              height: 100,
              child: Column(
                children: [
                  Text(
                    "Upload $exercise Video to be analyzed",
                    style: Standards.fontStyles["subtitle"],
                  ),
                  ElevatedButton(
                    child: Text(
                      "Select Video",
                      style: Standards.fontStyles["mainButtonWhite"],
                    ),
                    onPressed: () => {
                      // TODO: Implement file upload
                      Navigator.pop(context),
                      _isUploaded = true,
                    },
                  ),
                ],
              ),
            ));
      },
    );
  }

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
          'Profile',
          style: Standards.fontStyles["main"],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          // TODO: implement profile picture in the backend, NetworkImage is a temporary placeholder
                          const NetworkImage(
                              "https://cdn.dribbble.com/users/1040983/screenshots/5623641/media/007e7f10155f637c061519447926a947.png?compress=1&resize=1200x900&vertical=top"),
                      backgroundColor: Standards.colors["primaryColor"],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _profileName,
                          style: Standards.fontStyles["main"],
                        ),
                        Text(
                          _programName,
                          style: Standards.fontStyles["subtitle"],
                        ),
                      ],
                    ),
                    IconButton(
                      splashColor: Standards.colors["primaryColorLight"],
                      splashRadius: 30,
                      icon: Icon(
                        Icons.edit,
                        color: Standards.colors["primaryColorDark"],
                      ),
                      // TODO: implement edit button
                      // Temporarily goes to BMI Calculator, and Health Checklist
                      onPressed: () {
                        setState(
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BMI(),
                              ),
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
                _divider(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      shadowColor: Standards.colors["shadowColor"],
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SizedBox(
                          width: _cardWidth,
                          height: _cardHeight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                _userHeight,
                                style: Standards.fontStyles["mainColored"],
                              ),
                              Text(
                                'Height',
                                style: Standards.fontStyles["subtitle"],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      shadowColor: Standards.colors["shadowColor"],
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SizedBox(
                          width: _cardWidth,
                          height: _cardHeight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                _userWeight,
                                style: Standards.fontStyles["mainColored"],
                              ),
                              Text(
                                'Weight',
                                style: Standards.fontStyles["subtitle"],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      shadowColor: Standards.colors["shadowColor"],
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SizedBox(
                          width: _cardWidth,
                          height: _cardHeight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                _userAge,
                                style: Standards.fontStyles["mainColored"],
                              ),
                              Text(
                                'Age',
                                style: Standards.fontStyles["subtitle"],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                _divider(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Today\'s Traning',
                      style: Standards.fontStyles["smallerMain"],
                    )
                  ],
                ),
                _divider(10.0),
                Container(
                  alignment: Alignment.topLeft,
                  width: MediaQuery.of(context).size.width,
                  // 40% of the Profile Page
                  height: _containerHeight(context),
                  child: ListView.builder(
                    itemCount: _todayExercisesItems.length,
                    itemBuilder: (BuildContext context, index) {
                      // TO DO: implement the exercise card when empty
                      if (_todayExercisesItems.isEmpty) {
                        return ListTile(
                          title: Text(
                            'You are done for today!',
                            style: Standards.fontStyles["main"],
                          ),
                        );
                      }
                      return ListTile(
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                _todayExercisesItems[index]["imgUrl"],
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        title: Text(
                          _todayExercisesItems[index]['name'],
                          style: Standards.fontStyles["main"],
                        ),
                        subtitle: Text(
                          "Sets: ${_todayExercisesItems[index]['sets']} | Reps: ${_todayExercisesItems[index]['reps']}",
                          style: Standards.fontStyles["subtitle"],
                        ),
                        trailing: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                width: 0, color: Colors.transparent),
                            elevation: 5.0,
                            backgroundColor: Standards.colors["whiteColor"],
                            shadowColor: Standards.colors["primaryColorDark"],
                          ),
                          child: Icon(
                            Icons.upload_rounded,
                            color: Standards.colors["primaryColorDark"],
                          ),
                          onPressed: () {
                            // Open upload dialog
                            setState(
                              () {
                                _uploadDialog(
                                    _todayExercisesItems[index]["name"]);
                                if (_isUploaded) {
                                  // remove the exercise from the list
                                  _todayExercisesItems.removeAt(index);
                                  _isUploaded = false;
                                }
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
