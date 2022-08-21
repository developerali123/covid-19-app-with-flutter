import 'package:covid19_app/homepage.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> with TickerProviderStateMixin {
  late final AnimationController _controller=AnimationController(duration: const Duration(seconds: 3),
      vsync: this)..repeat();
  @override
  void initState(){
    super.initState();
    _navigate();
  }

  void _navigate() async{
    await Future.delayed(Duration(milliseconds: 5000),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(animation: _controller,child: Container(
              height: 200,
              width: 200,
              child: const Center(
                child: Image(height: 500,width:500,
                    image: NetworkImage('https://img.icons8.com/external-flaticons-lineal-color-flat-icons/344/external-virus-hygiene-flaticons-lineal-color-flat-icons-2.png')),
              ),
            ), builder: (context,Widget?child){
              return Transform.rotate(angle: _controller.value*2.0*math.pi,child: child,);
            }),
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.center,
              child: Text('Covid-19/Tracker App',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),
            )
          ],
        ),
      ),
    );
  }
}
