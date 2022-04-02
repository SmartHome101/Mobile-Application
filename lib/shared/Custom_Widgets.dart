import 'package:flutter/material.dart';

import '../Controllers/shared_preferences.dart';
import '../Splash, Sign In, Sign Up/Login_Screen.dart';
import '../Splash, Sign In, Sign Up/Sign_UpScreen.dart';
import 'constants.dart';

//Custom Email,Password and Username widgets

Widget BuildEmailTF(TextEditingController Email_Controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Email',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.email,
              color: Colors.white,
            ),
            hintText: 'Enter your Email',
            hintStyle: kHintTextStyle,
          ),
          controller: Email_Controller,
        ),
      ),
    ],
  );
}

Widget BuildPasswordTF(TextEditingController Password_Controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Password',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child: TextField(
          obscureText: true,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            hintText: 'Enter your Password',
            hintStyle: kHintTextStyle,
          ),
          controller: Password_Controller,
        ),
      ),
    ],
  );
}

Widget BuildUserName(TextEditingController Name_Controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Name',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.light,
              color: Colors.white,
            ),
            hintText: 'Enter your name',
            hintStyle: kHintTextStyle,
          ),
          controller: Name_Controller,
        ),
      ),
    ],
  );
}

Widget BuildGo_SignUp(BuildContext context, void Function() reset) {
  return Container(
    alignment: Alignment.centerRight,
    child: FlatButton(
      onPressed: () {
        reset();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SignUpScreen();
        }));
      },
      padding: EdgeInsets.only(right: 0.0),
      child: Text(
        "Don't have an account? Sign Up",
        style: kLabelStyle,
      ),
    ),
  );
}

BoxDecoration Background_decoration ()
{
  return BoxDecoration(
    image: DecorationImage(
    image: AssetImage('icons/Background.jpg'),
    fit: BoxFit.cover,
    colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken)
      ));
}


Widget BuildUserName_Customized(TextEditingController Name_Controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        width: 200,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.light,
              color: Colors.white,
            ),
            hintText: 'Enter your name',
            hintStyle: kHintTextStyle,
          ),
          controller: Name_Controller,
        ),
      ),
    ],
  );
}

Widget Build_Logout(BuildContext context) {
  return Container(
    child: RaisedButton(
      elevation: 5.0,
      onPressed: () async {
        await CacheHelper.RemoveData(key: 'userName');
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }));
      },
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.blueAccent,
      child: Text(
        'Log out',
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}
