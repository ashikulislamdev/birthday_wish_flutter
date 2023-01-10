import 'package:flutter/material.dart';
import 'package:rabiull_hassan_birthday/shake_widget.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2, 
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: const Color(0xffE64215),
            centerTitle: true,
            title: const Text("Rabiull's Birthday", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
            bottom: const TabBar(tabs: [
              Tab(text: "Wishing",),
              Tab(text: "Memories",),
            ]),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                child: Card(
                  elevation: 8,
                  color: Colors.blueAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        
                        
                        const SizedBox(height: 16,),
                        
                        TweenAnimationBuilder(
                          onEnd: () {
                            
                          },
                          tween: Tween<double>(begin: 15, end: 20),
                          duration: const Duration(seconds: 5), 
                          builder: (BuildContext context, double fontSize, Widget? child) {
                            return Text("I am wishing you a day that's as unique and extraordinary as you are!", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),);
                          },
                        ), 
                        const SizedBox(height: 20,),
                        
                        TweenAnimationBuilder(
                          onEnd: () {
                            
                          },
                          tween: Tween<double>(begin: 20, end: 15),
                          duration: const Duration(seconds: 5), 
                          builder: (BuildContext context, double fontSize, Widget? child) {
                            return Text("I hope Ur Birthday is as sweet as your smile. And the year.", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),);
                          },
                        ), 
                        const Spacer(),
                        TweenAnimationBuilder(
                          onEnd: () {
                            
                          },
                          tween: Tween<double>(begin: 10, end: 20),
                          duration: const Duration(seconds: 2), 
                          builder: (BuildContext context, double fontSize, Widget? child) {
                            return Text("My life would suck without you.", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),);
                          },
                        ), 
                        const Spacer(),
                        TweenAnimationBuilder(
                          onEnd: () {
                            
                          },
                          tween: Tween<double>(begin: 10, end: 20),
                          duration: const Duration(seconds: 10), 
                          builder: (BuildContext context, double fontSize, Widget? child) {
                            return Text("If you’re waiting on your birthday gift, close your eyes and make a wish. Surprise, it’s me! Happy birthday!", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.white),);
                          },
                        ), 
                        const Spacer(),
                        ShakeWidget(
                          child: Row(
                            children: const [
                              Text("Presented by - ashikulislamdev", style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 243, 19, 19),
                              fontFamily: 'OleoScript'),),
                              CircleAvatar(
                                backgroundImage: AssetImage("assets/saun.jpg"),
                                radius: 20,
                              )
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                child: Card(
                  elevation: 10,
                    shadowColor: Colors.blueAccent,
                  child: ListView(
                    children: const [
                      Image(image: AssetImage("assets/rabiullhassandev.png"),fit: BoxFit.fitWidth,),
                      Image(image: AssetImage("assets/rabiull-asikul.jpg"),fit: BoxFit.fitWidth,),
                      Image(image: AssetImage("assets/image-1.jpg"),fit: BoxFit.fitWidth,),
                      Image(image: AssetImage("assets/nsda-ctg.jpg"),fit: BoxFit.fitWidth,),
                      Image(image: AssetImage("assets/image-2.jpg"),fit: BoxFit.fitWidth,),
                      Image(image: AssetImage("assets/tambonile.png"),fit: BoxFit.fitWidth,),
                      Image(image: AssetImage("assets/image-3.jpg"),fit: BoxFit.fitWidth,),
                    ],
                  ),
                ),
              ),
            ]
          ),
        )
      ),
    );
  }
}