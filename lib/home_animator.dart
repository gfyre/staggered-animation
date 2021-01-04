import 'package:flutter/material.dart';
import 'home_page.dart';

class HomeAnimator extends StatefulWidget {
  @override
  _HomeAnimatorState createState() => _HomeAnimatorState();
}

class _HomeAnimatorState extends State<HomeAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HomePage(
      controller: _controller,
    );
  }
}
