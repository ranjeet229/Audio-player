import 'dart:async';

import 'package:audio_player/pages/SongPage.dart';
import 'package:flutter/material.dart';




class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  _SplaceScreenState createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  final List<double> _listRadius = [200.0, 250.0];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      lowerBound: 0.5,
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.repeat();
    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context)=> SongPage(),));
    });

  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ..._listRadius.map((radius) {
              final double size = radius * _animation.value;
              final double opacity = 1.0 - _animation.value;
              return Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow.withOpacity(opacity),
                ),
              );
            }).toList(),
            Image.asset(
              'assets/icons/music.png',
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
