import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



void main() {
  runApp(MyApp());
}

class SignUpData{
  final IconData icon;
  final String signUpType;
  final Color buttonColor;

  SignUpData(this.icon, this.signUpType, this.buttonColor);
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<SignUpData> _SignUpDataList = [
    SignUpData(FontAwesomeIcons.solidEnvelope, 'E-mail', Colors.amber),
    SignUpData(FontAwesomeIcons.facebookF, 'Facebook', Colors.blue),
    SignUpData(FontAwesomeIcons.google, 'Google', Colors.red),
    SignUpData(FontAwesomeIcons.apple, 'Apple', Colors.black),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://www.pptgrounds.com/wp-content/uploads/2018/05/Red-Business-PPT-Backgrounds-800x600.jpg'),
              fit: BoxFit.cover
            )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Placeholder()),
                Row(
                  children: [
                    Expanded(child: Divider(thickness: 2.0, color: Colors.grey[200],endIndent: 8, indent: 16,)),
                    Text("어플 시작하기",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[200],
                    ),),
                    Expanded(child: Divider(thickness: 2.0, color: Colors.grey[200],endIndent: 16, indent: 8,)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _SignUpDataList.map(_bottomSignUpButton).toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomSignUpButton(SignUpData signUpData) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0 ),
      child: Column(
        children: [
          RawMaterialButton(
            onPressed: (){},
            child: Icon(signUpData.icon, color: Colors.white,size:30),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: signUpData.buttonColor,
            padding: EdgeInsets.all(16.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top:4.0),
            child: Text(signUpData.signUpType,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),),
          )
        ],
      ),
    );
  }
}
