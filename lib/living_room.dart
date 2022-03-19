import 'package:flutter/material.dart';
import 'reusabel_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'loading.dart';

StreamController<bool> streamController = StreamController<bool>();
bool is_Loading = true;

bool lampStatus = false;
bool fanStatus = false;
bool doorStatus = true;
bool heaterStatus = false;
bool windowStatus = false;
int temp = 22;
late DatabaseReference dbref;
late Map dataBase;

class LivingRoom extends StatefulWidget {
  @override
  _LivingRoomState createState() => _LivingRoomState();
}

class _LivingRoomState extends State<LivingRoom> {
  get_Data_from_Firebase() {
    dbref = FirebaseDatabase.instance.ref("Smart Home/The First Floor/Room 1");
    Stream<DatabaseEvent> stream = dbref.onValue;

// Subscribe to the stream!
    stream.listen((DatabaseEvent event) {
      if (!mounted) return;
      setState(() {
        dataBase = event.snapshot.value as Map;
        lampStatus = dataBase['led'];
        is_Loading = false;
        streamController.add(is_Loading);
      });
    });
  }

  void mySetState(bool state) {
    if (!mounted) return;
    setState(() {
      is_Loading = state;
    });
  }

  void initState() {
    super.initState();
    if (!streamController.hasListener) {
      streamController.stream.listen((state) {
        mySetState(state);
      });
    }
    get_Data_from_Firebase();
  }

  Future<void> update() async {
    await dbref.update({'led': !lampStatus});
  }

  @override
  Widget build(BuildContext context) {
    return is_Loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text('Living Room'),
              backgroundColor: Color(0xFF1D1E33),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ReusableCard(
                      colour: kInactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              ImageIcon(
                                AssetImage(temp > 30
                                    ? 'assets/images/temp_high.png'
                                    : 'assets/images/temp_low.png'),
                                size: 120,
                              ),
                              Text(
                                temp.toString() + " C",
                                style: kFontStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                      onPress: () {
                        setState(() {
                          lampStatus = false;
                        });
                      }),
                ),
                Expanded(
                  child: Row(children: [
                    Expanded(
                      child: ReusableCard(
                          colour: doorStatus
                              ? kInactiveCardColor
                              : kActiveCardColor,
                          cardChild: IconContent(
                              icon: doorStatus
                                  ? 'icons/padlock.png'
                                  : 'icons/unlock.png',
                              label: "Door"),
                          onPress: () {
                            setState(() {
                              doorStatus = !doorStatus;
                            });
                          }),
                    ),
                    Expanded(
                      child: ReusableCard(
                          colour: heaterStatus
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          cardChild: IconContent(
                              icon: 'icons/heater.png', label: "Heater"),
                          onPress: () {
                            setState(() {
                              heaterStatus = !heaterStatus;
                            });
                          }),
                    ),
                  ]),
                ),
                Expanded(
                  child: Row(children: [
                    Expanded(
                      child: ReusableCard(
                          colour: lampStatus
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          cardChild: IconContent(
                              icon: 'icons/lights.png', label: 'LAMP'),
                          onPress: () {
                            if (!mounted) return;
                            setState(() {
                              update();
                            });
                          }),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour:
                            fanStatus ? kActiveCardColor : kInactiveCardColor,
                        cardChild: IconContent(
                            icon: 'icons/cooling-fan.png', label: "Fan"),
                        onPress: () {
                          setState(() {
                            fanStatus = !fanStatus;
                          });
                        },
                      ),
                    ),
                  ]),
                ),
                Expanded(
                  child: Row(children: [
                    Expanded(
                      child: ReusableCard(
                          colour: windowStatus
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          cardChild: IconContent(
                              icon: 'icons/windows.png', label: "Window"),
                          onPress: () {
                            setState(() {
                              windowStatus = !windowStatus;
                            });
                          }),
                    ),
                  ]),
                ),
              ],
            ));
  }
}
