// ignore_for_file: library_private_types_in_public_api

import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState(){
        
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    
    
    super.initState();


  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text("Floating Action Bubble",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
      ),
      //Init Floating Action Bubble
      floatingActionButton: FloatingActionBubble(
        // Menu items
        items: <Bubble>[
          // Floating action menu item
          Bubble(
            title:"Settings",
            iconColor :Colors.white,
            bubbleColor : Colors.green,
            icon:Icons.settings,
            titleStyle:const TextStyle(fontSize: 16 , color: Colors.white),
            onPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const Homepage()));
              _animationController.reverse();
            },
          ),
          // Floating action menu item
          Bubble(
            title:"Profile",
            iconColor :Colors.white,
            bubbleColor : Colors.green,
            icon:Icons.people,
            titleStyle:const TextStyle(fontSize: 16 , color: Colors.white),
            onPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const Homepage()));
              _animationController.reverse();
            },
          ),
          //Floating action menu item
          Bubble(
            title:"Home",
            iconColor :Colors.white,
            bubbleColor : Colors.green,
            icon:Icons.home,
            titleStyle:const TextStyle(fontSize: 16 , color: Colors.white),
            onPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const Homepage()));
              _animationController.reverse();
            },
          ),
        ],
        // animation controller
        animation: _animation,
        // On pressed change animation state
        onPress: () => _animationController.isCompleted
          ? _animationController.reverse()
          : _animationController.forward(),
        iconColor: Colors.white,
        iconData: Icons.add_rounded,
        backGroundColor: Colors.green,
      )
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text("Home Page",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
      ),
      body: const Center(
        child: Text("Successoft Infotech",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
    );
  }
}