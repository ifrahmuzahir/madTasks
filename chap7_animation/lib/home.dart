import 'package:chap7_animation/widgets/animated_cross_fade..dart';
import 'package:chap7_animation/widgets/animated_opacity.dart';
import 'package:flutter/material.dart';
import 'package:chap7_animation/widgets/animation_container.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get flexibleSpace => null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AnimatedContainerWidget(),
            Divider(),
            AnimatedCrossFadeWidget(),
            Divider(),
            AnimatedOpacityWidget(),
          ],
        ),
      ),
    );
  }
}
