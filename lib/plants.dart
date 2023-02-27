import 'package:flutter/material.dart';
import 'home.dart';
import 'main.dart';

class PlantPage extends StatelessWidget {
  static final String home = 'Plants';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: () {
                index = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PageViewDemo()),
                );
              },
              child: const Icon(
                Icons.home,
                size: 40,
                color: Color(0xFF2E5627),
              ),
            ),
            centerTitle: true,
            title: const Text('Greenhouse', style: TextStyle(fontSize: 34))),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/cat3.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: PlantList()),
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
            currentIndex: 3,
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

class PlantList extends StatelessWidget {
  PlantList({super.key});
  var plants = tasks.where((o) => o.completed == 'yes');
  @override
  Widget build(BuildContext context) {
    //const title = 'Grid List';

    return Container(
        color: const Color.fromARGB(255, 255, 184, 133),
        child: GridView(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          //crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          padding: const EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: plants
              .map((el) => ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 700),
                    child: Column(children: [
                      Image(image: AssetImage("assets/images/${el.type}.png")),
                      Text(el.name),
                    ]),
                    // Text(el.name)
                  ))
              .toList(),
        ));
  }
}
