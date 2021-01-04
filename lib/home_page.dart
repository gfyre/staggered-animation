import 'package:flutter/material.dart';
import 'home_page_enter.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key key,
    @required AnimationController controller,
  })  : animation = HomePageEnterAnimation(controller),
        super(key: key);

  final HomePageEnterAnimation animation;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedBuilder(
        animation: animation.controller,
        builder: (context, child) => _buildAnimation(context, child, size),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child, Size size) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: Stack(
            overflow: Overflow.visible,
            children: [
              topBar(animation.barHeight.value),
              circle(size, animation.avatarSize.value),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SizedBox(height: 60),
              Opacity(
                opacity: animation.titleOpacity.value,
                child: placeholderBox(28, 150, Alignment.centerLeft),
              ),
              SizedBox(height: 8),
              Opacity(
                opacity: animation.textOpacity.value,
                child:
                    placeholderBox(305, double.infinity, Alignment.centerLeft),
              ),
            ],
          ),
        )
      ],
    );
  }

  Container topBar(double height) {
    return Container(
      height: height,
      width: double.infinity,
      color: Colors.blue,
    );
  }

  Positioned circle(Size size, double animationValue) {
    return Positioned(
      top: 200,
      left: size.width / 2 - 50,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          animationValue,
          animationValue,
          1,
        ),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.blue.shade700,
          ),
        ),
      ),
    );
  }
}

Align placeholderBox(double height, double width, Alignment alignment) {
  return Align(
    alignment: alignment,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.shade300,
      ),
    ),
  );
}
