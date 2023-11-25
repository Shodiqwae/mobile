import 'package:aplikasi/Home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Splash());
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}


class _SplashState extends State<Splash> 
  with TickerProviderStateMixin {
    late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this, 
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();

    // Add a delay of 2 seconds before navigating to the Home screen
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return Home();
        }),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(scale: _animation,
        child:  GestureDetector(
          child: Image(image: AssetImage("images/Logo-Spash.png")),
         
        ),),       
      )
    );
  }
}

 
