import 'package:flutter/material.dart';

import '../Rooms/living_room.dart';
import '../Splash, Sign In, Sign Up/Login_Screen.dart';
import '../shared/constants.dart';

class HomePage extends StatefulWidget {
  final userName;

  const HomePage(this.userName);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int temp = 40;

  InitState()
  {
    Colormode currentColor = GetSavedColor();

    if(currentColor == Colormode.Color1){
      Change_Color_Red();
    }
    else if(currentColor == Colormode.Color2) {
      Change_Color_Black();
    }
    else{
      Change_Color_Blue();
    }
  }

  @override
  Widget build(BuildContext context) {

    final buttom_Bar = AppBar(
      elevation: 10,
      toolbarHeight: 60,
      backgroundColor: cardColor,
      bottom: PreferredSize(
          child: Container(
            color: Colors.white12,
            height: 4.0,
          ),
          preferredSize: Size.fromHeight(4.0)),

      shadowColor: shadowColor,
      title: Row(
        children: <Widget>[
          IconButton(onPressed: (){ setState(() {
            Change_Color_Red();
          });  }, icon: const Icon(Icons.circle), color: cardColor_red, ),
          IconButton(onPressed: (){
            setState(() {
              Change_Color_Black();
            });
          }, icon: const Icon(Icons.circle), color: cardColor_blue,),
          IconButton(onPressed: (){
            setState(() {
              Change_Color_Blue();
            });
          }, icon: const Icon(Icons.circle), color: cardColor_orange,),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    );

    final List<Map> _listItem = [
      {"img": "icons/kitchen.png", "name": "Kitchen", "onPress": () {}},
      {"img": "icons/bathroom.png", "name": "Bathroom", "onPress": () {}},
      {
        "img": "icons/living_room.png",
        "name": "Living Room",
        "onPress": () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return LivingRoom();
          }));
        }
      },
      {"img": "icons/bedroom.png", "name": "Bed Room", "onPress": () {}},
      {
        "img": "icons/washing_room.png",
        "name": "Waching Room",
        "onPress": () {}
      },
      {"img": "icons/studio.png", "name": "Studio", "onPress": () {}},
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        toolbarHeight: 60,
        backgroundColor: cardColor,
        shadowColor: shadowColor,
        bottom: PreferredSize(
            child: Container(
              color: Colors.white12,
              height: 4.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
        leading: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Image(
            image: AssetImage('icons/vector.png'),
          ),

        ),
        title: Text('Hello ' + widget.userName,
        style: TextStyle(
          color: foregroundColor,
          fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w300,
        ),),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
              child: const Icon(
                IconData(0xe3b3, fontFamily: 'MaterialIcons'),
                color: foregroundColor,
              )),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(25,15,25,5),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: cardColor,
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Transform.scale(
                      scale: 1.4,
                      child: Image(
                        image: AssetImage(temp > 30
                            ? 'assets/images/temp_high.png'
                            : 'assets/images/temp_low.png'),
                        width: 180,
                      ),
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            temp.toString(),
                            style: const TextStyle(
                                color: foregroundColor,
                                fontSize: 50,
                                fontWeight: FontWeight.normal),
                          ),
                          const Text(
                            'c',
                            style: TextStyle(
                              color: foregroundColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Expanded(
                  child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 25,
                mainAxisSpacing: 15,
                children: _listItem
                    .map((item) => GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: cardColor,
                              boxShadow: [
                                BoxShadow(
                                  color: shadowColor,
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  item['img'],
                                  height: 75,
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  item['name'],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: item['onPress'],
                        ))
                    .toList(),
              ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: new SizedBox(
        height: buttom_Bar.preferredSize.height,
        child: buttom_Bar,
      ),
    );
  }
}


enum Colormode {Color1 , Color2, Color3}


Colormode GetSavedColor()
{
  //Get color stored and return properly saved color.
  return Colormode.Color2;
}

















