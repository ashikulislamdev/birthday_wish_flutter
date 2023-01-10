import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart' as my_clipper;
import 'package:confetti/confetti.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rabiull Hassan Birthday',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ConfettiController? confettiCenterRight;
  ConfettiController? confettiCenterLeft;
  Timer? timer;
  int startTime = 0;
  Future <void> startTimer() async{
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec , (Timer timer) => setState(() {
      if (startTime==21) {
        confettiCenterRight!.play();
        confettiCenterLeft!.play();
        timer.cancel();
      }else{
        startTime = startTime + 1;
      }
    }));
  }

  @override
  void initState() {
    confettiCenterRight = ConfettiController(duration: const Duration(seconds: 1));
    confettiCenterLeft = ConfettiController(duration: const Duration(seconds: 1));

    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    confettiCenterLeft!.dispose();
    confettiCenterRight!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    startTimer();
    return Scaffold(
      bottomNavigationBar: const SizedBox(
        height: 50,
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Color(0xD2E0208A),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context) => const NextScreen()));
        },
        backgroundColor: Color.fromARGB(184, 6, 35, 202),
        tooltip: 'Start Wishing...!',
        child: const Icon(Icons.play_circle_outline, size: 45, color: Color.fromARGB(184, 255, 255, 255),),
        // child: ,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Column(
          children: [
            ClipPath(
              clipper: my_clipper.WaveClipperTwo(),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/nsda-ctg.jpg"), fit: BoxFit.fill )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text("$startTime", style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900),),
              ),
            ),
            Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: ConfettiWidget(
                  confettiController: confettiCenterRight!,
                  blastDirection: pi, // radial value - LEFT
                  particleDrag: 0.05, // apply drag to the confetti
                  emissionFrequency: 0.05, // how often it should emit
                  numberOfParticles: 20, // number of particles to emit
                  gravity: 0.05, // gravity - or fall speed
                  shouldLoop: false,
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink
                  ], // manually specify the colors to be used
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: ConfettiWidget(
                  confettiController: confettiCenterLeft!,
                  blastDirection: 0, // radial value - RIGHT
                  emissionFrequency: 0.6,
                  minimumSize: const Size(10,
                      10), // set the minimum potential size for the confetti (width, height)
                  maximumSize: const Size(50,
                      50), // set the maximum potential size for the confetti (width, height)
                  numberOfParticles: 1,
                  gravity: 0.1,
                ),
              ),
             Center(
               child: Column(
                 children: const [
                   Text("Happy",style: TextStyle(color: Color(0xff13195b),fontWeight: FontWeight.w900,fontSize: 80),),
                   SizedBox(height: 2,),
                   Text("BirthDay",style: TextStyle(color: Color(0xff13195b),fontWeight: FontWeight.w900,fontSize: 40),),
                   
                 ],
               ),
             )
            ],
          )
          ],
        ),
      ),
    );
  }
}

