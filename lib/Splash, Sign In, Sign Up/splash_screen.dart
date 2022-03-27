import 'package:flutter/material.dart';
import '../shared/size_config.dart';
import 'package:Home/Splash,%20Sign%20In,%20Sign%20Up/Login_Screen.dart';
import '../shared/constants.dart';

class SplashScreen extends StatelessWidget {

  static String routeName = '/splash-screen';
  const SplashScreen({Key? key}) : super(key: key);

  InitState()
  {
    On_FirstBuild();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF464646),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Welcome',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Colors.white, fontSize: 50),
          ),
          Material(
            child: Image.asset('assets/images/splash_img.png'),
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }));
            },
            child: Text(
              'Get Started',
              style: TextStyle(fontSize: 45) ,
            ),
            style: ElevatedButton.styleFrom(
              elevation: 15,
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              shadowColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25), // <-- Radius
              ),
            ),
          )
        ],
      ),
    );
  }
}


void On_FirstBuild()
{

}