import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/services/api.dart';
import 'package:flutter_assignment/views/list_page.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  PlayArea _playArea = new PlayArea();

  void player() async {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        PageTransition(
          child: ListPage(),
          type: PageTransitionType.rightToLeftWithFade,
          duration: Duration(milliseconds: 300)
        )
      );
    });
  }

  @override
  void initState() {
    
    _playArea.callData();
    player();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(              
              height: 600,
              width: double.infinity,              
              child: FlareActor(
                'assets/animation/playonn-intro.flr',
                animation: 'play',
                sizeFromArtboard: false,
              )
            ),
          )
        ],
      )
    );
  }
}