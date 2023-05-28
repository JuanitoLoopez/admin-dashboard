import 'package:flutter/material.dart';

class TwitterBackground extends StatelessWidget {
  const TwitterBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBackgroundImage(),
      child: Container(
        constraints: const BoxConstraints( maxWidth: 350),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Image(
              image: AssetImage('twitter-white-logo.png'),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBackgroundImage() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('twitter-bg.png'),
        fit: BoxFit.cover
      )
    );
  }
}