//import 'package:task_planter/main.dart';
import 'main.dart';
import 'mood.dart';
import 'calendar.dart';
import 'plants.dart';
import 'task.dart';
import 'package:flutter/material.dart';

class Homelay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      // mainAxisSize: 750,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            alignment: Alignment.topCenter,
            color: const Color.fromARGB(255, 255, 184, 133),
            width: 350,
            height: 100,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Welcome back $inputText !",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color.fromARGB(255, 168, 76, 58),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              const Text(
                "How are you feeling?",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color.fromARGB(255, 168, 76, 58),
                ),
              ),
            ])),
        Container(),
        Container(),
      ],
    ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage();

  static final String home = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            //leading: Navigator.pop(),
            centerTitle: true,
            title: const Text('Task Planter', style: TextStyle(fontSize: 34))),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/cat3.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Homelay()),
        bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: home,
                  backgroundColor: const Color(0xFFB3F39B)),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.checklist_rtl),
                  label: home,
                  backgroundColor: const Color(0xFFB3F39B)),
              BottomNavigationBarItem(
                icon: const Icon(Icons.calendar_today),
                label: home,
                backgroundColor: const Color(0xFFB3F39B),
              ),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.spa_outlined),
                  label: home,
                  backgroundColor: const Color(0xFFB3F39B)),
              BottomNavigationBarItem(
                icon: const Icon(Icons.emoji_emotions_outlined),
                label: home,
                backgroundColor: const Color(0xFFB3F39B),
              ),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: 0,
            selectedItemColor: const Color(0xFF022100),
            unselectedItemColor: const Color(0xFF2E5627),
            iconSize: 40,
            onTap: (curr) {
              index = curr;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PageViewDemo()),
              );
            },
            //onTap: _onItemTapped,
            elevation: 5));
  }
}

//Για την πλοήγηση των σελίδων

var index = 0;

class PageViewDemo extends StatefulWidget {
  const PageViewDemo();
  //const PageViewDemo({super.key});
  @override
  State<PageViewDemo> createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  final _controller = PageController(
    initialPage: index,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        const HomePage(),
        TaskPage(),
        CalendarPage(),
        PlantPage(),
        MoodPage()
      ],
    );
  }
}
